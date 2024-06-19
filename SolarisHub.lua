local StarterGui = game:GetService("StarterGui")

local function PrisonLife()
   local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
   
   local Window = Library.CreateLib("Solaris Hub", "DarkTheme")

   local LocalPlayerTab = Window:NewTab("Local Player")
   local CombatTab = Window:NewTab("Combat")
   local UtilitiesTab = Window:NewTab("Utilities")
   local MiscellaneousTab = Window:NewTab("Miscellaneous")
   local TeleportationTab = Window:NewTab("Teleportation")
   local CreditsTab = Window:NewTab("Credits")

   LocalPlayerTab:NewSlider("WalkSpeed", "Makes your faster", 500, 16, function(v)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
   end)

   LocalPlayerTab:NewSlider("JumpPower", "Makes your jump power high", 500, 50, function(v)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
   end)

    LocalPlayerTab:NewButton("Guards", "Become a guards team", function()
      game.Workspace.Remote.TeamEvent:FireServer("Bright blue")
    end)

    LocalPlayerTab:NewButton("Inmates", "Become a inamtes team", function()
      game.Workspace.Remote.TeamEvent:FireServer("Bright orange")
    end)

    LocalPlayerTab:NewButton("Criminals", "Become a criminal team", function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-976.125183, 109.123924, 2059.99536)
      wait(0.1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918.77,100,2379.07)
    end)

    LocalPlayerTab:NewButton("Serverhop", "Change the server", function()
      local Http = game:GetService("HttpService") local TPS = game:GetService("TeleportService") local Api = "https://games.roblox.com/v1/games/" local _place = game.PlaceId local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100" function ListServers(cursor) local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or "")) return Http:JSONDecode(Raw) end local Server, Next; repeat local Servers = ListServers(Next) Server = Servers.data[1] Next = Servers.nextPageCursor until Server TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
    end)

    LocalPlayerTab:NewButton("Rejoin", "Rejoin the same server", function()
         game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end)

    CombatTab:NewDropdown("Guns Mod", "Makes the gun op", {"M9", "Remington 870", "Ak-47"}, function(v)
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

   local function Crash(module, FireGun)
      local Gun = "Remington 870"
      local Player = game.Players.LocalPlayer.Name
      game.workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver[Gun].ITEMPICKUP)

      for i,v in pairs(game.Players[Player].Backpack:GetChildren()) do
         if v.name == (Gun) then
            v.Parent = game.Players.LocalPlayer.Character
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

         Gun = game.Players[Player].Character[Gun]
         game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()

         
         function FireGun(Target)
            coroutine.resume(coroutine.create(function()
               local bulletTable = {}

               table.insert(bulletTable, {
                  Hit = Target,
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
      end
   end

   CombatTab:NewButton("Get Guns", "Get all the guns", function()
         local Start = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Prison_ITEMS"].giver.M9.ITEMPICKUP.CFrame
         wait(0.2)
         game.Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver.M9.ITEMPICKUP)

         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP.CFrame
         wait(0.2)
         game.Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP)

         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Prison_ITEMS"].giver["AK-47"].ITEMPICKUP.CFrame
         wait(0.2)
         game.Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver["AK-47"].ITEMPICKUP)

         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Start
    end)

    
   CombatTab:newButton("Crash Server", "makes your server crash", function()
      local Start = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP.CFrame
      wait(0.2)
      game.Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP)

      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Start

      Crash()
   end)

   CombatTab:newButton("M9", "Get the M9", function()
         local Start = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Prison_ITEMS"].giver.M9.ITEMPICKUP.CFrame
         wait(0.2)
         game.Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver.M9.ITEMPICKUP)

         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Start
   end)

   CombatTab:newButton("Remington 870", "Get the Remington 870", function()
         local Start = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP.CFrame
         wait(0.2)
         game.Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP)

         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Start
   end)

   CombatTab:newButton("AK-47", "Get the AK-47", function()
         local Start = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Prison_ITEMS"].giver["AK-47"].ITEMPICKUP.CFrame
         wait(0.2)
         game.Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver["AK-47"].ITEMPICKUP)

         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Start
   end)

   UtilitiesTab:newToggle("Doors", "Toggle for doors", true, function()
         if game.Workspace:FindFirstChild("Doors") then
            game.Workspace.Doors.Parent = game.Lighting
         else
            game.Lighting.Doors.Parent = game.Workspace
         end
   end)

   UtilitiesTab:newToggle("Fences", "Toggle for fences", true, function()
      if game.Workspace:FindFirstChild("Prison_Fences") then
         game.Workspace.Prison_Fences.Parent = game.Lighting
      else
         game.Lighting.Prison_Fences.Parent = game.Workspace
      end
end)

   TeleportationTab:NewButton("Outside Prison", "Teleport to outside prison", function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(288.452, 69.999, 2206.731)
   end)

   TeleportationTab:NewButton("Yard", "Teleport to yard", function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(779.092, 96.001, 2451.114)
   end)

   TeleportationTab:NewButton("Tower", "Teleport to tower", function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(822, 131, 2588)
   end)

   TeleportationTab:NewButton("Cafeteria", "Teleport to cafeteria", function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(930, 97.54, 2291)
   end)

   TeleportationTab:NewButton("Kitchen", "Teleport to kitchen", function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(906.641845703125, 99.98993682861328, 2237.67333984375)
   end)

   TeleportationTab:NewButton("Cells", "Teleport to cells", function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918, 97.73, 2447)
   end)

   TeleportationTab:NewButton("Police Room", "Teleport to police room", function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(836.5386352539062, 99.98998260498047, 2320.604248046875)
   end)

   TeleportationTab:NewButton("Police Armory", "Teleport to police room", function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(837.2889404296875, 99.98998260498047, 2270.99658203125)
   end)

   TeleportationTab:NewButton("Sewer Enterance", "Teleport to sewer enterance", function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(917.174, 76.406, 2426.199)
   end)

   TeleportationTab:NewButton("Sewer Exit", "Teleport to sewer exit", function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(916.506, 96.285, 2111.396)
   end)

   TeleportationTab:NewButton("Secret Room", "Teleport to secret room", function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(697, 97.492, 2364)
   end)

   TeleportationTab:NewButton("Surveilance Room", "Teleport to surveilance room", function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(795.251953125, 99.98998260498047, 2327.720703125)
   end)

   TeleportationTab:NewButton("Criminal Base", "Teleport to criminal base", function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-975.8451538085938, 109.32379150390625, 2053.11376953125)
   end)

   CreditsTab:NewButton("Discord Invite", "Invite", function()
      getgenv().InviteCode = "WYUAaEEbar"
      loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaQLeak/Scripts/main/Discord-Auto-Join.lua"))()
   end)
end

if game.PlaceId == 155615604 then
   PrisonLife()
end
