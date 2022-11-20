if game.PlaceId == 155615604 then
        local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
        local Window = Library.CreateLib("Solaris Hub (Prison Life)", "DarkTheme")

        local Workspace = game:GetService("Workspace")
        local StarterGui = game:GetService("StarterGui")
        local TeleportService = game:GetService("TeleportService")
        local Player = game.Players.LocalPlayer

        local Main = Window:NewTab("Main")
        local MainSection = Main:NewSection("Welcome "..Player.Name)
     
        MainSection:NewDropdown("Give Gun", "Gives the localplayer a gun", {"M9", "Remington 870", "AK-47"}, function(v)
            local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver[v].ITEMPICKUP
            local Event = game:GetService("Workspace").Remote.ItemHandler
            Event:InvokeServer(A_1)
        end)
     
        MainSection:NewDropdown("Gun Mod", "Makes the gun op", {"M9", "Taser", "Remington 870", "AK-47"}, function(v)
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
            end
        end)
     
        local Player = Window:NewTab("local Player")
        local PlayerSection = Player:NewSection("local Player")
     
        PlayerSection:NewSlider("Walkspeed", "Changes the walkspeed", 250, 16, function(v)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
        end)
     
        PlayerSection:NewSlider("Jumppower", "Changes the jumppower", 250, 50, function(v)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
        end)
   
        PlayerSection:NewButton("Fast respawn", "Your charachter will respawn",  function()
           local A_1 = "\66\114\111\121\111\117\98\97\100\100"
           local Event = game:GetService("Workspace").Remote.loadchar
           Event:InvokeServer(A_1)
        end)
   
        PlayerSection:NewButton("Rejoin", "Rejoin same server", function()
           TeleportService:Teleport(game.PlaceId, game.Players.LocalPlayer)
        end)
   
        PlayerSection:NewLabel("Change Teams")
   
        PlayerSection:NewButton("Guards", "Change to guards team", function()
           workspace.Remote.TeamEvent:FireServer("Bright blue")
        end)
   
        PlayerSection:NewButton("Inmates", "Change to inmates team", function()
           workspace.Remote.TeamEvent:FireServer("Bright orange")
        end)
   
        PlayerSection:NewButton("Neutral", "Change to neutral team", function()
           workspace.Remote.TeamEvent:FireServer("Medium stone grey")
        end)
   
        PlayerSection:NewLabel("Teleport Location")
        
        PlayerSection:NewButton("Outside Prison", "Teleport to outside prison", function()
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(288.452, 69.999, 2206.731)
        end)
        
        PlayerSection:NewButton("Yard", "Teleport to yard", function()
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(779.092, 96.001, 2451.114)
        end)
        
        PlayerSection:NewButton("Tower", "Teleport to tower", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(822, 131, 2588)
        end)

        PlayerSection:NewButton("Cafeteria", "Teleport to cafeteria", function()
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(930, 97.54, 2291)
        end)
   
        PlayerSection:NewButton("Kitchen", "Teleport to kitchen", function()
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(906.641845703125, 99.98993682861328, 2237.67333984375)
        end)
   
        PlayerSection:NewButton("Cells", "Teleport to cells", function()
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918, 97.73, 2447)
        end)
   
        PlayerSection:NewButton("Police Room", "Teleport to police room", function()
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(836.5386352539062, 99.98998260498047, 2320.604248046875)
        end)
   
        PlayerSection:NewButton("Police Armory", "Teleport to police room", function()
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(837.2889404296875, 99.98998260498047, 2270.99658203125)
        end)
   
        PlayerSection:NewButton("Sewer Enterance", "Teleport to sewer enterance", function()
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(917.174, 76.406, 2426.199)
        end)
   
        PlayerSection:NewButton("Sewer Exit", "Teleport to sewer exit", function()
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(916.506, 96.285, 2111.396)
        end)
   
        PlayerSection:NewButton("Secret Room", "Teleport to secret room", function()
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(697, 97.492, 2364)
        end)
   
        PlayerSection:NewButton("Surveilance Room", "Teleport to surveilance room", function()
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(795.251953125, 99.98998260498047, 2327.720703125)
        end)
   
        PlayerSection:NewButton("Criminal Base", "Teleport to criminal base", function()
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-975.8451538085938, 109.32379150390625, 2053.11376953125)
        end)
   
        local ServerClient = Window:NewTab("Server Client")
        local ServerSection = ServerClient:NewSection("Server Client")
   
        ServerSection:NewButton("Server Crash", "Make Server Crash", function()
           game.StarterGui:SetCore("SendNotification", {
           Title = "Sever Crash";
           Text = "The Server will crash in 30 seconds";
           Duration = 5,
   
               })
   
               wait(30)
                   local Gun = "Remington 870"
                   local Player = game.Players.LocalPlayer.Name
                   game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver[Gun].ITEMPICKUP)
                   for i,v in pairs(game.Players[Player].Backpack:GetChildren()) do
                       if v.name == (Gun) then
                           v.Parent = game.Players.LocalPlayer.Character
                       end
                   end
                   
                   Gun = game.Players[Player].Character[Gun]
                   
                   game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
   
                   function FireGun(target)
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
   
        ServerSection:NewButton("Open Gate", "The gate will open", function()
         workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.buttons["Prison Gate"]["Prison Gate"])
     end)
   
        ServerSection:NewToggle("Doors", "Toogle for door remove and restore", function()
           if workspace:FindFirstChild("Doors") then
               workspace.Doors.Parent = game.Lighting
               
               else
                   game.Lighting.Doors.Parent = workspace
            end
        end)
   
        ServerSection:NewToggle("Fences", "Toogle for fences remove and restore", function()
           if workspace:FindFirstChild("Prison_Fences") then
               workspace.Prison_Fences.Parent = game.Lighting
               
               else
                   game.Lighting.Prison_Fences.Parent = workspace
            end
        end)
    end