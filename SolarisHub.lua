if game.PlaceId == 155615604 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Solaris Hub (Prison Life)", "DarkTheme")

    local Workspace = game:GetService("Workspace")
    local StarterGui = game:GetService("StarterGui")
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")

    local Main = Window:NewTab("Main")
    local MainSection = Main:NewSection("Main")
 
    MainSection:NewDropdown("Give Gun", "Gives the localplayer a gun", {"M9", "Remington 870", "AK-47"}, function(v, abc)
        local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver[v].ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)

        select = abc
    end)
 
    MainSection:NewDropdown("Gun Mod", "Makes the gun op", {"M9", "Taser", "Remington 870", "AK-47"}, function(v, abc)
        local module = nil
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Character[v].GunStates)
        end
        if module ~= nil then
            module["MaxAmmo"] = math.huge
            module["CurrentAmmo"] = math.huge
            module["StoredAmmo"] = math.huge
            module["FireRate"] = 0.000001
            module["Spread"] = 0
            module["Range"] = math.huge
            module["Bullets"] = 10
            module["ReloadTime"] = 0.000001
            module["AutoFire"] = true

            select = abc
        end
    end)
 
    local LocalPlayer = Window:NewTab("Local Player")
    local LocalPlayerSection = LocalPlayer:NewSection("Local Player")
 
    LocalPlayerSection:NewSlider("Walkspeed", "Makes your faster", 250, 16, function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
 
    LocalPlayerSection:NewSlider("Jumppower", "Makes your jump power high", 250, 50, function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)

    LocalPlayerSection:NewButton("Fast Respawn", "It makes respawn quickly",  function()
       local A_1 = "\66\114\111\121\111\117\98\97\100\100"
       local Event = game:GetService("Workspace").Remote.loadchar
       Event:InvokeServer(A_1)
    end)

    LocalPlayerSection:NewButton("ServerHop", "Change the server", function()
        local Http = game:GetService("HttpService") local TPS = game:GetService("TeleportService") local Api = "https://games.roblox.com/v1/games/" local _place = game.PlaceId local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100" function ListServers(cursor) local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or "")) return Http:JSONDecode(Raw) end local Server, Next; repeat local Servers = ListServers(Next) Server = Servers.data[1] Next = Servers.nextPageCursor until Server TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
     end)

     LocalPlayerSection:NewButton("Rejoin", "Rejoin the same server", function()
       TeleportService:Teleport(game.PlaceId, game.Players.LocalPlayer)
    end)

    LocalPlayerSection:NewLabel("Select Players")

    Players = {}

    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        table.insert(Players,v.Name)
    end

    LocalPlayerSection:NewDropdown("Select Player", "Click the name", Players, function(abc)
        select = abc
    end)

    LocalPlayerSection:NewButton("Refresh ", "", function()
        table.clear(Players)
        for i,v in pairs(game:GetService("Players"):GetChildren()) do
            table.insert(Players,v.Name)
        end
    end)

    LocalPlayerSection:NewButton("Teleport", "", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[select].Character.HumanoidRootPart.CFrame
    end)

    LocalPlayerSection:NewLabel("Change Teams")

    LocalPlayerSection:NewButton("Guards", "Become a guards", function()
       workspace.Remote.TeamEvent:FireServer("Bright blue")
    end)

    LocalPlayerSection:NewButton("Inmates", "Become a inmate", function()
       workspace.Remote.TeamEvent:FireServer("Bright orange")
    end)

    LocalPlayerSection:NewButton("Neutral", "Become a neutral", function()
       workspace.Remote.TeamEvent:FireServer("Medium stone grey")
    end)

    LocalPlayerSection:NewLabel("Teleport Location")
    
    LocalPlayerSection:NewButton("Outside Prison", "Teleport to outside prison", function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(288.452, 69.999, 2206.731)
    end)
    
    LocalPlayerSection:NewButton("Yard", "Teleport to yard", function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(779.092, 96.001, 2451.114)
    end)
    
    LocalPlayerSection:NewButton("Tower", "Teleport to tower", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(822, 131, 2588)
    end)

    LocalPlayerSection:NewButton("Cafeteria", "Teleport to cafeteria", function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(930, 97.54, 2291)
    end)

    LocalPlayerSection:NewButton("Kitchen", "Teleport to kitchen", function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(906.641845703125, 99.98993682861328, 2237.67333984375)
    end)

    LocalPlayerSection:NewButton("Cells", "Teleport to cells", function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918, 97.73, 2447)
    end)

    LocalPlayerSection:NewButton("Police Room", "Teleport to police room", function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(836.5386352539062, 99.98998260498047, 2320.604248046875)
    end)

    LocalPlayerSection:NewButton("Police Armory", "Teleport to police room", function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(837.2889404296875, 99.98998260498047, 2270.99658203125)
    end)

    LocalPlayerSection:NewButton("Sewer Enterance", "Teleport to sewer enterance", function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(917.174, 76.406, 2426.199)
    end)

    LocalPlayerSection:NewButton("Sewer Exit", "Teleport to sewer exit", function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(916.506, 96.285, 2111.396)
    end)

    LocalPlayerSection:NewButton("Secret Room", "Teleport to secret room", function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(697, 97.492, 2364)
    end)

    LocalPlayerSection:NewButton("Surveilance Room", "Teleport to surveilance room", function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(795.251953125, 99.98998260498047, 2327.720703125)
    end)

    LocalPlayerSection:NewButton("Criminal Base", "Teleport to criminal base", function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-975.8451538085938, 109.32379150390625, 2053.11376953125)
    end)

    local ServerClient = Window:NewTab("Server Client")
    local ServerClientSection = ServerClient:NewSection("Server Client")

    ServerClientSection:NewButton("Server Crash", "Crashing Server", function(FireGun, target)
        local Gun = "Remington 870"
        local Player = game.Players.LocalPlayer.Name
        game.workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver[Gun].ITEMPICKUP)
        for i,v in pairs(game.Players[Player].Backpack:GetChildren()) do
            if v.name == (Gun) then
                v.Parent = game.Players.LocalPlayer.Character
            end
        end
        Gun = game.Players[Player].Character[Gun]
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()

        function FireGun()
            coroutine.resume(coroutine.create(function()
                local bulletTable = {}
                table.insert(bulletTable, {
                    Hit = target,
                    Distance = 100,
                    Cframe = CFrame.new(0,1,1),
                    RayObject = Ray.new(Vector3.new(0.1,0.2), Vector3.new(0.3,0.4))
                })
                game.ReplicatedStorage.ShootEvent:FireServer(bulletTable, Gun)
                wait()
            end))
        end
        while game:GetService("RunService").Stepped:wait() do
            for count = 0, 10, 10 do
                FireGun()
            end
        end
    end)

    ServerClientSection:NewButton("Open Gate", "Makes the gate open for you", function()
     workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.buttons["Prison Gate"]["Prison Gate"])
 end)

 ServerClientSection:NewButton("Arrest all Criminals", "Arrest all criminals", function()
    local Player = game.Players.LocalPlayer
    local cpos = Player.Character.HumanoidRootPart.CFrame
    for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
    if v.Name ~= Player.Name then
    local i = 10
    repeat
    wait()
        i = i-1
        game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
        Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
        until i == 0
    end
end
    Player.Character.HumanoidRootPart.CFrame = cpos
 end)

 ServerClientSection:NewButton("Click Arrest", "Activate click arrest", function()
    local mouse = game.Players.LocalPlayer:GetMouse()

    local arrestEvent = game.Workspace.Remote.arrest
    mouse.Button1Down:connect(function()
        local obj = mouse.Target
		local response = arrestEvent:InvokeServer(obj)
    end)
 end)

 ServerClientSection:NewLabel("Toggle")

 ServerClientSection:NewToggle("Doors", "Toggle for door remove and restore", function()
       if workspace:FindFirstChild("Doors") then
           workspace.Doors.Parent = game.Lighting
           
           else
               game.Lighting.Doors.Parent = workspace
        end
    end)

    ServerClientSection:NewToggle("Fences", "Toggle for fences remove and restore", function()
       if workspace:FindFirstChild("Prison_Fences") then
           workspace.Prison_Fences.Parent = game.Lighting
           
           else
               game.Lighting.Prison_Fences.Parent = workspace
        end
    end)

    ServerClientSection:NewToggle("Full Brightness", "Toggle for full brightness", function()
        if not _G.FullBrightExecuted then
    
            _G.FullBrightEnabled = false
        
            _G.NormalLightingSettings = {
                Brightness = game:GetService("Lighting").Brightness,
                ClockTime = game:GetService("Lighting").ClockTime,
                FogEnd = game:GetService("Lighting").FogEnd,
                GlobalShadows = game:GetService("Lighting").GlobalShadows,
                Ambient = game:GetService("Lighting").Ambient
            }
        
            game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
                if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
                    _G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").Brightness = 1
                end
            end)
        
            game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
                if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
                    _G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").ClockTime = 12
                end
            end)
        
            game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
                if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
                    _G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").FogEnd = 786543
                end
            end)
        
            game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
                if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
                    _G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").GlobalShadows = false
                end
            end)
        
            game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
                if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
                    _G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                end
            end)
        
            game:GetService("Lighting").Brightness = 1
            game:GetService("Lighting").ClockTime = 12
            game:GetService("Lighting").FogEnd = 786543
            game:GetService("Lighting").GlobalShadows = false
            game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
        
            local LatestValue = true
            spawn(function()
                repeat
                    wait()
                until _G.FullBrightEnabled
                while wait() do
                    if _G.FullBrightEnabled ~= LatestValue then
                        if not _G.FullBrightEnabled then
                            game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
                            game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
                            game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
                            game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
                            game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
                        else
                            game:GetService("Lighting").Brightness = 1
                            game:GetService("Lighting").ClockTime = 12
                            game:GetService("Lighting").FogEnd = 786543
                            game:GetService("Lighting").GlobalShadows = false
                            game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                        end
                        LatestValue = not LatestValue
                    end
                end
            end)
        end
        
        _G.FullBrightExecuted = true
        _G.FullBrightEnabled = not _G.FullBrightEnabled
     end)
end
