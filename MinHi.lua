local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
----------------------------------------------------------------------------------------------------------------------------------------------
local Window = Fluent:CreateWindow({
    Title = "Min Gaming Hub",
    SubTitle = "YTB: Min Gaming",
    TabWidth = 155,
    Size = UDim2.fromOffset(500, 350),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Info = Window:AddTab({ Title = "Information Server", Icon = "" }),
    Stats = Window:AddTab({ Title = "Stats", Icon = "" }),
    Player = Window:AddTab({ Title = "Players", Icon = "" }),
    Teleport = Window:AddTab({ Title = "Teleport", Icon = "" }),
    Raid = Window:AddTab({ Title = "Raid", Icon = "" }),
    Race = Window:AddTab({ Title = "RaceV4 + Sea", Icon = "" }),
    S = Window:AddTab({ Title = "Shops", Icon = "" }),
    M = Window:AddTab({ Title = "Miscs", Icon = "" }),
}
local Options = Fluent.Options
do
end
----------------------------------------------------------------------------------------------------------------------------------------------
function UpdateIslandESP() 
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if IslandESP then 
                if v.Name ~= "Sea" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(8, 0, 0)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end

function isnil(thing)
return (thing == nil)
end
local function round(n)
return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
for i,v in pairs(game:GetService'Players':GetChildren()) do
    pcall(function()
        if not isnil(v.Character) then
            if ESPPlayer then
                if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Character.Head)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Character.Head
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size10"
                    name.TextWrapped = true
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance')
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    if v.Team == game.Players.LocalPlayer.Team then
                        name.TextColor3 = Color3.new(0,0,254)
                    else
                        name.TextColor3 = Color3.new(255,0,0)
                    end
                else
                    v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance\nHealth : ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
                end
            else
                if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                    v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end
    end)
end
end
function UpdateChestChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if string.find(v.Name,"Chest") then
            if ChestESP then
                if string.find(v.Name,"Chest") then
                    if not v:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        if v.Name == "Chest1" then
                            name.TextColor3 = Color3.fromRGB(109, 109, 109)
                            name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                        if v.Name == "Chest2" then
                            name.TextColor3 = Color3.fromRGB(173, 158, 21)
                            name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                        if v.Name == "Chest3" then
                            name.TextColor3 = Color3.fromRGB(85, 255, 255)
                            name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                    else
                        v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                    end
                end
            else
                if v:FindFirstChild('NameEsp'..Number) then
                    v:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end
    end)
end
end
function UpdateDevilChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if DevilFruitESP then
            if string.find(v.Name, "Fruit") then   
                if not v.Handle:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Handle)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Handle
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 255, 255)
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                else
                    v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                end
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end
    end)
end
end
function UpdateFlowerChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if v.Name == "Flower2" or v.Name == "Flower1" then
            if FlowerESP then 
                if not v:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    if v.Name == "Flower1" then 
                        name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        name.TextColor3 = Color3.fromRGB(0, 0, 255)
                    end
                    if v.Name == "Flower2" then
                        name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    end
                else
                    v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                end
            else
                if v:FindFirstChild('NameEsp'..Number) then
                v:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end   
    end)
end
end
function UpdateRealFruitChams() 
for i,v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(255, 0, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
for i,v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(255, 174, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
for i,v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(251, 255, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
end

function UpdateIslandESP() 
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if IslandESP then 
                if v.Name ~= "Sea" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(7, 236, 240)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end

function isnil(thing)
return (thing == nil)
end
local function round(n)
return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
for i,v in pairs(game:GetService'Players':GetChildren()) do
    pcall(function()
        if not isnil(v.Character) then
            if ESPPlayer then
                if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Character.Head)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Character.Head
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance')
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    if v.Team == game.Players.LocalPlayer.Team then
                        name.TextColor3 = Color3.new(0,255,0)
                    else
                        name.TextColor3 = Color3.new(255,0,0)
                    end
                else
                    v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance\nHealth : ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
                end
            else
                if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                    v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end
    end)
end
end
function UpdateChestChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if string.find(v.Name,"Chest") then
            if ChestESP then
                if string.find(v.Name,"Chest") then
                    if not v:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        if v.Name == "Chest1" then
                            name.TextColor3 = Color3.fromRGB(109, 109, 109)
                            name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                        if v.Name == "Chest2" then
                            name.TextColor3 = Color3.fromRGB(173, 158, 21)
                            name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                        if v.Name == "Chest3" then
                            name.TextColor3 = Color3.fromRGB(85, 255, 255)
                            name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                    else
                        v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                    end
                end
            else
                if v:FindFirstChild('NameEsp'..Number) then
                    v:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end
    end)
end
end
function UpdateDevilChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if DevilFruitESP then
            if string.find(v.Name, "Fruit") then   
                if not v.Handle:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Handle)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Handle
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 255, 255)
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                else
                    v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                end
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end
    end)
end
end
function UpdateFlowerChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if v.Name == "Flower2" or v.Name == "Flower1" then
            if FlowerESP then 
                if not v:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    if v.Name == "Flower1" then 
                        name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        name.TextColor3 = Color3.fromRGB(0, 0, 255)
                    end
                    if v.Name == "Flower2" then
                        name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    end
                else
                    v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                end
            else
                if v:FindFirstChild('NameEsp'..Number) then
                v:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end   
    end)
end
end
function UpdateRealFruitChams() 
for i,v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(255, 0, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
for i,v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(255, 174, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
for i,v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(251, 255, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
end

spawn(function()
while wait() do
    pcall(function()
        if MobESP then
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v:FindFirstChild('HumanoidRootPart') then
                    if not v:FindFirstChild("MobEap") then
                        local BillboardGui = Instance.new("BillboardGui")
                        local TextLabel = Instance.new("TextLabel")

                        BillboardGui.Parent = v
                        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        BillboardGui.Active = true
                        BillboardGui.Name = "MobEap"
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.LightInfluence = 1.000
                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                        BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                        TextLabel.Parent = BillboardGui
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 200, 0, 50)
                        TextLabel.Font = Enum.Font.GothamBold
                        TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                        TextLabel.Text.Size = 35
                    end
                    local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                    v.MobEap.TextLabel.Text = v.Name.." - "..Dis.." Distance"
                end
            end
        else
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v:FindFirstChild("MobEap") then
                    v.MobEap:Destroy()
                end
            end
        end
    end)
end
end)

spawn(function()
while wait() do
    pcall(function()
        if SeaESP then
            for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                if v:FindFirstChild('HumanoidRootPart') then
                    if not v:FindFirstChild("Seaesps") then
                        local BillboardGui = Instance.new("BillboardGui")
                        local TextLabel = Instance.new("TextLabel")

                        BillboardGui.Parent = v
                        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        BillboardGui.Active = true
                        BillboardGui.Name = "Seaesps"
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.LightInfluence = 1.000
                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                        BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                        TextLabel.Parent = BillboardGui
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 200, 0, 50)
                        TextLabel.Font = Enum.Font.GothamBold
                        TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                        TextLabel.Text.Size = 35
                    end
                    local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                    v.Seaesps.TextLabel.Text = v.Name.." - "..Dis.." Distance"
                end
            end
        else
            for i,v in pairs (game:GetService("Workspace").SeaBeasts:GetChildren()) do
                if v:FindFirstChild("Seaesps") then
                    v.Seaesps:Destroy()
                end
            end
        end
    end)
end
end)

spawn(function()
while wait() do
    pcall(function()
        if NpcESP then
            for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                if v:FindFirstChild('HumanoidRootPart') then
                    if not v:FindFirstChild("NpcEspes") then
                        local BillboardGui = Instance.new("BillboardGui")
                        local TextLabel = Instance.new("TextLabel")

                        BillboardGui.Parent = v
                        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        BillboardGui.Active = true
                        BillboardGui.Name = "NpcEspes"
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.LightInfluence = 1.000
                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                        BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                        TextLabel.Parent = BillboardGui
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 200, 0, 50)
                        TextLabel.Font = Enum.Font.GothamBold
                        TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                        TextLabel.Text.Size = 35
                    end
                    local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                    v.NpcEspes.TextLabel.Text = v.Name.." - "..Dis.." Distance"
                end
            end
        else
            for i,v in pairs (game:GetService("Workspace").NPCs:GetChildren()) do
                if v:FindFirstChild("NpcEspes") then
                    v.NpcEspes:Destroy()
                end
            end
        end
    end)
end
end)
function isnil(thing)
return (thing == nil)
end
local function round(n)
return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)

function UpdateIslandMirageESP() 
for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
    pcall(function()
        if MirageIslandESP then 
            if v.Name == "Mirage Island" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = "Code"
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                end
            end
        else
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end)
end
end

function isnil(thing)
return (thing == nil)
end
local function round(n)
return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)

function UpdateAfdESP() 
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
    pcall(function()
        if AfdESP then 
            if v.Name == "Advanced Fruit Dealer" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = "Code"
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                end
            end
        else
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end)
end
end

function UpdateAuraESP() 
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
    pcall(function()
        if AuraESP then 
            if v.Name == "Master of Enhancement" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = "Code"
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                end
            end
        else
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end)
end
end

function UpdateLSDESP() 
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
    pcall(function()
        if LADESP then 
            if v.Name == "Legendary Sword Dealer" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = "Code"
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                end
            end
        else
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end)
end
end

function UpdateGeaESP() 
for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
    pcall(function()
        if GearESP then 
            if v.Name == "MeshPart" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = "Code"
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                end
            end
        else
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end)
end
end
local Ui = game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules"):FindFirstChild("dsfwefwfwdfsfasdadaxczcw")
if Ui then
    Ui:Destroy()
end
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local tween = game:service"TweenService"
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local GuiService = game:GetService("GuiService")
local SoundClick2 = Instance.new("Sound")
SoundClick2.Name = "Sound Effect"
SoundClick2.SoundId = ""
SoundClick2.Volume = 1
SoundClick2.Parent = game.Workspace
local UIStroke = Instance.new("UIStroke")
local UICorner = Instance.new("UICorner")
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local RobloxButton = Enum.ButtonStyle.RobloxButton
ScreenGui.Parent = game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules")
ScreenGui.Name = "dsfwefwfwdfsfasdadaxczcw"
ImageButton.Parent = ScreenGui
ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton.Size = UDim2.new(0, 45, 0, 45)
ImageButton.Draggable = true
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BackgroundTransparency = 1
ImageButton.Image = "rbxassetid://13717478897"
function LoadFunction()    
        ImageButton.MouseEnter:Connect(function()
        TweenService:Create(
            ImageButton,
            TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 80, 0, 80)}
        ):Play()
    end)
    ImageButton.MouseLeave:Connect(function()
        TweenService:Create(
            ImageButton,
            TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 50, 0, 50)}
        ):Play()
    end)
    local LoadFocus = false
    ImageButton.MouseButton1Down:Connect(function()
        if LoadFocus == false then 
            LoadFocus = false
            TweenService:Create(
                ImageButton,
                TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                {Rotation = 180}
            ):Play()
            SoundClick2:Play()
            TweenService:Create(
                ImageButton,
                TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                {ImageTransparency = 0}
            ):Play()
            wait(.5)
            TweenService:Create(
                ImageButton,
                TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                {Rotation = 0}
            ):Play()
            TweenService:Create(
                ImageButton,
                TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                {ImageTransparency = 0}
            ):Play()
            wait(.5)	
            
        end
    end)
end
LoadFunction()
    ImageButton.MouseButton1Down:connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.RightControl,false,game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false,Enum.KeyCode.RightControl,false,game)
    end)
----------------------------------------------------------------------------------------------------------------------------------------
--Remove Effect
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
	game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy()
end
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
	game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy()
end
spawn(function()
    while task.wait() do
    for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"]:GetChildren()) do
        pcall(function()
            if v.Name == "CurvedRing" or v.Name == "SlashHit" or v.Name == "SwordSlash" then
                v:Destroy()
            end
        end)
    end
    end
    end)
----------------------------------------------------------------------------------------------------------------------------------------
local MainLoader = "https://raw.githubusercontent.com/shlexware/Orion/main/source"
local HirimiHub = loadstring(game:HttpGet((MainLoader)))()
local P = game:GetService("Players")
local LP = P.LocalPlayer
local PG = LP.PlayerGui
local RS = game:GetService("ReplicatedStorage")
local Remotes = RS:WaitForChild("Remotes")
local Remote = Remotes:WaitForChild("CommF_")
local RunS = game:GetService("RunService")
local Loop = RunS.RenderStepped
local Data = LP.Data
local WS = game:GetService("Workspace")
local WO = WS["_WorldOrigin"]
local VU = game:GetService("VirtualUser")
local EnemySpawns = WO.EnemySpawns
local Enemies = WS.Enemies
local CameraShaker = require(RS.Util.CameraShaker)
local GuideModule = require(RS.GuideModule)
local Quests = require(RS.Quests)
local VIM = game:service("VirtualInputManager")
repeat wait() until game:IsLoaded()
if game.PlaceId == 2753915549 then
    Main = true
elseif game.PlaceId == 4442272183 then
    Dressora = true
elseif game.PlaceId == 7449423635 then
    Zou = true
end

function GetDistance(q)
    if typeof(q) == "CFrame" then
        return LP:DistanceFromCharacter(q.Position)
    elseif typeof(q) == "Vector3" then
        return LP:DistanceFromCharacter(q)
    end
end
function TeleportSeaIfWrongSea(world)
    if world == 1 then
        if not game.PlaceId == 2753915549 then
            RS.Remotes.CommF_:InvokeServer("TravelMain")
            wait()
        end
    elseif world == 2 then
        if not game.PlaceId == 4442272183 then
            RS.Remotes.CommF_:InvokeServer("TravelDressrosa")
        end
    elseif world == 3 then
        if not game.PlaceId == 7449423635 then
            RS.Remotes.CommF_:InvokeServer("TravelZou")
        end
    end
end
function Notify(G, H, I)
    if G == nil or G == "" then
        G = "Not Titled"
    end
    if H == nil or H == "" then
        H = "No Any Descriptions"
    end
    if type(I) ~= "number" then
        I = 10
    end
    HirimiHub:MakeNotification({Name = G, Content = H, Image = "rbxassetid://", Time = I})
end

function CheckNearestTeleporter(P)
    local min = math.huge
    local min2 = math.huge
    local choose 
    if Zou then
        TableLocations = {
            ["1"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
            ["2"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
            ["3"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
            ["4"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
            ["5"] = Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
            ["6"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656)
        }
    elseif Dressora then
        TableLocations = {
            ["1"] = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
            ["2"] = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
            ["3"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
            ["4"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
        }
    elseif Main then
        TableLocations = {
            ["1"] = Vector3.new(-7894.6201171875, 5545.49169921875, -380.2467346191406),
            ["2"] = Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
            ["3"] = Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
            ["4"] = Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
        }
    end
    TableLocations2 = {}
    for r, v in pairs(TableLocations) do
        TableLocations2[r] = (v - P.Position).Magnitude
    end
    for r, v in pairs(TableLocations2) do
        if v < min then
            min = v
            min2 = v
        end
    end    
    for r, v in pairs(TableLocations2) do
        if v <= min then
            choose = TableLocations[r]
        end
    end
    if min2 <= GetDistance(P) then
        return choose
    end
end
function ToTween(Positions)
    Distance = (Positions.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 25 then
        Speed = 5000
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Positions
    elseif Distance < 50 then
        Speed = 2000
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Positions
    elseif Distance < 150 then
        Speed = 800
    elseif Distance < 250 then
        Speed = 600
    elseif Distance < 500 then
        Speed = 400
    elseif Distance < 750 then
        Speed = 300
    elseif Distance >= 1000 then
        Speed = 290
    end
    game:GetService("TweenService"):Create(
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = Positions}
    ):Play()
end
function RemoveLvTitle(mob)
    mob = mob:gsub(" %pLv. %d+%p", "")
    return mob
end
function CheckQuest()
    local Lvl = Data.Level.Value
    local IgnoreQuests = {"BartiloQuest", "Trainees", "MarineQuest", "CitizenQuest"}
    local Quest = {}
    local LevelReq = 0
    for i,v in pairs(Quests) do
		for a,b in pairs(v) do
		    for j, k in pairs(b["Task"]) do
		    	if b["LevelReq"] <= Lvl and b["LevelReq"] >= LevelReq and not table.find(IgnoreQuests, i) and k > 1 then		            
			    	Quest["QuestName"] = i
			        Quest["ID"] = a
			        Quest["MobName"] = j
                    LevelReq = b["LevelReq"]
		        end
			end	
		end
	end
	if LevelReq >= 700 and Sea1 then
        Quest["MobName"] = "Galley Captain"
        Quest["QuestName"] = "FountainQuest"
        Quest["ID"] = 2
    elseif LevelReq >= 1450 and Sea2 then
        Quest["MobName"] = "Water Fighter"
        Quest["QuestName"] = "ForgottenQuest"
        Quest["ID"] = 2
    end
	return Quest
end
function QuestDungKo(mob)
    if GuideModule["Data"]["QuestData"]["Name"] == mob then
        return true
    end
    return false
end
for i, v in pairs(CheckQuest()) do
    if typeof(v) ~= "table" then
        print(i, v)
    else
        print(i, #v)
    end
end
function GetMob()
    
end
function GetPosMob(Mob)
    local CFrameTab = {}
	if EnemySpawns:FindFirstChild(Mob) then
    	for i, v in pairs(EnemySpawns:GetChildren()) do
    	    if v:IsA("Part") and v.Name == Mob then
	            table.insert(CFrameTab, v.CFrame)
	        end
	    end
	end
	return CFrameTab
end
function NPCPos()
    for i,v in pairs(GuideModule["Data"]["NPCList"]) do
		if v["NPCName"] == GuideModule["Data"]["LastClosestNPC"] then
			return i["CFrame"]
		end
	end
end
function GetQuest()
    local Distance = GetDistance(NPCPos())
    local questname, id = CheckQuest()["QuestName"], CheckQuest()["ID"]
    if Distance <= 20 then
        Remote:InvokeServer("StartQuest", questname, id)
        NoClip = false
    else
        if Distance > 2000 then
            BypassTele(NPCPos())
        else
            ToTween(NPCPos())
        end
        NoClip = true
    end
    Remote:InvokeServer("SetSpawnPoint")
end
function HopServer(bO)
    if not bO then
        bO = 10
    end
    ticklon = tick()
    repeat
        task.wait()
    until tick() - ticklon >= 1
    local function Hop()
        for r = 1, math.huge do
            if ChooseRegion == nil or ChooseRegion == "" then
                ChooseRegion = "Singapore"
            else
                game:GetService("Players").LocalPlayer.PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text =
                    ChooseRegion
            end
            local bP = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(r)
            for k, v in pairs(bP) do
                if k ~= game.JobId and v["Count"] < bO then
                   game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", k)
                end
            end
        end
        return false
    end
    if not getgenv().Loaded then
        local function bQ(v)
            if v.Name == "ErrorPrompt" then
                if v.Visible then
                    if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                        HopServer()
                        v.Visible = false
                    end
                end
                v:GetPropertyChangedSignal("Visible"):Connect(
                    function()
                        if v.Visible then
                            if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                                HopServer()
                                v.Visible = false
                            end
                        end
                    end
                )
            end
        end
        for k, v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
            bQ(v)
        end
        game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(bQ)
        getgenv().Loaded = true
    end
    while not Hop() do
        wait()
    end
end
local x2Code = {
    "KITTGAMING",
    "ENYU_IS_PRO",
    "FUDD10",
    "BIGNEWS",
    "THEGREATACE",
    "SUB2GAMERROBOT_EXP1",
    "STRAWHATMAIME",
    "SUB2OFFICIALNOOBIE",
    "SUB2NOOBMASTER123",
    "SUB2DAIGROCK",
    "AXIORE",
    "TANTAIGAMIMG",
    "STRAWHATMAINE",
    "JCWK",
    "FUDD10_V2",
    "SUB2FER999",
    "MAGICBIS",
    "TY_FOR_WATCHING",
    "STARCODEHEO",
    "STAFFBATTLE",
    "ADMIN_STRENGTH",
    "DRAGONABUSE",
}
function EClick()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
end

-- [Body Gyro]
spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().TeleportIslando or SeaEvent or getgenv().AutoSeaEvents or getgenv().AutoEvoRace or getgenv().CastleRaid or getgenv().CollectAzure or getgenv().TweenToKitsune or getgenv().AutoCandy or getgenv().GhostShip or getgenv().Ship or getgenv().SailBoat or getgenv().Auto_Holy_Torch or getgenv().FindMirageIsland or getgenv().TeleportPly or getgenv().Tweenfruit or getgenv().AutoFishCrew or getgenv().AutoShark or getgenv().AutoCakeV2 or getgenv().AutoMysticIsland or getgenv().AutoQuestRace or getgenv().AutoBuyBoat or getgenv().dao or getgenv().AutoMirage or getgenv().AutoFarmAcient or getgenv().AutoQuestRace or getgenv().Auto_Law or getgenv().AutoAllBoss or AutoTushita or getgenv().AutoHolyTorch or getgenv().AutoTerrorshark or getgenv().farmpiranya or getgenv().DriveMytic or getgenv().AutoCakeV2V2 or PirateShip or getgenv().AutoSeaBeast or getgenv().AutoNear or getgenv().BossRaid or getgenv().GrabChest or AutoCitizen or getgenv().Ectoplasm or AutoEvoRace or AutoBartilo or AutoFactory or BringChestz or BringFruitz or getgenv().AutoLevel or getgenv().Clip2 or AutoFarmNoQuest or getgenv().AutoBone or AutoFarmSelectMonsterQuest or AutoFarmSelectMonsterNoQuest or getgenv().AutoBoss or AutoFarmBossQuest or AutoFarmMasGun or getgenv().AutoMasFruit or AutoFarmSelectArea or AutoSecondSea or AutoThirdSea or AutoDeathStep or AutoSuperhuman or AutoSharkman or AutoElectricClaw or AutoDragonTalon or AutoGodhuman or AutoRengoku or AutoBuddySword or AutoPole or getgenv().AutoHallowSycthe or AutoCavander or AutoTushita or AutoDarkDagger or getgenv().CakePrince or getgenv().AutoElite or AutoRainbowHaki or AutoSaber or AutoFarmKen or AutoKenHop or AutoKenV2 or getgenv().AutoKillPlayerMelee or getgenv().AutoKillPlayerGun or getgenv().AutoKillPlayerFruit or AutoDungeon or getgenv().AutoNextIsland or AutoAdvanceDungeon or Musketeer or RipIndra or Auto_Serpent_Bow or AutoTorch or AutoSoulGuitar or Auto_Cursed_Dual_Katana or getgenv().AutoMaterial or Auto_Quest_Yama_1 or Auto_Quest_Yama_2 or Auto_Quest_Yama_3 or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or getgenv().Factory or getgenv().SwanGlasses or AutoBartilo or AutoEvoRace or getgenv().Ectoplasm then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            else
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
        end)
    end
end)
--No CLip Auto Farm
spawn(function()
pcall(function()
game:GetService("RunService").Stepped:Connect(function()
if getgenv().TeleportIsland or getgenv().AutoSeaEvents or getgenv().AutoEvoRace or SeaEvents or getgenv().CastleRaid or AutoFarmChest or getgenv().CollectAzure or getgenv().TweenToKitsune or getgenv().AutoCandy or getgenv().GhostShip or getgenv().Ship or getgenv().SailBoat or getgenv().Auto_Holy_Torch or getgenv().Tweenfruit or getgenv().FindMirageIsland or getgenv().TeleportPly or getgenv().AutoFishCrew or getgenv().AutoShark or getgenv().AutoMysticIsland or getgenv().AutoCakeV2 or getgenv().AutoQuestRace or getgenv().AutoBuyBoat or getgenv().dao or getgenv().AutoFarmAcient or getgenv().AutoMirage or getgenv().Auto_Law or getgenv().AutoQuestRace or getgenv().AutoAllBoss or getgenv().AutoHolyTorch or AutoTushita or getgenv().farmpiranya or getgenv().AutoTerrorshark or getgenv().AutoNear or getgenv().AutoCakeV2V2 or PirateShip or getgenv().AutoSeaBeast or getgenv().DriveMytic or getgenv().BossRaid or getgenv().GrabChest or AutoCitizen or getgenv().Ectoplasm or AutoEvoRace or AutoBartilo or AutoFactory or BringChestz or BringFruitz or getgenv().AutoLevel or getgenv().Clip2 or AutoFarmNoQuest or getgenv().AutoBone or AutoFarmSelectMonsterQuest or AutoFarmSelectMonsterNoQuest or getgenv().AutoBoss or AutoFarmBossQuest or AutoFarmMasGun or getgenv().AutoMasFruit or AutoFarmSelectArea or AutoSecondSea or AutoThirdSea or AutoDeathStep or AutoSuperhuman or AutoSharkman or AutoElectricClaw or AutoDragonTalon or AutoGodhuman or AutoRengoku or AutoBuddySword or AutoPole or getgenv().AutoHallowSycthe or AutoCavander or AutoTushita or AutoDarkDagger or getgenv().CakePrince or getgenv().AutoElite or AutoRainbowHaki or AutoSaber or AutoFarmKen or AutoKenHop or AutoKenV2 or getgenv().AutoKillPlayerMelee or getgenv().AutoKillPlayerGun or getgenv().AutoKillPlayerFruit or AutoDungeon or getgenv().AutoNextIsland or AutoAdvanceDungeon or Musketeer or RipIndra or Auto_Serpent_Bow or AutoTorch or AutoSoulGuitar or Auto_Cursed_Dual_Katana or getgenv().AutoMaterial or Auto_Quest_Yama_1 or Auto_Quest_Yama_2 or Auto_Quest_Yama_3 or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or getgenv().Factory or getgenv().SwanGlasses or getgenv().Ectoplasm then
for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
if v:IsA("BasePart") then
v.CanCollide = false
end
end
end
end)
end)
end)


function EWeapon(tool)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(tool) then
        wait(.5)
        Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(tool)
        wait(.5)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
    end
end
function EBuso()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end
function CheckVerRace()
    local v0011 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
    local v0022 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")
    if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V4"
    end
    if v0011 == -2 then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V3"
    end
    if v0022 == -2 then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V2"
    end
    return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V1"
end
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if NoClip then
            if not game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
                local ag = Instance.new("BodyVelocity")
                ag.Velocity = Vector3.new(0, 0, 0)
                ag.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                ag.P = 9000
                ag.Parent = game.Players.LocalPlayer.Character.Head
                for r, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
            for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false    
                end
            end
        elseif not NoClip and game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
            game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity"):Destroy()
        end
    end)
end)
function GetPlayerLevelList(cb)
    namel = {}
    for i,v in pairs(game.Players:GetChildren()) do
        pcall(function()
            if v.Name ~= game.Players.LocalPlayer.Name and v:FindFirstChild("Data") and v.Data.Level and (cb and not cb[v.Name]) and v.Character and (LP.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude <= 15000 then
                namel[v.Name] = v.Data.Level.Value
            end
        end)
    end
    return namel
end
cc2 = {}
function getLowestLevelPlayer()
    if TargetedPlayer then
        return TargetedPlayer
    end
    cc = GetPlayerLevelList(cc2)
    min = 2450
    for r, v in pairs(cc) do
        if v < min then
            min = v
        end
    end
    for r, v in pairs(cc) do
        if v <= min then
            return r
        end
    end
end
function ChestNearF()
    if not WS:FindFirstChild("Chest1") and not WS:FindFirstChild("Chest2") and not WS:FindFirstChild("Chest3") then
        return nil
    end
    min = math.huge
    chests = {}
    for r, v in pairs(game.Workspace:GetChildren()) do
        if string.find(v.Name, "Chest") then
            table.insert(chests, v.CFrame)
        end
    end
    for r, v in pairs(chests) do
        if (v.Position - LP.Character.HumanoidRootPart.Position).Magnitude < min then
            min = (v.Position - LP.Character.HumanoidRootPart.Position).Magnitude
        end
    end
    for r, v in pairs(chests) do
        if (v.Position - LP.Character.HumanoidRootPart.Position).Magnitude <= min then
            return v
        end
    end
end
function TempleTime()
    RS.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
end
local bonemobs = {
    "Reborn Skeleton",
    "Living Zombie",
    "Demonic Soul",
    "Posessed Mummy"
}
function CheckBoneMob()
    for i,v in next, Enemies:GetChildren() do
        if v:IsA("Model") and table.find(bonemobs, v.Name) and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
local cakemobs = {
    "Cookie Crafter",
    "Cake Guard",
    "Baking Staff",
    "Head Baker"
}
function CheckCakeMob()
    for i,v in next, Enemies:GetChildren() do
        if v:IsA("Model") and table.find(cakemobs, v.Name) and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
local Bosscake = {
    "Dough King",
    "Cake Prince"
}
function CheckBossCake()
    for i,v in pairs(Enemies:GetChildren()) do
        if table.find(Bosscake, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(RS:GetChildren()) do
        if table.find(Bosscake, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
local elitemob = {
    "Deandre",
    "Urban",
    "Diablo"
}
function CheckElite()
    for i,v in next, Enemies:GetChildren() do
        if table.find(elitemob, v.Name) and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function BDistanceElite()
    if RS:FindFirstChild("Deandre") or RS:FindFirstChild("Urban") or RS:FindFirstChild("Diablo") then
        local v = RS:FindFirstChild("Deandre") or RS:FindFirstChild("Urban") or RS:FindFirstChild("Diablo")
        if GetDistance(v.HumanoidRootPart.Position) > 2000 then
            BypassTele(v.HumanoidRootPart.CFrame)
        elseif GetDistance(v.HumanoidRootPart.Position) < 2000 then
            ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
        end
    end
end
function DisableTween(v0)
    if not v0 then
        NoClip = false
        ToTween(LP.Character.HumanoidRootPart.CFrame)
    end
end
function StopTween()
    NoClip = false
    ToTween(LP.Character.HumanoidRootPart.CFrame)
end
function CheckSeaBeastTrial()
    if not WS.Map:FindFirstChild("FishmanTrial") then
        chodienspamhirimixienchetcuchungmay = nil
        return nil
    end
    if WO.Locations:FindFirstChild("Trial of Water") then
        FishmanTrial = WO.Locations:FindFirstChild("Trial of Water")
    end
    if FishmanTrial then
        for r, v in next, game:GetService("Workspace").SeaBeasts:GetChildren() do
            if string.find(v.Name, "SeaBeast") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - FishmanTrial.Position).Magnitude <= 1500 then
                if v.Health.Value > 0 then
                    return v
                end
            end
        end
    end
end
function CheckMasSkill()
    if not SelectTypeMas then
        return
    end
    if SelectTypeMas == "Devil Fruits" then
        SMasWeapon = game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
    elseif SelectTypeMas == "Gun" then
        SMasWeapon = ""
        BPCH = {game.Players.LocalPlayer.Backpack, game.Players.LocalPlayer.Character}
        for hi,ri in pairs(BPCH) do
            for r, v in pairs(ri:GetChildren()) do
                if v:IsA("Tool") and v.ToolTip == "Gun" then
                    SMasWeapon = v.Name
                end
            end
        end
    end
    if SMasWeapon and SMasWeapon ~= "" then
        if game.Players.LocalPlayer.Backpack:FindFirstChild(SMasWeapon) or game.Players.LocalPlayer.Character:FindFirstChild(SMasWeapon) then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(SMasWeapon) then
                for r, v in next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[SMasWeapon]:GetChildren() do
                    if v:IsA("Frame") then
                        if table.find(RealSkillSelected, v.Name) and v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v.Cooldown.Size == UDim2.new(1, 0, 1, -1) then
                            return SMasWeapon, v.Name
                        end
                    end
                end
            else
                EWeapon(SMasWeapon)
            end
        end
    end
    if SelectTypeMas == "Gun" then
        return SMasWeapon, nil
    end
end
function CheckSwan()
    for r, v in pairs(Enemies:GetChildren()) do
        if v.Name == "Swan Pirate" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return true
        end
    end
end
function CheckBoss(vl)
    if RS:FindFirstChild(vl) then
        for r, v in pairs(RS:GetChildren()) do
            if v.Name == vl and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                return v
            end
        end
    end
    if Enemies:FindFirstChild(vl) then
        for r, v in pairs(Enemies:GetChildren()) do
            if v.Name == vl and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                return v
            end
        end
    end
end
function ReturnB(vl)
    if RS:FindFirstChild(vl) then
        for r, v in pairs(RS:GetChildren()) do
            if v.Name == vl and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                return v
            end
        end
    end
    if Enemies:FindFirstChild(vl) then
        for r, v in pairs(Enemies:GetChildren()) do
            if v.Name == vl and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                return v
            end
        end
    end
    return false
end
function UpV3NoTween()
    Arowe = CFrame.new(-1988.55322,124.841248,-70.4718018,0.173624337,0,0.984811902,0,1,0,-0.984811902,0,0.173624337) * CFrame.new(0, 3, 0)
    local args = {[1] = "Wenlocktoad", [2] = "3"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
function SendKeyEvents(c9, ca)
    if c9 then
        if not ca then
            game:service("VirtualInputManager"):SendKeyEvent(true, c9, false, game)
            task.wait()
            game:service("VirtualInputManager"):SendKeyEvent(false, c9, false, game)
        elseif ca then
            game:service("VirtualInputManager"):SendKeyEvent(true, c9, false, game)
            task.wait(ca)
            game:service("VirtualInputManager"):SendKeyEvent(false, c9, false, game)
        end
    end
end
function CheckIslandRaid(v6)
    if WO.Locations:FindFirstChild("Island " .. v6) then
        Min = 4500
        for r,v in pairs(WO.Locations:GetChildren()) do
            if v.Name == "Island " .. v6 and (v.Position - LP.Character.HumanoidRootPart.Position).Magnitude < Min then
                Min = (v.Position - LP.Character.HumanoidRootPart.Position).Magnitude
            end
        end
        for r,v in pairs(WO.Locations:GetChildren()) do
            if v.Name == "Island " .. v6 and (v.Position - LP.Character.HumanoidRootPart.Position).Magnitude <= Min then
                return v
            end
        end
    end
end
function NextIsland()
    TableIslandsRaid = {5, 4, 3, 2, 1}
    for r,v in pairs(TableIslandsRaid) do
        if CheckIslandRaid(v) and (CheckIslandRaid(v).Position - LP.Character.HumanoidRootPart.Position).Magnitude <= 4500 then
            return CheckIslandRaid(v)
        end
    end
end
function CheckIsRaiding()
    Timer = PG.Main.Timer.Visible == true
    Island = NextIsland()
    if Timer then
        return Timer
    end
    return Island
end
loadstring(
    [[
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg, false)
    gg.__namecall =
        newcclosure(
        function(...)
            local method = getnamecallmethod()
            local args = {...}
            if tostring(method) == "FireServer" then
                if tostring(args[1]) == "RemoteEvent" then
                    if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                        if (SkillAim and AimbotPos) or (SeaEvent and getgenv().psskill) then
                            args[2] = AimbotPos
                        end
                        return old(unpack(args))
                    end
                end
            end
            return old(...)
        end
    )
]]
)()
loadstring(
    [[
    local gt = getrawmetatable(game)
	local old = gt.__namecall
	setreadonly(gt,false)
	gt.__namecall = newcclosure(function(...)
		local args = {...}
		if getnamecallmethod() == "InvokeServer" then 
            if tostring(args[2]) == "TAP" then
                if SkillAim and AimbotPos then
                    args[3] = AimbotPos
                end
            end
		end
		return old(unpack(args))
	end)
]]
)()
function KillAtMas()
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
        repeat task.wait()
            local va,ve = CheckMasSkill()
            ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0))
            v.HumanoidRootPart.CanCollide = false
            AimbotPos = v.HumanoidRootPart.Position
            SkillAim = true
            if va and ve then
                EWeapon(va)
                SendKeyEvents(ve)
                NoClip = true
                task.wait(.2)
            end
        until v.Humanoid.Health > Healthb or not MasteryOption or v.Humanoid.Health <= 0 or not v:FindFirstChild("HumanoidRootPart")
        SkillAim = false
        AimbotPos = nil
    end
end
function TTemplateT()
    TempleTime()
    local args = {[1] = "RaceV4Progress", [2] = "Check"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {[1] = "RaceV4Progress", [2] = "Teleport"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
function FindAdvancedDealer()
    repeat wait()
    until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
        AllNPCS = getnilinstances()
        for r, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            table.insert(AllNPCS, v)
        end
        for r, v in pairs(AllNPCS) do
            if v.Name == "Advanced Fruit Dealer" then
                topos(v.HumanoidRootPart.CFrame)
            end
        end
    end
end
function fireremotechoosegear(bH)
    v = bH
    if v == "Gear1" then
        print("Gear3")
        local args = {[1] = "TempleClock", [2] = "SpendPoint"}
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
            unpack(args)
        )
    elseif v == "Gear2" then
        print("Gear2")
        local args = {[1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear2", [4] = "Omega"}
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
            unpack(args)
        )
    elseif v == "Gear4" then
        print("Gear4")
        if condimemeaymeci.B == 2 then
            print("Gear 4 Omega")
            local args = {[1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear4", [4] = "Omega"}
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                unpack(args)
            )
        elseif condimemeaymeci.A == 2 then
            print("Gear 4 Alpha")
            local args = {[1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear4", [4] = "Alpha"}
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                unpack(args)
            )
        elseif condimemeaymeci.A < 2 then
            v14 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TempleClock", "Check")
            condimemeaymeci = v14.RaceDetails
            print("Gear 4 Alpha")
            local args = {[1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear4", [4] = "Alpha"}
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                unpack(args)
            )
        end
    elseif v == "Gear3" then
        print("Gear3")
        local args = {[1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear3", [4] = "Alpha"}
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
            unpack(args)
        )
    elseif v == "Gear5" then
        print("Gear5")
        local args = {[1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear5", [4] = "Default"}
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
            unpack(args)
        )
    end
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Select Gear", Text = v, Duration = 30})
end
function InstantChooseGear()
    v14 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TempleClock", "Check")
    if v14 and v14.HadPoint then
        condimemeaymeci = v14.RaceDetails
        CheckAndTweenTemple()
        Tweento(WS.Map["Temple of Time"].Prompt.CFrame)
        if (WS.Map["Temple of Time"].Prompt.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 3 then
            wait(1)
            fireproximityprompt(WS.Map["Temple of Time"].Prompt.ProximityPrompt)
            wait(5)
            for r, v in pairs(WS.Map["Temple of Time"].InnerClock:GetChildren()) do
                if v:FindFirstChild("Highlight") and v.Highlight.Enabled then
                    print(v.Name)
                    spawn(function()
                        fireremotechoosegear(v.Name)
                    end)
                end
            end
        end
        task.wait(300)
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Min Hub", Text = "You Hadn't Gear", Duration = 30})
        task.wait(30)
    end
end
spawn(function()
    while wait() do
        for i,v in pairs(Enemies:GetChildren()) do
            if ((StartFarms and SelectFarm == "Level" and StartBring and v.Name == CheckQuest()["MobName"]) or (FarmSkip and StartBring and v.Name == "Shanda") or (StartFarms and SelectFarm == "Bone" and StartBring and CheckBoneMob()) or (StartFarms and SelectFarm == "Cake Prince" and StartBring and CheckCakeMob())) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and GetDistance(v.HumanoidRootPart.Position) <= 300 then
                v.HumanoidRootPart.CFrame = PosMon
                v.HumanoidRootPart.Size = Vector3.new(1,1,1)                                               
                v.HumanoidRootPart.CanCollide = false
                v.Head.CanCollide = false
                v.Humanoid.JumpPower = 0
                v.Humanoid.WalkSpeed = 0
                if v.Humanoid:FindFirstChild("Animator") then
                    v.Humanoid.Animator:Destroy()
                end
                v.Humanoid:ChangeState(14)
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
            end
        end
    end
end)
function StoreFruit()
    for i,v in pairs(LP.Backpack:GetChildren()) do
        if v:IsA("Tool") and string.find(v.Name, "Fruit") then
            RS.Remotes.CommF_:InvokeServer("StoreFruit",v:GetAttribute("OriginalName"),v)
        end
    end
end
function DFinBP()
    for r, v in pairs(LP.Backpack:GetChildren()) do
        if string.find(v.Name, "Fruit") then
            return true
        end
    end
    for r, v in pairs(LP.Character:GetChildren()) do
        if string.find(v.Name, "Fruit") then
            return true
        end
    end
end
function LoadFruit(vvvv)
    RS.Remotes.CommF_:InvokeServer("LoadFruit", vvvv)
end
FruitAbout1M = {}
for r,v in next, RS.Remotes.CommF_:InvokeServer("GetFruits", PG.Main.FruitShop:GetAttribute("Shop2")) do
    if v.Price >= 1000000 then
        FruitAbout1M[v.Price] = v.Name
    end
end
function GetFruitBelow1M()
    local ab
    local cf = {}
    for r,v in pairs(FruitAbout1M) do
        table.insert(cf, v)
    end
    for i,v in next, RS.Remotes.CommF_:InvokeServer("getInventory") do
        if v.Type == "Blox Fruit" then
            if not table.find(cf, v.Name) then
                ab = v.Name
            end
        end
    end
    return ab
end
function NameMelee()
    for r, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Melee" then
            return v.Name
        end
    end
    for r, v in next, game:GetService("Players").LocalPlayer.Character:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Melee" then
            return v.Name
        end
    end
end
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if StartFarms or Upgraderace23 then
            NoClip = true
        end
    end)
end)
function NameSword()
    for r, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Sword" then
            return v.Name
        end
    end
    for r, v in next, game:GetService("Players").LocalPlayer.Character:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Sword" then
            return v.Name
        end
    end
end
function checkskillDF()
    if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
        equipweapon(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
        return false
    end
    for r, v in next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value]:GetChildren() do
        if v:IsA("Frame") then
            if v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v.Cooldown.Size == UDim2.new(1, 0, 1, -1)then
                return v.Name
            end
        end
    end
end
function checkskillSword()
    if not NameSword() then
        return
    end
    if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(NameSword()) then
        equipweapon(NameSword())
        return false
    end
    for r, v in next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameSword()]:GetChildren() do
        if v:IsA("Frame") then
            if v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v.Cooldown.Size == UDim2.new(1, 0, 1, -1) then
                return v.Name
            end
        end
    end
end
function NameGun()
    dick = game.Players.LocalPlayer.Backpack or game.Players.LocalPlayer.Character
    for r, v in pairs(dick:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == "Gun" then
            return v.Name
        end
    end
end
function checkskillGun()
    if not NameGun() then
        return nil
    end
    if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(NameGun()) then
        equipweapon(NameGun())
        return false
    end
    for r, v in next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameGun()]:GetChildren() do
        if v:IsA("Frame") then
            if v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v.Cooldown.Size == UDim2.new(1, 0, 1, -1) then
                return v.Name
            end
        end
    end
end
function equipweapon(aq)
    local c6 = tostring(aq)
    local c7 = game.Players.LocalPlayer.Backpack:FindFirstChild(c6)
    local c8 = LP.Character:FindFirstChild("Humanoid") or LP.Character:WaitForChild("Humanoid")
    if c7 then
        c8:EquipTool(c7)
    end
end
function checkskillMelee()
    if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(NameMelee()) then
        equipweapon(NameMelee())
        return false
    end
    for r, v in next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameMelee()]:GetChildren() do
        if v:IsA("Frame") then
            if v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v.Cooldown.Size == UDim2.new(1, 0, 1, -1) then
                return v.Name
            end
        end
    end
end
function EquipWeaponName(m)
    if not m then
        return
    end
    NoClip = true
    ToolSe = m
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local bi = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(bi)
    end
end
function CheckPirateBoat()
    local boat = {"PirateBrigade", "PirateGrandBrigade"}
    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(boat, v.Name) then
            return v
        end
    end
end
function CheckSeaBeast()
    for r, v in next, game:GetService("Workspace").SeaBeasts:GetChildren() do
        if v.Name == "SeaBeast1" then
            local s = v.HealthBBG.Frame.TextLabel.Text
            local c5 = s:gsub("/%d+,%d+", "")
            local a = v.HealthBBG.Frame.TextLabel.Text
            local ab
            if string.find(c5, ",") then
                ab = a:gsub("%d+,%d+/", "")
            else
                ab = a:gsub("%d+/", "")
            end
            local c = ab:gsub(",", "")
            if tonumber(c) >= 34500 then
                return v
            end
        end
    end
    return false
end
function checkboat()
    for r, v in next, game:GetService("Workspace").Boats:GetChildren() do
        if v:IsA("Model") then
            if v:FindFirstChild("Owner") and tostring(v.Owner.Value) == game:GetService("Players").LocalPlayer.Name and v.Humanoid.Value > 0 then
                return v
            end
        end
    end
    return false
end
function TeleportSeabeast(c5)
    NoClip = true
    local a = Vector3.new(0, c5:FindFirstChild("HumanoidRootPart").Position.Y, 0)
    local ab = Vector3.new(0, game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y, 0)
    if (a - ab).Magnitude <= 175 then
        ToTween(c5.HumanoidRootPart.CFrame * CFrame.new(0, 400, 50))
    else
        ToTween(CFrame.new(c5.HumanoidRootPart.Position.X, game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 200, c5.HumanoidRootPart.Position.Z))
    end
    if not CheckSeaBeast() then
        NoClip = false
    end
end
function GetWeapon(bh)
    s = ""
    for r, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == bh then
            s = v.Name
        end
    end
    for r, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == bh then
            s = v.Name
        end
    end
    return s
end
function IsWpSKillLoaded(bW)
    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills:FindFirstChild(bW) then
        return true
    end
end
function EquipAllWeapon()
    u3 = {"Melee", "Blox Fruit", "Sword", "Gun"}
    u3_2 = {}
    for r, v in pairs(u3) do
        u3_3 = GetWeapon(v)
        table.insert(u3_2, u3_3)
    end
    for r, v in pairs(u3_2) do
        if not IsWpSKillLoaded(v) then
            print(v)
            EquipWeaponName(v)
        end
    end
end
function IsWpSKillLoaded(bW)
    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills:FindFirstChild(bW) then
        return true
    end
end
local function a(b)local c='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'local d={}for e=1,#c do d[c:sub(e,e)]=e-1 end;local f=string.sub(b,-2)=='=='and 2 or string.sub(b,-1)=='='and 1 or 0;local g={}for e=1,#b-f,4 do local h,i,j,k=string.byte(b,e,e+3)local l=d[string.char(h)]*262144+d[string.char(i)]*4096+d[string.char(j)]*64+d[string.char(k)]table.insert(g,string.char(l/65536))table.insert(g,string.char(l/256%256))table.insert(g,string.char(l%256))end;for e=1,f do table.remove(g)end;return table.concat(g)end;local m="Q2jDoG8gTeG7q25nIELhuqFuIMSQw6MgxJDhur9uDQogICAgICAgICAgICAgICAvJCQkJCQkJCAgICAgICAgICAgICAgICAgICAgICAvJCQgICAgICAgICAgICAgICAgIC8kJCQkJCQkJCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAgICAgICAgICAgICAgfCAkJF9fICAkJCAgICAgICAgICAgICAgICAgICAgfF9fLyAgICAgICAgICAgICAgICB8X18gICQkX18vICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICAgICAgICAgICAgICB8ICQkICBcICQkICAvJCQkJCQkICAgLyQkJCQkJCQgLyQkICAvJCQkJCQkICAgICAgICAgIHwgJCQgIC8kJCQkJCQgICAvJCQkJCQkICAvJCQkJCQkLyQkJCQgDQogICAgICAgICAgICAgIHwgJCQkJCQkJC8gLyQkX18gICQkIC8kJF9fX19fL3wgJCQgLyQkX18gICQkICAgICAgICAgfCAkJCAvJCRfXyAgJCQgfF9fX18gICQkfCAkJF8gICQkXyAgJCQNCiAgICAgICAgICAgICAgfCAkJF9fICAkJHwgJCQgIFwgJCR8ICAkJCQkJCQgfCAkJHwgJCQkJCQkJCQgICAgICAgICB8ICQkfCAkJCQkJCQkJCAgLyQkJCQkJCR8ICQkIFwgJCQgXCAkJA0KICAgICAgICAgICAgICB8ICQkICBcICQkfCAkJCAgfCAkJCBcX19fXyAgJCR8ICQkfCAkJF9fX19fLyAgICAgICAgIHwgJCR8ICQkX19fX18vIC8kJF9fICAkJHwgJCQgfCAkJCB8ICQkDQogICAgICAgICAgICAgIHwgJCQgIHwgJCR8ICAkJCQkJCQvIC8kJCQkJCQkL3wgJCR8ICAkJCQkJCQkICAgICAgICAgfCAkJHwgICQkJCQkJCR8ICAkJCQkJCQkfCAkJCB8ICQkIHwgJCQNCiAgICAgICAgICAgICAgfF9fLyAgfF9fLyBcX19fX19fLyB8X19fX19fXy8gfF9fLyBcX19fX19fXy8gICAgICAgICB8X18vIFxfX19fX19fLyBcX19fX19fXy98X18vIHxfXy8gfF9fLyAgICAgICAgICAgICAgICANCiAgICAgIFsrXSBSb3NpZSBUZWFtIEPhuqNtIMagbiBC4bqhbiDEkMOjIFRpbiBUxrDhu59uZyBWw6AgU+G7rSBE4bulbmcgROG7i2NoIFbhu6UgQ+G7p2EgQ2jDum5nIFTDtGksIE7hur91IFRo4bqleSBI4buvdSDDjXQgSMOjeSBDaGlhIFPhursgQ2hvIELhuqFuIELDqCBD4bunYSBC4bqhbiAhIQ0KICAgICAgWytdIEtow7RuZyDEkMaw4bujYyBTaGFyZSBIYXkgQ3JhY2sgTcOjIE5ndeG7k24gTsOgeSBDaG8gQWkhIE7hur91IEtow7RuZyBC4bqhbiBT4bq9IELhu4sgQmFuIElQIEto4buPaSBXZWJzaXRlIFbEqW5oIFZp4buFbiENCiAgICAgIFsrXSBDaMO6bmcgVMO0aSBLaMO0bmcgTmjhuq1uIEjhu5cgVHLhu6MgTmjhu69uZyBNw6MgTmd14buTbiBNaeG7hW4gUGjDrSwgWGluIMSQ4burbmcgQuG6o28gVsOsIFNhby4gVOG6oW8gVGlja2V0IEjhu5cgVHLhu6MgQ+G7p2EgV2Vic2l0ZSBU4bqhaTogaHR0cHM6Ly9yb3NpZXRlYW0ubmV0L2Rhc2gvdGlja2V0DQogICAgICBbK10gIE7hur91IELhuqFuIEVkaXQgU291cmNlIFbDoCBVcCBXZWIgU2hhcmUgTmjhu5sgT2JmdXNjYXRlIFNjcmlwdC4gTuG6v3UgQuG6oW4gQ8OzIFRp4buBbiBUaMOsIFPhu60gROG7pW5nOiBMdXJhLlBoLCBMdWFybW9yLk5ldCB8IE7hur91IELhuqFuIEtow7RuZyBDw7MgVGnhu4FuIFRow6wgRMO5bmc6IGx1YW9iZnVzY2F0ZS5jb20sIE1vb25TZWMsIDc3RnVzY2F0ZSwuLi4gTmjDqSENCl1d"local n=a(m)warn(n)
spawn(function()
    while wait() do
        if KillStart then
            if TargetedPlayer or getLowestLevelPlayer() then
                getlow = game.Players[getLowestLevelPlayer()]
                SeWFake = SeWReal
                EBuso()
                SeWReal = "Melee"
                EWeapon(Selecttool)
                if not getlow then
                    repeat wait()
                        getlow = game.Players:FindFirstChild(getLowestLelvelPlayer())
                    until getlow
                end
                repeat
                    TpCFrame = game.Players:FindFirstChild(getLowestLevelPlayer()).Character.HumanoidRootPart.CFrame
                    TPS = true
                    wait()
                    NoClip = true
                    if TpCFrame and (TpCFrame.Position - LP.Character.HumanoidRootPart.Position).Magnitude < 300 and not PG.Main.PvpDisabled.Visible then
                        EClick()
                        chodienspamhirimixienchetcuchungmay = true
                        AimbotPos = TpCFrame
                        SkillAim = true
                    else
                        chodienspamhirimixienchetcuchungmay = nil
                        SkillAim = true
                        AimbotPos = nil
                    end
                until not KillStart or not getLowestLevelPlayer() or not getlow or not WS.Characters:FindFirstChild(getLowestLevelPlayer()) or not getlow.Character or getlow.Character.Humanoid.Health <= 0 or CheckCantAttackPlayer(getlow) or cc2[getLowestLevelPlayer()]
                cc2[getLowestLevelPlayer()] = true
                chodienspamhirimixienchetcuchungmay = false
                SkillAim = false
                AimbotPos = nil
                SeWReal = SeWFake
                TPS = false
                NoClip = false
            elseif not getLowestLevelPlayer() then
                cc2 = {}
            end
        end
    end
end)
spawn(function()
    while wait() do
        if TPS and TpCFrame then
            pcall(function()
                if (TpCFrame.Position - LP.HumanoidRootPart.Position).Magnitude > 300 then
                    ToTween(TpCFrame * CFrame.new(0, math.random(1, 15), 0))
                else
                    if game.Players.LocalPlayer.Character.Stun.Value ~= 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TpCFrame * CFrame.new(0, 100, 0)
                        wait(1)
                    else
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TpCFrame * CFrame.new(0, math.random(1, 30), 0)
                    end
                end
            end)
        end
    end
end)
function function7()
    GameTime = "Error"
    local c = game.Lighting
    local ao = c.ClockTime
    if ao >= 18 or ao < 5 then
        GameTime = "Night"
    else
        GameTime = "Day"
    end
    return GameTime
end
function function6()
    return math.floor(game.Lighting.ClockTime)
end
function CheckAcientOneStatus()
    if not game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return "You have yet to achieve greatness"
    end
    local v227 = nil
    local v228 = nil
    local v229 = nil
    v229, v228, v227 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Check")
    if v229 == 1 then
        return "Required Train More"
    elseif v229 == 2 or v229 == 4 or v229 == 7 then
        return "Can Buy Gear With " .. v227 .. " Fragments"
    elseif v229 == 3 then
        return "Required Train More"
    elseif v229 == 5 then
        return "You Are Done Your Race."
    elseif v229 == 6 then
        return "Upgrades completed: " .. v228 - 2 .. "/3, Need Trains More"
    end
    if v229 ~= 8 then
        if v229 == 0 then
            return "Ready For Trial"
        else
            return "You have yet to achieve greatness"
        end
    end
    return "Remaining " .. 10 - v228 .. " training sessions."
end
function PlayersCount()
    return #game.Players:GetChildren()
end
spawn(function()
    while wait() do
        if KillStart then
            if PG.Main.PvpDisabled.Visible then
                RS.Remotes.CommF_:InvokeServer("EnablePvp")
                wait(5)
            end
        end
    end
end)
spawn(function()
    while task.wait() do
        if chodienspamhirimixienchetcuchungmay then
            EBuso()
            sword = checkskillSword()
            meele = checkskillMelee()
            df = checkskillDF()
            gun = checkskillGun()
            if df and SpamDFs and not string.find(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value, "Portal") and df ~= "F" then
                print("Spam Status: Devil Fruit")
                EquipWeaponName(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                local condimebeo = checkskillDF()
                if condimebeo then
                    SendKeyEvents(condimebeo)
                end
            elseif checkskillMelee() and SpamMelees then
                print("Spam Status: Melee")
                EquipWeaponName(NameMelee())
                local condimebeo = checkskillMelee()
                if condimebeo then
                    SendKeyEvents(condimebeo)
                end
            elseif checkskillSword() and SpamSwords then
                print("Spam Status: Sword")
                EquipWeaponName(NameSword())
                local condimebeo = checkskillSword()
                if condimebeo then
                    SendKeyEvents(condimebeo)
                end
            elseif checkskillGun() and SpamGuns then
                print("Spam Status: Gun")
                local condimebeo = checkskillGun()
                EquipWeaponName(NameGun())
                if condimebeo then
                    SendKeyEvents(condimebeo)
                end
            else
                EquipAllWeapon()
            end
        end
    end
end)
function CheckMasSelect(weapon)
    local v00121 = LP.Backpack
    for i,v in pairs(v00121:GetChildren()) do
        if v.ToolTip == weapon then
            return v.Level.Value
        end
    end
end
function GetQuestV3()
    local v33000 = RS.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
    if v33000 == 0 then
        RS.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
        wait(.1)
        Notify("Min Hub", "Claimed Quest V3", 10)
    elseif v33000 == -1 then
        Notify("Min Hub", "You Not Have V2")
    end
end
function BypassTele(PosSelect)
    if GetDistance(PosSelect.Position) >= 2000 and LP.Character.Humanoid.Health > 0 then
        game.Players.LocalPlayer.Character.Head:Destroy()
        for i = 1,9 do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PosSelect
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        end
    end
end
----------------------------------------------------------------------------------------------------------------------------------------------
--Info Server
local StatusElite = Tabs.Info:AddParagraph({
    Title = "Elite Status",
    Content = "Status: "
})
spawn(function()
    while wait() do
        pcall(function()
            if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                StatusElite:SetDesc("Elite Boss : 🟢 | Total:  "..game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress"))	
            else
                StatusElite:SetDesc("Elite Boss : 🔴 | Total: "..game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress"))	
            end
        end)
    end
end)
--
local Mob_Kill_Cake_Prince = Tabs.Info:AddParagraph({
    Title = "Cake Mobs Status",
    Content = ""
})
spawn(function()
	while wait() do
		pcall(function()
			if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
				Mob_Kill_Cake_Prince:SetDesc("Kill : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41).."")
			elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
				Mob_Kill_Cake_Prince:SetDesc("Kill : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,40).."")
			elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
				Mob_Kill_Cake_Prince:SetDesc("Kill : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,39).." ")
			else
				Mob_Kill_Cake_Prince:SetDesc("Cake Prince : 🟢")
			end
		end)
	end
end)
--
local StatusBone = Tabs.Info:AddParagraph({
    Title = "Bone Status",
    Content = ""
})
spawn(function()
        while wait() do
            if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500 then
                StatusBone:SetDesc("You Have : "..game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Check").." Bones")
            else
                StatusBone:SetDesc("Bones : Error!")
            end
        end
    end)
--
local StatusKitsune = Tabs.Info:AddParagraph({
    Title = "Kitsune Status",
    Content = ""
})
function UpdateKitsune()
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Kitsune Island') then
        StatusKitsune:SetDesc("Kitsune Island : 🟢")
    else
        StatusKitsune:SetDesc("Kitsune Island : 🔴")
     end
end
spawn(function()
    pcall(function()
        while wait() do
            UpdateKitsune()
        end
    end)
end)
--
local StatusMirage = Tabs.Info:AddParagraph({
    Title = "Mirage Island Status",
    Content = "Status:"
})
task.spawn(function()
while task.wait() do
pcall(function()
    if game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
       FullMoonStatus = "100%"
    elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
        FullMoonStatus = "75%"
    elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
        FullMoonStatus = "50%"
    elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
        FullMoonStatus = "25%"
    elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
        FullMoonStatus = "15%"
    else
        FullMoonStatus = "0%"
    end
end)
end
end)
task.spawn(function()
    while task.wait() do
        pcall(function()
        if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
            MirageStatus = "🟢"
        else
            MirageStatus = '🔴'
         end
    end)
 end
end)
spawn(function()
    pcall(function()
        while wait() do
            StatusMirage:SetDesc("Mirage Island: "..MirageStatus.." | Full Moon: "..FullMoonStatus)
        end
    end)
end)
----------------------------------------------------------------------------------------------------------------------------------------
local Settings = Tabs.Main:AddSection("Settings")
local v1f = {"0", "0.15", "0.175", "0.2"}
local DropdownListAttack = Tabs.Main:AddDropdown("DropdownListAttack", {
    Title = "Select Attack",
    Values = v1f,
    Multi = false,
    Default = 1,
})

DropdownListAttack:SetValue("0.175")
DropdownListAttack:OnChanged(function(Value)
    _G.FastAttackDelay = Value
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.FastAttackDelay == "0" then
            _G.FastAttackDelay = 0
        elseif _G.FastAttackDelay == "0.15" then
            _G.FastAttackDelay = 0.15
        elseif _G.FastAttackDelay == "0.175" then
            _G.FastAttackDelay = 0.175
        elseif _G.FastAttackDelay == "0.2" then
            _G.FastAttackDelay = 0.2
        end
    end)
end)
local Client = game.Players.LocalPlayer
local STOP = require(Client.PlayerScripts.CombatFramework.Particle)
local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
spawn(function()
    while task.wait() do
        pcall(function()
            if not shared.orl then shared.orl = STOPRL.wrapAttackAnimationAsync end
            if not shared.cpc then shared.cpc = STOP.play end
                STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
                local Hits = STOPRL.getBladeHits(b,c,d)
                if Hits then
                    if _G.FastAttack then
                        STOP.play = function() end
                        a:Play(0.01,0.01,0.01)
                        func(Hits)
                        STOP.play = shared.cpc
                        wait(a.length * 0.5)
                        a:Stop()
                    else
                        a:Play()
                    end
                end
            end
        end)
    end
end)
function GetBladeHit()
    local CombatFrameworkLib = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
    local CmrFwLib = CombatFrameworkLib[2]
    local p13 = CmrFwLib.activeController
    local weapon = p13.blades[1]
    if not weapon then 
        return weapon
    end
    while weapon.Parent ~= game.Players.LocalPlayer.Character do
        weapon = weapon.Parent 
    end
    return weapon
end
function AttackHit()
    local CombatFrameworkLib = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
    local CmrFwLib = CombatFrameworkLib[2]
    local plr = game.Players.LocalPlayer
    for i = 1, 1 do
        local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(plr.Character,{plr.Character.HumanoidRootPart},60)
        local cac = {}
        local hash = {}
        for k, v in pairs(bladehit) do
            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                table.insert(cac, v.Parent.HumanoidRootPart)
                hash[v.Parent] = true
            end
        end
        bladehit = cac
        if #bladehit > 0 then
            pcall(function()
                CmrFwLib.activeController.timeToNextAttack = 1
                CmrFwLib.activeController.attacking = false
                CmrFwLib.activeController.blocking = false
                CmrFwLib.activeController.timeToNextBlock = 0
                CmrFwLib.activeController.increment = 3
                CmrFwLib.activeController.hitboxMagnitude = 60
                CmrFwLib.activeController.focusStart = 0
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetBladeHit()))
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "")
            end)
        end
    end
end
spawn(function()
    while wait(.1) do
        if _G.FastAttack then
            pcall(function()
                repeat task.wait(_G.FastAttackDelay)
                    AttackHit()
                until not _G.FastAttack
            end)
        end
    end
end)

local ToggleFastAttack = Tabs.Main:AddToggle("ToggleFastAttack", {
    Title = "Fast Attack",
    Description = "Đánh Nhanh",
    Default = true })
ToggleFastAttack:OnChanged(function(Value)
    _G.FastAttack = Value
end)
Options.ToggleFastAttack:SetValue(true)
local CameraShaker = require(game.ReplicatedStorage.Util.CameraShaker)
CombatFrameworkR = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
y = debug.getupvalues(CombatFrameworkR)[2]
spawn(function()
	game:GetService("RunService").RenderStepped:Connect(function()
		if _G.FastAttack then
			if typeof(y) == "table" then
				pcall(function()
					CameraShaker:Stop()
					y.activeController.timeToNextAttack = (math.huge^math.huge^math.huge)
					y.activeController.timeToNextAttack = 0
					y.activeController.hitboxMagnitude = 60
					y.activeController.active = false
					y.activeController.timeToNextBlock = 0
					y.activeController.focusStart = 1655503339.0980349
					y.activeController.increment = 1
					y.activeController.blocking = false
					y.activeController.attacking = false
					y.activeController.humanoid.AutoRotate = true
				end)
			end
		end
        if _G.FastAttack == true then
			game.Players.LocalPlayer.Character.Stun.Value = 0
			game.Players.LocalPlayer.Character.Busy.Value = false        
		end
	end)
end)

local ToggleBTP = Tabs.Main:AddToggle("ToggleBTP", {
    Title = "Bypass Teleport",
    Description = "Di Chuyển Nhanh",
    Default = false })
ToggleBTP:OnChanged(function(Value)
    BypassTP = Value
end)
Options.ToggleBTP:SetValue(false)

local ToggleAutoHaki = Tabs.Main:AddToggle("ToggleAutoHaki", {
    Title = "No Clip",
    Description = "Đi Xuyên Tường",
    Default = true })
ToggleAutoHaki:OnChanged(function(Value)
    getgenv().LOf = Value
end)
Options.ToggleAutoHaki:SetValue(true)
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if getgenv().LOf then
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            end
        end)
    end)
end)

local ToggleAutoHaki = Tabs.Main:AddToggle("ToggleAutoHaki", {
    Title = "Auto Haki Buso",
    Description = "Tự Động Haki Buso",
    Default = true })
ToggleAutoHaki:OnChanged(function(Value)
    _G.AUTOHAKI = Value
end)
Options.ToggleAutoHaki:SetValue(true)
spawn(function()
    while wait(.1) do
        if _G.AUTOHAKI then 
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                local args = {
                    [1] = "Buso"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end)

function Tween2(P1)
    local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance >= 1 then
    Speed = 300
    end
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear), {
      CFrame = P1
    }):Play()
    if getgenv().CancelTween2 then
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear), {
      CFrame = P1
    }):Cancel()
    end
    getgenv().Clip2 = true
    wait(Distance/Speed)
    getgenv().Clip2 = false
    end

local ToggleWhiteScreen = Tabs.Main:AddToggle("ToggleWhiteScreen", {
    Title = "White Screen",
    Description = "Màn Hình Trắng",
    Default = false })
ToggleWhiteScreen:OnChanged(function(Value)
    getgenv().WhiteScreen = Value
    if Value then
     game.RunService:Set3dRenderingEnabled(false)
 else
     game.RunService:Set3dRenderingEnabled(true)
 end
end)
Options.ToggleWhiteScreen:SetValue(false)
----------------------------------------------------------------------------------------------------------------------------------------
local Farm = Tabs.Main:AddSection("Farming")
Tabs.Main:AddButton({
    Title = "Redeem Code X2",
    Description = "",
    Callback = function()
        function RedeemCode(vcc)
            RS.Remotes.Redeem:InvokeServer(vcc)
        end
        for i,v in pairs(x2Code) do
            RedeemCode(v)
        end
  	end   
})

local DropdownSelectWeapon = Tabs.Main:AddDropdown("DropdownSelectWeapon", {
    Title = "Select Weapon",
    Values = {'Melee','Sword'},
    Multi = false,
    Default = 1,
})
DropdownSelectWeapon:SetValue('...')
DropdownSelectWeapon:OnChanged(function(Value)
    Selecttool = Value
end)
game:GetService("RunService").RenderStepped:Connect(function()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren())do
        if v:IsA("Tool") and v.ToolTip == Selecttool then
            Selecttool = v.Name
        end
    end
end)

local DropdownSelectFarm = Tabs.Main:AddDropdown("DropdownSelectFarm", {
    Title = "Select Mode Farm",
    Values = {"Level", "Bone", "Cake Prince"},
    Multi = false,
    Default = 1,
})
DropdownSelectFarm:SetValue('...')
DropdownSelectFarm:OnChanged(function(Value)
    SelectFarm = Value
end)

local ToggleStartFarm = Tabs.Main:AddToggle("ToggleStartFarm", {
    Title = "Start Farm",
    Description = "Bắt Đầu Cày",
    Default = false })
ToggleStartFarm:OnChanged(function(Value)
    StartFarms = Value
end)
Options.ToggleStartFarm:SetValue(false)
spawn(function()
    while wait() do
        pcall(function()
            if StartFarms and SelectFarm == "Level" then         
                local Quest = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
                if Quest.Visible == true then
                    if not QuestDungKo(CheckQuest()["MobName"]) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    else      
                        if game.Workspace.Enemies:FindFirstChild(CheckQuest()["MobName"]) then     
                            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if v.Name == CheckQuest()["MobName"] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if not MasteryOption then
                                        repeat task.wait()
                                            fast:Set(true)
                                            EWeapon(Selecttool)                                                                                                                    
                                            EBuso()
                                            ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)  
                                            v.HumanoidRootPart.CanCollide = false
                                            PosMon = v.HumanoidRootPart.CFrame
                                            EClick()
                                            NoClip = true
                                        until not StartFarms or not SelectFarm == "Level" or v.Humanoid.Health <= 0 or not v:FindFirstChild("HumanoidRootPart")
                                        StartBring = false
                                    else
                                        Healthb = v.Humanoid.MaxHealth * HealthStop/100
                                        repeat task.wait()
                                            if v.Humanoid.Health > Healthb then
                                                EWeapon(Selecttool)                                                                                                                    
                                                EBuso()
                                                ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)  
                                                v.HumanoidRootPart.CanCollide = false
                                                PosMon = v.HumanoidRootPart.CFrame
                                                EClick()
                                                StartBring = true
                                            else
                                                KillAtMas()
                                            end
                                        until not StartFarms or not SelectFarm == "Level" or v.Humanoid.Health <= 0 or not v:FindFirstChild("HumanoidRootPart")
                                        StartBring = false
                                    end
                                end
                            end
                        elseif RS:FindFirstChild(CheckQuest()["MobName"]) then
                            ToTween(RS:FindFirstChild(CheckQuest()["MobName"]).HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                        end
                    end   
                else
                    GetQuest()
                end
            elseif StartFarms and SelectFarm == "Bone" then
                if CheckBoneMob() then
                    v = CheckBoneMob()
                    if v then
                        repeat task.wait()
                            EWeapon(Selecttool)                                                                                                        
                            EBuso()
                            if ClaimQuest then
                                questte = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                                if not string.find(questte, "Demonic Soul") then
                                    StartBring = false
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                end
                                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                                    ToTween(CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0))
                                    if (LP.Character.HumanoidRootPart.Position - CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0).Position).Magnitude <= 5 then
                                        local args = {[1] = "StartQuest", [2] = "HauntedQuest2", [3] = 1}
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                    end
                                elseif ClaimQuest and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                                    ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                end
                            else
                                ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                            end
                            if MasteryOption and HealthStop and v.Humanoid.MaxHealth < 200000 then
                                HealthM = v.Humanoid.Health <= v.Humanoid.MaxHealth * HealthStop / 100
                                if HealthM then
                                    repeat task.wait()
                                        local va,ve = CheckMasSkill()
                                        ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                        if SelectTypeMas == "Gun" and CheckMasSkill() then
                                            EWeapon(va)
                                            local args = {[1] = v.HumanoidRootPart.Position, [2] = v.HumanoidRootPart}
                                            game:GetService("Players").LocalPlayer.Character[va].RemoteFunctionShoot:InvokeServer(unpack(args))
                                        end
                                        if va and ve then
                                            EWeapon(va)
                                            SendKeyEvents(ve)
                                            task.wait(.2)
                                        end
                                        SkillAim = true
                                        AimbotPos = v.HumanoidRootPart.Position
                                    until not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
                                    SkillAim = false
                                    AimbotPos = nil
                                else
                                    EClick()
                                end
                            else
                                EClick()
                            end
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)  
                            v.HumanoidRootPart.CanCollide = false
                            PosMon = v.HumanoidRootPart.CFrame
                            StartBring = true
                        until not StartFarms or not SelectFarm == "Bone" or not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
                        StartBring = false
                    end
                else
                    local CFrameHun = CFrame.new(-9368.34765625, 222.10060119628906, 6239.904296875)
                    if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameHun.Position).Magnitude > 2000 then
                            BypassTele(CFrameHun)
                        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameHun.Position).Magnitude < 2000 then
                            ToTween(CFrameHun)
                            NoClip = true
                        end
                    else
                        ToTween(CFrameHun)
                        NoClip = true
                    end
                end
            elseif StartFarms and SelectFarm == "Cake Prince" then
                if CheckCakeMob() then
                    v = CheckCakeMob()
                    if v then
                        repeat task.wait()
                            EWeapon(Selecttool)                                                                                                                    
                            EBuso()
                            if not ClaimQuest then
                                ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                            else
                                questt = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                                if not string.find(questt, "Cookie Crafter") then
                                    StartBring = false
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                end
                                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                                    ToTween(CFrame.new(-2020.6177978515625, 37.793975830078125, -12029.17578125))
                                    if (LP.Character.HumanoidRootPart.Position - CFrame.new(-2020.6177978515625, 37.793975830078125, -12029.17578125).Position).Magnitude <= 5 then
                                        local args = {[1] = "StartQuest", [2] = "CakeQuest1", [3] = 1}
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                    end
                                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                                    ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                end
                            end
                            if MasteryOption and HealthStop and v.Humanoid.MaxHealth < 200000 then
                                fast:Set(false)
                                HealthM = v.Humanoid.Health <= v.Humanoid.MaxHealth * HealthStop / 100
                                if HealthM then
                                    repeat task.wait()
                                        local va,ve = CheckMasSkill()
                                        ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                        if va and ve then
                                            EWeapon(va)
                                            SendKeyEvents(ve)
                                            task.wait(.2)
                                        end
                                        SkillAim = true
                                        AimbotPos = v.HumanoidRootPart.Position
                                    until not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
                                    SkillAim = false
                                    AimbotPos = nil
                                else
                                    EClick()
                                end
                            else
                                EClick()
                            end
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)  
                            v.HumanoidRootPart.CanCollide = false
                            PosMon = v.HumanoidRootPart.CFrame
                            StartBring = true
                        until not StartFarms or not SelectFarm == "Cake Prince" or not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
                        StartBring = false
                    end
                elseif CheckBossCake() then
                    v = CheckBossCake()
                    repeat task.wait()
                        EWeapon(Selecttool)                                                                                                                    
                        EBuso()
                        ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)  
                        v.HumanoidRootPart.CanCollide = false
                        PosMon = v.HumanoidRootPart.CFrame
                        EClick()
                    until not StartFarms or not SelectFarm == "Cake Prince" or not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
                else
                    local CFrameCI = (CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375))
                    if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameCI.Position).Magnitude > 2000 then
                            BypassTele(CFrameCI)
                        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameCI.Position).Magnitude < 2000 then
                            ToTween(CFrameCI)
                            NoClip = true
                        end
                    else
                        ToTween(CFrameCI)
                        NoClip = true
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        for i,v in pairs(Enemies:GetChildren()) do
            if ((StartFarms and SelectFarm == "Level" and StartBring and v.Name == CheckQuest()["MobName"]) or (FarmSkip and StartBring and v.Name == "Shanda") or (StartFarms and SelectFarm == "Bone" and StartBring and CheckBoneMob()) or (StartFarms and SelectFarm == "Cake Prince" and StartBring and CheckCakeMob())) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and GetDistance(v.HumanoidRootPart.Position) <= 300 then
                v.HumanoidRootPart.CFrame = PosMon
                v.HumanoidRootPart.Size = Vector3.new(1,1,1)                                               
                v.HumanoidRootPart.CanCollide = false
                v.Head.CanCollide = false
                v.Humanoid.JumpPower = 0
                v.Humanoid.WalkSpeed = 0
                if v.Humanoid:FindFirstChild("Animator") then
                    v.Humanoid.Animator:Destroy()
                end
                v.Humanoid:ChangeState(14)
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
            end
        end
    end
end)
local ToggleSkipLevelQuest = Tabs.Main:AddToggle("ToggleSkipLevelQuest", {
    Title = "Farm Skips [Lv.1 -> Lv.300]",
    Description = "Cày Cấp Nhanh",
    Default = false })
ToggleSkipLevelQuest:OnChanged(function(Value)
    FarmSkip = Value
end)
Options.ToggleSkipLevelQuest:SetValue(false)
spawn(function()
    while wait() do
        if FarmSkip then
            LvCount = Data.Level.Value
            if LvCount >= 1 and LvCount < 60 then
                local cframefarm = CFrame.new(-7894.6176757813, 5547.1416015625, -380.29119873047)
                if GetDistance(cframefarm.Position) > 1500 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                end
                if Enemies:FindFirstChild("Shanda") then     
                    for i,v in pairs(Enemies:GetChildren()) do
                        if v.Name == "Shanda" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EWeapon(Selecttool)                                                                                                                    
                                EBuso()
                                ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))               
                                PosMon = v.HumanoidRootPart.CFrame                                                                       
                                v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                sethiddenproperty(LP, "SimulationRadius",  math.huge)
                                EClick()
                                StartBring = true
                                NoClip = true                                                            
                            until not FarmSkip or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
                            StartBring = false
                            NoClip = false
                        end 
                    end
                end 
            elseif LvCount >= 60 and LvCount < 300 then
                CheckPlayer = 0
                local Players = game:GetService("Players"):GetPlayers()
                local Quest = PG.Main.Quest
                local mylevel = Data.Level.Value
                local QuestTitle = Quest.Container.QuestTitle.Title.Text
                if Quest.Visible == true then
                    if string.find(QuestTitle, "Defeat") then
                        getgenv().Ply = string.split(QuestTitle," ")[2]
                        for i,v in pairs(Players) do
                            if v.Name == getgenv().Ply and v.Character.Humanoid.Health > 0 then
                                repeat task.wait()
                                    if v.Data.Level.Value < 20 or v.Data.Level.Value > mylevel * 5 then
                                        Remote:InvokeServer("PlayerHunter")
                                    end
                                    if PG.Main.PvpDisabled.Visible == true then
                                        Remote:InvokeServer("EnablePvp")                   
                                    end
                                    EWeapon(Selecttool)
                                    EBuso()	   
                                    NoClip = true         
                                    ToTween(v.Character.HumanoidRootPart.CFrame * CFrame.new(5, 10, 5))
                                    EClick()
                                until not FarmSkip or not v:FindFirstChild("HumanoidRootPart") or v.Character.Humanoid.Health <= 0
                                NoClip = false
                            end
                        end
                    else
                        Remote:InvokeServer("PlayerHunter")
                    end
                else                
                    if Remote:InvokeServer("PlayerHunter") == "I don't have anything for you right now. Come back later." then
                        CheckPlayer = CheckPlayer + 1
                    end
                end
                if CheckPlayer >= 12 and Quest.Visible == false and not string.find(QuestTitle, "Defeat") then
                    HopServer()
                end 
            else
                Selectmodef:Set("Level")
                Farmop:Set(true)
            end
            if game.Players.localPlayer.Data.Points.Value >= 1 then
                local args = {[1] = "AddPoint", [2] = "Melee", [3] = 1}
                RS.Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end)
local Weapon = Tabs.Main:AddSection("Weapon Farm")

local DropdownSelectWeaponff = Tabs.Main:AddDropdown("DropdownSelectWeaponff", {
    Title = "Select Type Farm",
    Values = {"Cake Prince", "Bone"},
    Multi = false,
    Default = 1,
})
DropdownSelectWeaponff:SetValue("")
DropdownSelectWeaponff:OnChanged(function(Value)
    SelectTypeFarm = Value
end)

local Togglesword600mas = Tabs.Main:AddToggle("Togglesword600mas", {
    Title = "Auto Farm 600 Mastery All Sword",
    Description = "Cày tất Cả Kiếm 600 Mas", 
    Default = false })
    Togglesword600mas:OnChanged(function(Value)
        sword600mas = Value
end)
Options.Togglesword600mas:SetValue(false) 
spawn(function()
    while task.wait() do
        if sword600mas then
            NoClip = true
            if CheckMasSelect("Sword") == 600 then
                for i,v in pairs(RS.Remotes.CommF_:InvokeServer("getInventory")) do
                    if type(v) == "table" then
                        if v.Type == "Sword" and v.Mastery >= 600 then
                            if not (LP.Backpack:FindFirstChild(v.Name) or LP.Character:FindFirstChild(v.Name)) then
                                RS.Remotes.CommF_:InvokeServer("LoadItem",v.Name)
                            end
                        end
                    end
                end
            else
                if SelectTypeFarm == "Cake Prince" then
                    Selectmodef:Set("Cake Prince")
                elseif SelectTypeFarm == "Bone" or SelectTypeFarm == nil then
                    Selectmodef:Set("Bone")
                end
                Farmop:Set(true)
                selectttolll:Set("Sword")
            end
        else
            NoClip = false
        end
    end
end)

local Bones = Tabs.Main:AddSection("Options")

local ToggleBOnes = Tabs.Main:AddToggle("ToggleBOnes", {
    Title = "Auto Random Bone Suprise",
    Description = "Đổi xương", 
    Default = false })
    ToggleBOnes:OnChanged(function(Value)
        RSuprise = Value
        if RSuprise then
            repeat RS.Remotes.CommF_:InvokeServer("Bones","Buy",1,1) task.wait() until not RSuprise
        end
    end)   
Options.ToggleBOnes:SetValue(false)

local ToggleClaim = Tabs.Main:AddToggle("ToggleClaim", {
    Title = "Claim Quest Bone & Cake",
    Description = "Nhận Nv Bone và Cake", 
    Default = false })
    ToggleClaim:OnChanged(function(Value)
        ClaimQuest = Value
end)
Options.ToggleClaim:SetValue(false)

local Mastery = Tabs.Main:AddSection("Mastery Farm")

local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
    Title = "Select Mastery Mode",
    Values = {"Devil Fruits", "Gun"},
    Multi = false,
    Default = 1,
})
Dropdown:SetValue("")
Dropdown:OnChanged(function(Value)
    SelectTypeMas = Value
end)
local Toggle = Tabs.Main:AddToggle("Toggle", {
    Title = "Enable Mastery - Turn On Auto Bone",
    Description = "Bật Cày Thông Thạo - Bật cày Xương", 
    Default = false })
    Toggle:OnChanged(function(Value)
        MasteryOption = Value
end)
Options.Toggle:SetValue(false)

local skill = {"Z", "X", "C", "V", "F"}
SkillSelected = {}
RealSkillSelected = {}
for r, v in pairs(SkillSelected) do
    if v then
        table.insert(RealSkillSelected, r)
    end
end
local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
    Title = "Select Skills",
    Values = skill,
    Multi = false,
    Default = 1,
})
Dropdown:SetValue("")
Dropdown:OnChanged(function(vSelectSkills)
    SkillSelected[vSelectSkills] = not SkillSelected[vSelectSkills]
    RealSkillSelected = {}
    for r, v in pairs(SkillSelected) do
        if v then
            table.insert(RealSkillSelected, r)
        end
    end
    Notify("Min Hub", "Skill " .. tostring(vSelectSkills) .. ": " .. tostring(SkillSelected[vSelectSkills]) .. "")   
end)

local ListHealth = {'20','25','30','35','40','45','50'}
local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
    Title = "Select Health Mobs",
    Values = ListHealth,
    Multi = false,
    Default = 1,
})
Dropdown:SetValue("40")
Dropdown:OnChanged(function(Value)
    HealthStop = Value
end)

local Section = Tabs.Main:AddSection("Items")

local Toggle = Tabs.Main:AddToggle("Toggle", {
    Title = "Auto Quest Elite",
    Description = "Tự động elite", 
    Default = false })
    Toggle:OnChanged(function(Value)
        Elite = Value
end)
Options.Toggle:SetValue(false)
spawn(function()
    while wait() do
        if Elite then
            if PG.Main.Quest.Visible == true then
                if CheckElite() then
                    v = CheckElite()
                    repeat task.wait()
                        EWeapon(Selecttool)
                        EBuso()
                        ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                        if MasteryOption and HealthStop and v.Humanoid.MaxHealth < 200000 then
                            HealthM = v.Humanoid.Health <= v.Humanoid.MaxHealth * HealthStop / 100
                            if HealthM then
                                repeat task.wait()
                                    local va,ve = CheckMasSkill()
                                    ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    if va and ve then
                                        EWeapon(va)
                                        SendKeyEvents(ve)
                                        NoClip = true
                                        task.wait(.2)
                                    end
                                    SkillAim = true
                                    AimbotPos = v.HumanoidRootPart.Position
                                until not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
                                SkillAim = false
                                AimbotPos = nil
                            else
                                EClick()
                            end
                        else
                            EClick()
                        end
                        NoClip = true
                    until not Elite or not v or not v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health <= 0
                else
                    BDistanceElite()
                end
            else
                if RS.Remotes["CommF_"]:InvokeServer("EliteHunter") == "I don't have anything for you right now. Come back later." then
                else
                    RS.Remotes.CommF_:InvokeServer("EliteHunter")
                end
            end
        end
    end
end)

local Toggle = Tabs.Main:AddToggle("Toggle", {
    Title = "Quest & Claim Saber",
    Description = "Lấy Saber", 
    Default = false })
    Toggle:OnChanged(function(Value)
        SaberQ = Value
end)
Options.Toggle:SetValue(false)
spawn(function()
    while wait() do
        if SaberQ then
            NoClip = true
        else
            NoCLip = false
        end
        TeleportSeaIfWrongSea(1)
        if SaberQ and Data.Level.Value >= 200 then
            if WS.Map.Jungle.Final.Part.Transparency == 0 then
                if WS.Map.Jungle.QuestPlates.Door.Transparency == 0 then
                    SabCF = CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279)
                    if (SabCF.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 20 then
                        ToTween(LP.Character.HumanoidRootPart.CFrame)
                        wait(1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = WS.Map.Jungle.QuestPlates.Plate1.Button.CFrame
                        wait(1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = WS.Map.Jungle.QuestPlates.Plate2.Button.CFrame
                        wait(1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = WS.Map.Jungle.QuestPlates.Plate3.Button.CFrame
                        wait(1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = WS.Map.Jungle.QuestPlates.Plate4.Button.CFrame
                        wait(1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = WS.Map.Jungle.QuestPlates.Plate5.Button.CFrame
                    else
                        ToTween(SabCF)
                    end
                else
                    if WS.Map.Desert.Burn.Part.Transparency == 0 then
                        if LP.Backpack:FindFirstChild("Torch") or LP.Character:FindFirstChild("Torch") then
                            EWeapon("Torch")
                            ToTween(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
                          else
                            ToTween(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))
                        end
                    else
                        if RS.Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
                            RS.Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
                            wait(0.5)
                            EquipWeapon("Cup")
                            wait(0.5)
                            RS.Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",game:GetService("Players").LocalPlayer.Character.Cup)
                            wait(0)
                            RS.Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
                        else
                            if RS.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then
                                RS.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                            elseif RS.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
                                if Enemies:FindFirstChild("Mob Leader") or RS:FindFirstChild("Mob Leader") then
                                    ToTween(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559)) 
                                    for i,v in pairs(Enemies:GetChildren()) do
                                        if v.Name == "Mob Leader" and v.Humanoid.Health > 0 then
                                            if Enemies:FindFirstChild("Mob Leader") then
                                                repeat task.wait()
                                                EBuso()
                                                EWeapon(Selecttool)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                                ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                                EClick()
                                                sethiddenproperty(LP,"SimulationRadius",math.huge)
                                                until not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 or not SaberQ
                                            end
                                        end
                                        if RS:FindFirstChild("Mob Leader") then
                                            ToTween(RS:FindFirstChild("Mob Leader").HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                        end
                                    end
                                end
                            elseif RS.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
                                RS.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                                EWeapon("Relic")
                                ToTween(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
                            end
                        end
                    end
                end
            else
                if Enemies:FindFirstChild("Saber Expert") or RS:FindFirstChild("Saber Expert") then
                    for i,v in pairs(Enemies:GetChildren()) do
                        if v.Name == "Saber Expert" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EWeapon(Selecttool)
                                ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.Humanoid.JumpPower = 0
                                v.Humanoid.WalkSpeed = 0
                                EClick()
                            until v.Humanoid.Health <= 0 or not SaberQ or v.Humanoid.Health <= 0
                            if v.Humanoid.Health <= 0 then
                                RS.Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic")
                            end
                        end
                    end
                end
            end
        end
    end
end)

local Toggle = Tabs.Main:AddToggle("Toggle", {
    Title = "Auto Yama",
    Description = "", 
    Default = false })
    Toggle:OnChanged(function(Value)
        jj = Value
end)
Options.Toggle:SetValue(false)

local Toggle = Tabs.Main:AddToggle("Toggle", {
    Title = "Auto Tushita",
    Description = "", 
    Default = false })
    Toggle:OnChanged(function(Value)
        jj = Value
end)
Options.Toggle:SetValue(false)


local Toggle = Tabs.Main:AddToggle("Toggle", {
    Title = "Auto Pole",
    Description = "", 
    Default = false })
    Toggle:OnChanged(function(Value)
        jj = Value
end)
Options.Toggle:SetValue(false)


local Toggle = Tabs.Main:AddToggle("Toggle", {
    Title = "Auto Gravity Cane",
    Description = "", 
    Default = false })
    Toggle:OnChanged(function(Value)
        jj = Value
end)
Options.Toggle:SetValue(false)

local Toggle = Tabs.Main:AddToggle("Toggle", {
    Title = "Auto Dark Dangger",
    Description = "", 
    Default = false })
    Toggle:OnChanged(function(Value)
        jj = Value
end)
Options.Toggle:SetValue(false)

local Toggle = Tabs.Main:AddToggle("Toggle", {
    Title = "Auto Evo Race",
    Description = "", 
    Default = false })
    Toggle:OnChanged(function(Value)
        jj = Value
end)
Options.Toggle:SetValue(false)

local Toggle = Tabs.Main:AddToggle("Toggle", {
    Title = "Auto Haki Color",
    Description = "", 
    Default = false })
    Toggle:OnChanged(function(Value)
        jj = Value
end)
Options.Toggle:SetValue(false)

local Toggle = Tabs.Main:AddToggle("Toggle", {
    Title = "Auto Sword Legendary",
    Description = "", 
    Default = false })
    Toggle:OnChanged(function(Value)
        jj = Value
end)
Options.Toggle:SetValue(false)
----------------------------------------------------------------------------------------------------------------------------------------
--Stats

local ToggleMelee = Tabs.Stats:AddToggle("ToggleMelee", {Title = "Auto Melee",Description = "Nâng Melee", Default = false })
ToggleMelee:OnChanged(function(Value)
    getgenv().Auto_Stats_Melee = Value
    end)
Options.ToggleMelee:SetValue(false)

local ToggleDe = Tabs.Stats:AddToggle("ToggleDe", {Title = "Auto Defense",Description = "Nâng Máu", Default = false })
ToggleDe:OnChanged(function(Value)
    getgenv().Auto_Stats_Defense = Value
    end)
Options.ToggleDe:SetValue(false)

local ToggleSword = Tabs.Stats:AddToggle("ToggleSword", {Title = "Auto Sword",Description = "Nâng Kiếm", Default = false })
ToggleSword:OnChanged(function(Value)
    getgenv().Auto_Stats_Sword = Value
    end)
Options.ToggleSword:SetValue(false)

local ToggleGun = Tabs.Stats:AddToggle("ToggleGun", {Title = "Auto Gun", Description = "Nâng Súng",Default = false })
ToggleGun:OnChanged(function(Value)
    getgenv().Auto_Stats_Gun = Value
    end)
Options.ToggleGun:SetValue(false)

local ToggleFruit = Tabs.Stats:AddToggle("ToggleFruit", {Title = "Auto Demon Fruit",Description = "Nâng Trái Ác Quỷ", Default = false })
ToggleFruit:OnChanged(function(Value)
    getgenv().Auto_Stats_Devil_Fruit = Value
    end)
Options.ToggleFruit:SetValue(false)
spawn(function()
    while wait() do
        if getgenv().Auto_Stats_Devil_Fruit then
            local args = {
                [1] = "AddPoint",
                [2] = "Demon Fruit",
                [3] = 3
            }
                        
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Auto_Stats_Gun then
            local args = {
                [1] = "AddPoint",
                [2] = "Gun",
                [3] = 3
            }
                        
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Auto_Stats_Sword then
            local args = {
                [1] = "AddPoint",
                [2] = "Sword",
                [3] = 3
            }
                        
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Auto_Stats_Defense then
            local args = {
                [1] = "AddPoint",
                [2] = "Defense",
                [3] = 3
            }
                        
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Auto_Stats_Melee then
            local args = {
                [1] = "AddPoint",
                [2] = "Melee",
                [3] = 3
            }
                        
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)
----------------------------------------------------------------------------------------------------------------------------------------
--Players
local Playerslist = {}
for i,v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(Playerslist,v.Name)
end
local SelectedPly = Tabs.Player:AddDropdown("SelectedPly", {
    Title = "Select Player",
    Values = Playerslist,
    Multi = false,
    Default = 1,
})
SelectedPly:SetValue("nil")
SelectedPly:OnChanged(function(Value)
    getgenv().SelectPly = Value
end)
local ToggleQuanSat = Tabs.Player:AddToggle("ToggleQuanSat", {Title = "Spectate Player",Description = "Quan sát Người Chơi", Default = false })
ToggleQuanSat:OnChanged(function(Value)
    SpectatePlys = Value
    local plr1 = game:GetService("Players").LocalPlayer.Character.Humanoid
    local plr2 = game:GetService("Players"):FindFirstChild(getgenv().SelectPly)
    repeat wait(.1)
        game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players"):FindFirstChild(getgenv().SelectPly).Character.Humanoid
    until SpectatePlys == false 
    game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
end)
Options.ToggleQuanSat:SetValue(false)
local ToggleFastAttack = Tabs.Player:AddToggle("ToggleFastAttack", {Title = " Click Attack Player",Description = "Đánh Người Chơi", Default = false })
ToggleFastAttack:OnChanged(function(Value)
 getgenv().FastAttackFaiFao = Value
end)
Options.ToggleFastAttack:SetValue(false)
local SliderDelayAttackPlayer = Tabs.Player:AddSlider("SliderDelayAttackPlayer", {
    Title = "Delay Fast (sec)",
    Description = "Tốc độ Đánh (giây)",
    Default = 0.1,
    Min = 0,
    Max = 1,
    Rounding = 1,
    Callback = function(Value)
       getgenv().DelayAttackPlayer = Value
    end
})
SliderDelayAttackPlayer:OnChanged(function(Value)
   getgenv().DelayAttackPlayer = Value
end)
SliderDelayAttackPlayer:SetValue(0.1)
spawn(function()
while wait() do
    pcall(function()
        if getgenv().FastAttackFaiFao then
            repeat wait(getgenv().DelayAttackPlayer)
               AttackNoCoolDown()
            until not getgenv().FastAttackFaiFao
        end
    end)
end
end)
local Camera = require(game.ReplicatedStorage.Util.CameraShaker)
Camera:Stop()
local plr = game.Players.LocalPlayer
local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]
function GetCurrentBlade() 
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then return end
    while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
    return ret
end
function AttackNoCoolDown() 
    local AC = CbFw2.activeController
    for i = 1, 1 do 
        local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
            plr.Character,
            {plr.Character.HumanoidRootPart},
            60
        )
        local cac = {}
        local hash = {}
        for k, v in pairs(bladehit) do
            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                table.insert(cac, v.Parent.HumanoidRootPart)
                hash[v.Parent] = true
            end
        end
        bladehit = cac
        if #bladehit > 0 then
            local u8 = debug.getupvalue(AC.attack, 5)
            local u9 = debug.getupvalue(AC.attack, 6)
            local u7 = debug.getupvalue(AC.attack, 4)
            local u10 = debug.getupvalue(AC.attack, 7)
            local u12 = (u8 * 798405 + u7 * 727595) % u9
            local u13 = u7 * 798405
            (function()
                u12 = (u12 * u9 + u13) % 1099511627776
                u8 = math.floor(u12 / u9)
                u7 = u12 - u8 * u9
            end)()
            u10 = u10 + 1
            debug.setupvalue(AC.attack, 5, u8)
            debug.setupvalue(AC.attack, 6, u9)
            debug.setupvalue(AC.attack, 4, u7)
            debug.setupvalue(AC.attack, 7, u10)
            pcall(function()
                for k, v in pairs(AC.animator.anims.basic) do
                    v:Play()
                end                  
            end)
            if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
            end
        end
    end
end

local Section = Tabs.Player:AddSection("Misc")

local ToggleNoClip = Tabs.Player:AddToggle("ToggleNoClip", {Title = "No Clip",Description = "Đi Xuyên Tường", Default = false })
ToggleNoClip:OnChanged(function(value)
    getgenv().LOf = value
end)
Options.ToggleNoClip:SetValue(false)
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if getgenv().LOf then
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            end
        end)
    end)
end)

local ToggleWalkonWater = Tabs.Player:AddToggle("ToggleWalkonWater", {Title = "Walk on Water",Description = "Đi Trên Nước", Default = true })
ToggleWalkonWater:OnChanged(function(Value)
  getgenv().WalkonWater = Value
end)
Options.ToggleWalkonWater:SetValue(true)
spawn(function()
  while task.wait() do
    pcall(function()
      if getgenv().WalkonWater then
        game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,112,1000)
      else
        game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,80,1000)
      end
    end)
  end
end)
local ToggleSpeedRun = Tabs.Player:AddToggle("ToggleSpeedRun", {Title = "Run Speed",Description = "Chạy Nhanh", Default = true })
ToggleSpeedRun:OnChanged(function(Value)
    getgenv().RunSpeed = Value
    if Value == false then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
    end
end)
Options.ToggleSpeedRun:SetValue(true)
spawn(function()
    while wait() do
        if getgenv().RunSpeed then
            InfAb()
        end
    end
end)
function InfAb()
    if getgenv().RunSpeed then
        if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
            local inf = Instance.new("ParticleEmitter")
            inf.Acceleration = Vector3.new(0,0,0)
            inf.Archivable = true
            inf.Drag = 20
            inf.EmissionDirection = Enum.NormalId.Top
            inf.Enabled = true
            inf.Lifetime = NumberRange.new(0,0)
            inf.LightInfluence = 0
            inf.LockedToPart = true
            inf.Name = "Agility"
            inf.Rate = 500
            local numberKeypoints2 = {
                NumberSequenceKeypoint.new(0, 0);
                NumberSequenceKeypoint.new(1, 4); 
            }
            inf.Size = NumberSequence.new(numberKeypoints2)
            inf.RotSpeed = NumberRange.new(9999, 99999)
            inf.Rotation = NumberRange.new(0, 0)
            inf.Speed = NumberRange.new(30, 30)
            inf.SpreadAngle = Vector2.new(0,0,0,0)
            inf.Texture = ""
            inf.VelocityInheritance = 0
            inf.ZOffset = 2
            inf.Transparency = NumberSequence.new(0)
            inf.Color = ColorSequence.new(Color3.fromRGB(0,0,0),Color3.fromRGB(0,0,0))
            inf.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        end
    else
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
        end
    end
end
local ToggleEnablePvp = Tabs.Player:AddToggle("ToggleEnablePvp", {Title = "Auto Enable PVP", Description = "Tự động bật PVP",Default = false })
ToggleEnablePvp:OnChanged(function(Value)
  getgenv().EnabledPvP = Value
end)
Options.ToggleEnablePvp:SetValue(false)
spawn(function()
  pcall(function()
      while wait() do
          if getgenv().EnabledPvP then
              if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
              end
          end
      end
  end)
end)
----------------------------------------------------------------------------------------------------------------------------------------
--RaceV4
local Section = Tabs.Race:AddSection("Race V2-V3")

local Toggle = Tabs.Race:AddToggle("Toggle", {
    Title = "Upgrade Race V2-V3s",
    Description = "Nâng Tộc v2-v3s", 
    Default = false })
    Toggle:OnChanged(function(Value)
        Upgraderace23 = Value
end)
Options.Toggle:SetValue(false)
spawn(function()
    while wait() do
        if Upgraderace23 then
            UpV3NoTween()
        end
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if Upgraderace23 then
                CheckR = CheckVerRace()
                if string.find(CheckR, "V1") then
                    if RS.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
                        if string.find(PG.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(PG.Main.Quest.Container.QuestTitle.Title.Text, "50") and PG.Main.Quest.Visible == true then
                            if CheckSwan() then
                                for i,v in pairs(Enemies:GetChildren()) do
                                    if v.Name == "Swan Pirate" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            EWeapon(Selecttool)
                                            EBuso()
                                            ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                            EClick()
                                            v.HumanoidRootPart.CanCollide = false
                                            NoClip = true
                                        until not Upgraderace23 or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
                                        NoClip = false
                                    end
                                end
                            else
                                Questtween = ToTween(CFrame.new(1057.92761, 137.614319, 1242.08069))
                            end
                        else
                            Bartilotween = ToTween(CFrame.new(-456.28952, 73.0200958, 299.895966))
                            local args = {[1] = "StartQuest", [2] = "BartiloQuest", [3] = 1}
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                    elseif RS.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 1 then
                        Jeremy = CheckBoss("Jeremy")
                        if Jeremy then
                            Target = ReturnB("Jeremy")
                            if Enemies:FindFirstChild("Jeremy") and Target:FindFirstChild("Humanoid") and Target.Humanoid.Health > 0 then
                                repeat task.wait()
                                    EWeapon(Selecttool)
                                    EBuso()
                                    ToTween(Target.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                    EClick()
                                    Target.HumanoidRootPart.CanCollide = false
                                    NoClip = true
                                until not Upgraderace23 or not Target:FindFirstChild("Humanoid") or not Target:FindFirstChild("HumanoidRootPart") or Target.Humanoid.Health <= 0
                                NoClip = false
                            else
                                EBuso()
                                EWeapon(Selecttool)
                                ToTween(Target.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                            end
                        else
                            Notify("Min Hub", "Not Found Boss, Start Hop", 10)
                            HopServer()
                        end
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 2 then
                        StartCFrame = CFrame.new(-1837.46155,44.2921753,1656.19873,0.999881566,-1.03885048e-22,-0.0153914848,1.07805858e-22,1,2.53909284e-22,0.0153914848,-2.55538502e-22,0.999881566)
                        if (StartCFrame.Position - LP.Character.HumanoidRootPart.Position).Magnitude > 500 then
                            ToTween(StartCFrame)
                        else
                            LP.Character.HumanoidRootPart.CFrame = CFrame.new(-1836, 11, 1714)
                            wait(.5)
                            LP.Character.HumanoidRootPart.CFrame = CFrame.new(-1850.49329, 13.1789551, 1750.89685)
                            wait(1)
                            LP.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.87305, 19.3777466, 1712.01807)
                            wait(1)
                            LP.Character.HumanoidRootPart.CFrame = CFrame.new(-1803.94324, 16.5789185, 1750.89685)
                            wait(1)
                            LP.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.55835, 16.8604317, 1724.79541)
                            wait(1)
                            LP.Character.HumanoidRootPart.CFrame = CFrame.new(-1869.54224, 15.987854, 1681.00659)
                            wait(1)
                            LP.Character.HumanoidRootPart.CFrame = CFrame.new(-1800.0979, 16.4978027, 1684.52368)
                            wait(1)
                            LP.Character.HumanoidRootPart.CFrame = CFrame.new(-1819.26343, 14.795166, 1717.90625)
                            wait(1)
                            LP.Character.HumanoidRootPart.CFrame = CFrame.new(-1813.51843, 14.8604736, 1724.79541)
                        end
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 3 then
                        if LP.Backpack:FindFirstChild("Flower 1") and LP.Backpack:FindFirstChild("Flower 2") and LP.Backpack:FindFirstChild("Flower 3") then
                            if (CFrame.new(-2777.6001, 72.9661407, -3571.42285).Position - LP.Character.HumanoidRootPart.Position).magnitude > 3 then
                                ToTween(CFrame.new(-2777.6001, 72.9661407, -3571.42285))
                            elseif (CFrame.new(-2777.6001, 72.9661407, -3571.42285).Position - LP.Character.HumanoidRootPart.Position).magnitude <= 3 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
                            end
                        else
                            RS.Remotes.CommF_:InvokeServer("Alchemist", "1")
                            RS.Remotes.CommF_:InvokeServer("Alchemist", "2")
                            if not LP.Backpack:FindFirstChild("Flower 1") and not LP.Character:FindFirstChild("Flower 1")then
                                if WS.Flower1.Transparency ~= 1 then
                                    Notify("Min Hub", "Collecting Flower 1", 10)
                                    if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
                                        ToTween(game:GetService("Workspace").Flower1.CFrame)
                                    else
                                        StopTween()
                                    end
                                else
                                    if game.Lighting.ClockTime > 3 and game.Lighting.ClockTime < 16 then
                                        Notify("Min Hub", "Hop Night", 10)
                                        HopServer()
                                    end
                                end
                            elseif not LP.Backpack:FindFirstChild("Flower 2") and not LP.Character:FindFirstChild("Flower 2") then
                                if WS.Flower2.Transparency ~= 1 then
                                    Notify("Min Hub", "Collecting Flower 2", 10)
                                end
                                if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
                                    ToTween(game:GetService("Workspace").Flower2.CFrame)
                                else
                                    StopTween()
                                end
                            elseif not LP.Backpack:FindFirstChild("Flower 3") and not LP.Character:FindFirstChild("Flower 3") then
                                Notify("Min Hub", "Collecting Flower 3", 10)
                                if Enemies:FindFirstChild("Zombie") then
                                    for i,v in pairs(Enemies:GetChildren()) do
                                        if v.Name == "Zombie" then
                                            repeat task.wait()
                                                EWeapon(Selecttool)
                                                EBuso()
                                                ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                                EClick()
                                                v.HumanoidRootPart.CanCollide = false
                                                NoClip = true
                                            until not Upgraderace23 or LP.Backpack:FindFirstChild("Flower 3") or v.Humanoid.Health <= 0
                                        end
                                    end
                                else
                                    ToTween(CFrame.new(-5685.9233398438, 48.480125427246, -853.23724365234))
                                end
                            end
                        end
                    end
                else
                    if CheckR == "Human V2" then
                        GetQuestV3()
                        BossQuest = {
                            ["Diamond"] = CheckBoss("Diamond"),
                            ["Fajita"] = CheckBoss("Fajita"),
                            ["Jeremy"] = CheckBoss("Jeremy")
                        }
                        sk = {}
                        for r,v in pairs(BossQuest) do
                            if v then
                                table.insert(sk, r)
                            end
                        end
                        sk2 = "Server Have Boss: "
                        for r, v in pairs(sk) do
                            sk2 = sk2 .. v .. ","
                        end
                        Notify("Min Hub", sk2, 15)
                        if #sk < 3 and CheckVerRace() == "Human V2" then
                            Notify("Min Hub", "Hop Server Have 3 Boss", 15)
                            task.wait(1)
                            HopServer()
                        end
                        if #sk >= 3 then
                            for aq, cg in pairs(BossQuest) do
                                Notify("Race: ", CheckVerRace())
                                if cg and CheckVerRace() == "Human V2" then
                                    Notify("Min Hub", "Start Killing " .. aq .. " Boss To Up Human V3")
                                    Target = ReturnBosses(aq)
                                    repeat wait()
                                        if Target and Enemies:FindFirstChild(Target.Name) and Target:FindFirstChild("Humanoid") and Target:FindFirstChild("HumanoidRootPart") and Target.Humanoid.Health > 0 then
                                            EWeapon(Selecttool)
                                            EBuso()
                                            ToTween(Target.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                            EClick()
                                            Target.HumanoidRootPart.CanCollide = false
                                            NoClip = true
                                        elseif Target then
                                            EWeapon(Selecttool)
                                            EBuso()
                                            ToTween(Target.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                                        end
                                    until not Upgraderace23 or not Target or not Target:FindFirstChild("Humanoid") or not Target:FindFirstChild("HumanoidRootPart") or Target.Humanoid.Health <= 0
                                    NoClip = false
                                end
                            end
                        end
                    elseif CheckR == "Skypiea V2" then
                        GetQuestV3()
                        SkypieaPlayers = {}
                        for r, v in pairs(game.Players:GetChildren()) do
                            if v.Name ~= LP.Name and WS.Characters:FindFirstChild(v.Name) and v:FindFirstChild("Data") and v.Data:FindFirstChild("Race") and v.Data.Race.Value == "Skypiea" and v.Character:FindFirstChild("Humanoid") then
                                table.insert(SkypieaPlayers, v)
                            end
                        end
                        if #SkypieaPlayers > 0 then
                            for r, v in pairs(SkypieaPlayers) do
                                repeat wait()
                                    TargetedPlayer = v.Name
                                    KillStart = true
                                until not v or not Upgraderace23 or Data.Race.Value ~= "Skypiea" or string.find(CheckVerRace(), "V3")
                                KillStart = false
                                TargetedPlayer = nil
                            end
                        else
                            Notify("Min Hub", "Not Found Player, Start Hop", 15)
                            HopServer()
                        end
                    elseif CheckR == "Fishman V2" then
                        GetQuestV3()
                        repeat wait()
                            BoatToggle:Set("PirateGrandBrigade")
                            SeaEvenToggle:Set(true)
                            wait(1)
                        until not Upgraderace23 or not CheckVerRace() == "Fishman V2" or not string.find(CheckVerRace(), "Fish")
                        SeaEvenToggle:Set(false)
                        BoatToggle:Set("")
                    elseif CheckR == "Ghoul V2" then
                        GetQuestV3()
                        repeat wait()
                            KillStart = true
                            wait(1)
                        until not Upgraderace23 or game.Players.LocalPlayer.Data.Race.Value ~= "Ghoul" or string.find(CheckVerRace(), "V3")
                        KillStart = false
                    elseif CheckR == "Cyborg V2" then
                        GetQuestV3()
                        if not DFinBP() then
                            repeat wait()
                                frr = GetFruitBelow1M()
                                if frr then
                                    LoadFruit(frr)
                                end
                            until DFinBP()
                            UpV3NoTween()
                        end
                    elseif CheckR == "Mink V2" then
                        GetQuestV3()
                        local ch = ChestNearF()
                        if ch and CheckR ~= "Mink V3" then
                            ToTween(ch)
                            CountChest = CountChest + 1
                            Notify("Min Hub", "Remaning " .. 30 - CountChest .. " Chest", 7.5)
                            if CountChest >= 30 then
                                UpV3NoTween()
                                Notify("Min Hub", "Race Status: " .. tostring(RS.Remotes.CommF_:InvokeServer("Wenlocktoad", "info")))
                            end
                        elseif ch == nil then
                            repeat wait()
                                local ch = ChestNearF()
                            until ch ~= nil
                        end
                    end
                    if string.find(CheckR, "V3") or string.find(CheckR, "V4") then
                        UpgradeRaceToggle:Set(false)
                    end
                end
            end
        end)
    end         
end)

local Section = Tabs.Race:AddSection("Race V4")

local Toggle = Tabs.Race:AddToggle("Toggle", {
    Title = "Finish Trial Race",
    Description = "Hoàn Thành Ải", 
    Default = false })
    Toggle:OnChanged(function(Value)
        RaceTrial = Value
end)
Options.Toggle:SetValue(false)
task.spawn(function()
    while task.wait() do
        if RaceTrial then
            if WS.Map:FindFirstChild("FishmanTrial") then
                if CheckSeaBeastTrial() and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CheckSeaBeastTrial().HumanoidRootPart.Position).Magnitude <= 2000 then
                    spawn(TeleportSeabeast(CheckSeaBeastTrial()), 1)
                    getgenv().psskill = CheckSeaBeastTrial().HumanoidRootPart.CFrame
                    chodienspamhirimixienchetcuchungmay = true
                else
                    getgenv().psskill = nil
                    chodienspamhirimixienchetcuchungmay = false
                end
            elseif WO.Map:FindFirstChild("HumanTrial") and WO.Locations:FindFirstChild("Trial of Strength") then
                for i,v in pairs(Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        repeat task.wait()
                            EWeapon(Selecttool)
                            EBuso()
                            ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                            EClick()
                            v.HumanoidRootPart.CanCollide = false
                            NoClip = true
                        until not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 or not RaceTrial or not WO.Map:FindFirstChild("HumanTrial") or not WO.Locations:FindFirstChild("Trial of Strength")
                    end
                end
            elseif WS.Map:FindFirstChild("GhoulTrial") and WO.Locations:FindFirstChild("Trial of Carnage") then
                for i,v in pairs(Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        repeat task.wait()
                            EWeapon(Selecttool)
                            EBuso()
                            ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                            EClick()
                            v.HumanoidRootPart.CanCollide = false
                            NoClip = true
                        until not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 or not RaceTrial or not WS.Map:FindFirstChild("GhoulTrial") or not WO.Locations:FindFirstChild("Trial of Carnage")
                    end
                end
            elseif Data.Race.Value == "Skypiea" then
                local v = WS.Map.SkyTrial.Model.FinishPart
                if (v.Position - LP.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
                    wait(2)
                    ToTween(v.CFrame)
                    NoClip = true
                    wait(3)
                end
            elseif Data.Race.Value == "Mink" then
                local c0 = game:GetService("Workspace").StartPoint
                if (c0.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                    ToTween(c0.CFrame)
                    NoClip = false
                    for r, v in pairs(game:GetDescendants()) do
                        if v:IsA("TouchInterest") or v.Name == "TouchInterest" then
                            if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                                firetouchinterest(v)
                            end
                        end
                    end
                end
            elseif Data.Race.Value == "Cyborg" then
                CyborgBypassCFrame =CFrame.new(-20021.8691,10090.4893,-16.37994,-0.976144373,6.71342875e-08,-0.217122361,8.46145412e-08,1,-7.1212007e-08,0.217122361,-8.78849065e-08,-0.976144373)
                if (CyborgBypassCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
                    ToTween(CyborgBypassCFrame)
                    wait(3)
                end
            end
        end
    end
end)

local Toggle = Tabs.Race:AddToggle("Toggle", {
    Title = "Kill Player After Trial",
    Description = "Kill NgChơi", 
    Default = false })
    Toggle:OnChanged(function(Value)
        KillTrials = Value
end)
Options.Toggle:SetValue(false)
task.spawn(function()
    while task.wait() do
        if KillTrials then
            for i,v in pairs(WS.Characters:GetChildren()) do
                magnitude = (LP.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                if magnitude <= 300 and v ~= game.Players.LocalPlayer.Character then
                    repeat task.wait()
                        ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,8,0))
                        EWeapon(Selecttool)
                        EBuso()
                        EClick()
                        NoClip = true
                        SpamEnable = true
                    until not KillPlayer or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid")
                    NoClip = false
                    SpamEnable = false
                end
            end
        end
        if SpamEnable then
            local SW = checkskillSword()
            local ML = checkskillMelee()
            if SW then
                local CheckSW = checkskillSword()
                SendKeyEvents(CheckSW)
            elseif ML then
                local CheckML = checkskillMelee()
                SendKeyEvents(CheckML)
            end
        end
    end
end)

local Toggle = Tabs.Race:AddToggle("Toggle", {
    Title = "Choose Gear",
    Description = "Chọn Gear", 
    Default = false })
    Toggle:OnChanged(function(Value)
        ChooseGear = Value
end)
Options.Toggle:SetValue(false)
spawn(function()
    while wait() do
        if ChooseGear then
            InstantChooseGear()
        end
    end
end)

local Section = Tabs.Race:AddSection("Temple Of Time & Mirage Island")

Tabs.Race:AddButton({
    Title = "Teleport Temple Of Time",
    Description = "Đến Đền",
    Callback = function()
        TTemplateT()
      end
})

Tabs.Race:AddButton({
    Title = "Teleport Lever",
    Description = "Đến Cần Gạt",
    Callback = function()
        TTemplateT()
        ToTween(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
      end
})

Tabs.Race:AddButton({
    Title = "Teleport Acient One",
    Description = "Đến npc bán bánh răng",
    Callback = function()
        TTemplateT()
        ToTween(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
      end
})

Tabs.Race:AddButton({
    Title = "Teleport Trial Door",
    Description = "Đến cửa Ải",
    Callback = function()
        TTemplateT()
        local raceval = game:GetService("Players").LocalPlayer.Data.Race.Value
        if raceval == "Fishman" then
            ToTween(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
        elseif raceval == "Human" then
            ToTween(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
        elseif raceval == "Cyborg" then
            ToTween(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
        elseif raceval == "Skypiea" then
            ToTween(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
        elseif raceval == "Ghoul" then
            ToTween(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
        elseif raceval == "Mink" then
            ToTween(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
        end
      end
})

Tabs.Race:AddButton({
    Title = "Find Blue Gear",
    Description = "Tìm bánh răng",
    Callback = function()
        TimBlueGearDitmemay()
      end
})

Tabs.Race:AddButton({
    Title = "Find Advanced Fruit Dealer",
    Description = "Tìm Npc bán Fruit",
    Callback = function()
        FindAdvancedDealer()
      end
})

local Toggle = Tabs.Race:AddToggle("Toggle", {
    Title = "Lock Cam Moon",
    Description = "Nhìn Trăng", 
    Default = false })
    Toggle:OnChanged(function(Value)
        LockMoon = Value
end)
Options.Toggle:SetValue(false)

local Toggle = Tabs.Race:AddToggle("Toggle", {
    Title = "Tween To Mystic Island",
    Description = "Đến đảo Kì Bí", 
    Default = false })
    Toggle:OnChanged(function(Value)
        MIsland = Value
end)
Options.Toggle:SetValue(false)
Loop:Connect(function()
    if LockMoon then
        WS.CurrentCamera.CFrame = CFrame.new(WS.CurrentCamera.CFrame.Position,game:GetService("Lighting"):GetMoonDirection() + WS.CurrentCamera.CFrame.Position)
    end
    if MIsland then
        if WS.Map:FindFirstChild("MysticIsland") then
            ToTween(CFrame.new(WS.Map.MysticIsland.Center.Position.X,500,WS.Map.MysticIsland.Center.Position.Z))
            NoClip = true
        else
            NoClip = false
        end
    else
        NoClip = false
    end
end)

local Section = Tabs.Race:AddSection("Kitsune Update")

local Toggle = Tabs.Race:AddToggle("Toggle", {
    Title = "Tween to Kitsune Island",
    Description = "Đến đảo Kitsune", 
    Default = false })
    Toggle:OnChanged(function(Value)
        KitsuneI = Value
        if KitsuneI then
            repeat ToTween(WO.Locations:FindFirstChild("Kitsune Island").CFrame) wait() until KitsuneI == false
        end
end)
Options.Toggle:SetValue(false)
spawn(function()
    while task.wait() do
        if KitsuneI then
            for i,v in pairs(WO.Locations:GetChildren()) do
                if v:FindFirstChild("Kitsune Island") then
                    ToTween(v:FindFirstChild("Kitsune Island"))
                    NoClip = true
                else
                    NoClip = false
                end
            end
        end
        if AzuEmber then
            for i,v in pairs(WS.EmberTemplate:GetChildren()) do
                if v.Name == "Part" then
                    LP.Character.HumanoidRootPart.CFrame = v.CFrame
                end
            end
        end
    end
end)

local Toggle = Tabs.Race:AddToggle("Toggle", {
    Title = "Farm Azure Amber",
    Description = "Nhặt Hồn Lửa", 
    Default = false })
    Toggle:OnChanged(function(Value)
        AzuEmber = Value
end)
Options.Toggle:SetValue(false)

local Section = Tabs.Race:AddSection("Sea Event")

if Dressora then
    CFrameBoat = CFrame.new(-13.488054275512695, 10.311711311340332, 2927.69287109375)
    Vector3Boat = Vector3.new(-13.488054275512695, 10.311711311340332, 2927.69287109375)
elseif Zou then
    CFrameBoat = CFrame.new(-16207.501953125, 9.0863618850708, 475.1490783691406)
    Vector3Boat = Vector3.new(-16207.501953125, 9.0863618850708, 475.1490783691406)
end

local Dropdown = Tabs.Race:AddDropdown("Dropdown", {
    Title = "Select Boat",
    Values = {"PirateBrigade", "PirateGrandBrigade"},
    Multi = false,
    Default = 1,
})
Dropdown:SetValue("")
Dropdown:OnChanged(function(Value)
    BoatSelect = Value
end)

local Dropdown = Tabs.Race:AddDropdown("Dropdown", {
    Title = "Select Zone",
    Values = {"Zone 1", "Zone 2", "Zone 3", "Zone 4", "Zone 5", "Zone 6"},
    Multi = false,
    Default = 1,
})
Dropdown:SetValue("")
Dropdown:OnChanged(function(Value)
    ZoneSelect = Value
end)
game:GetService("RunService").RenderStepped:Connect(function()
    if BoatSelect == "PirateBrigade" then
        BoatNameBuy = "PirateBrigade"
    elseif BoatSelect == "PirateGrandBrigade" then
        BoatNameBuy = "PirateGrandBrigade"
    end
    if ZoneSelect == "Zone 1" then
        if BoatSelect == "PirateBrigade" then
            ZoneCFrame = CFrame.new(-21313.607421875, 12.560698509216309, 1330.6165771484375)
        elseif BoatSelect == "PirateGrandBrigade" then
            ZoneCFrame = CFrame.new(-21313.607421875, 45.95185470581055, 1330.6165771484375)
        end
    elseif ZoneSelect == "Zone 2" then
        if BoatSelect == "PirateBrigade" then
            ZoneCFrame = CFrame.new(-24815.267578125, 12.560657501220703, 5262.62060546875)
        elseif BoatSelect == "PirateGrandBrigade" then
            ZoneCFrame = CFrame.new(-24815.267578125, 45.90665817260742, 5262.62060546875)
        end
    elseif ZoneSelect == "Zone 3" then
        if BoatSelect == "PirateBrigade" then
            ZoneCFrame = CFrame.new(-28464.876953125, 12.553319931030273, 6896.8076171875)
        elseif BoatSelect == "PirateGrandBrigade" then
            ZoneCFrame = CFrame.new(-28464.876953125, 45.90665817260742, 6896.8076171875)
        end
    elseif ZoneSelect == "Zone 4" then
        if BoatSelect == "PirateBrigade" then
            ZoneCFrame = CFrame.new(-30294.8515625, 12.554117202758789, 10409.8564453125)
        elseif BoatSelect == "PirateGrandBrigade" then
            ZoneCFrame = CFrame.new(-30294.8515625, 45.95185470581055, 10409.8564453125)
        end
    elseif ZoneSelect == "Zone 5" then
        if BoatSelect == "PirateBrigade" then
            ZoneCFrame = CFrame.new(-37704.828125, 12.561018943786621, 6750.69873046875)
        elseif BoatSelect == "PirateGrandBrigade" then
            ZoneCFrame = CFrame.new(-37704.828125, 45.90665817260742, 6750.69873046875)
        end
    elseif ZoneSelect == "Zone 6" or ZoneSelect == nil then
        if BoatSelect == "PirateBrigade" then
            ZoneCFrame = CFrame.new(-32704.103515625, 12.557344436645508, 24089.923828125)
        elseif BoatSelect == "PirateGrandBrigade" then
            ZoneCFrame = CFrame.new(-32704.103515625, 45.90665817260742, 24089.923828125)
        end
    end
end)

local Toggle = Tabs.Race:AddToggle("Toggle", {
    Title = "Quest Sea Events",
    Description = "Cày Sự Kiện Biển", 
    Default = false })
    Toggle:OnChanged(function(Value)
        SeaEvent = Value
end)
Options.Toggle:SetValue(false)
spawn(function()
    while task.wait() do
        if SeaEvent then
            pcall(function()
                if not CheckSeaBeast() and not CheckPirateBoat() and not Enemies:FindFirstChild("Shark") and not Enemies:FindFirstChild("Piranha") and not Enemies:FindFirstChild("Terrorshark") and not Enemies:FindFirstChild("Fish Crew Member") and not Enemies:FindFirstChild("FishBoat") then
                    if not checkboat() then
                        if (Vector3Boat - LP.Character.HumanoidRootPart.Position).Magnitude > 2000 then
                            BypassTele(CFrameBoat)
                        else
                            ToTween(CFrameBoat)
                            NoClip = true
                            if (Vector3Boat - LP.Character.HumanoidRootPart.Position).Magnitude < 20 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", BoatNameBuy)
                            end
                        end
                    elseif checkboat() and not WO.Locations:FindFirstChild("Rough Sea") then
                        if (checkboat().VehicleSeat.Position - Vector3Boat).Magnitude > 50 then
                            checkboat().VehicleSeat.CFrame = ZoneCFrame
                        end
                        if not game:GetService("Players").LocalPlayer.Character.Humanoid.Sit then
                            NoClip = true
                            ToTween(checkboat().VehicleSeat.CFrame)
                        else
                            NoClip = false
                        end
                    elseif checkboat() and WO.Locations:FindFirstChild("Rough Sea") then
                        if LP.Character.Humanoid.Sit then
                            LP.Character.Humanoid.Sit = false
                        end
                        if (checkboat().VehicleSeat.Position - Vector3Boat).Magnitude > 50 then
                            checkboat().VehicleSeat.CFrame = CFrame.new(-28464.876953125, 12.553319931030273, 6896.8076171875)
                        end
                        if not game:GetService("Players").LocalPlayer.Character.Humanoid.Sit then
                            NoClip = true
                            ToTween(checkboat().VehicleSeat.CFrame)
                        else
                            NoClip = false
                        end
                    elseif not checkboat() and WO.Locations:FindFirstChild("Rough Sea") then
                        if (Vector3Boat - LP.Character.HumanoidRootPart.Position).Magnitude > 2000 then
                            BypassTele(CFrameBoat)
                        end
                    end
                elseif CheckPirateBoat() then
                    if game:GetService("Players").LocalPlayer.Character.Humanoid.Sit then
                        game:GetService("Players").LocalPlayer.Character.Humanoid.Sit = false
                    end
                    for i,v in pairs(Enemies:GetChildren()) do
                        if v:FindFirstChild("Engine") then
                            repeat task.wait()
                                ToTween(v.Engine.CFrame * CFrame.new(0, -20, 0))
                                chodienspamhirimixienchetcuchungmay = true
                                NoClip = true
                                getgenv().psskill = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                            until not v or not v.Parent or v.Health.Value <= 0 or not CheckPirateBoat() or not SeaEvent
                            getgenv().psskill = nil
                            chodienspamhirimixienchetcuchungmay = false
                            NoClip = false
                        end
                    end
                elseif CheckSeaBeast() then
                    if LP.Character.Humanoid.Sit then
                        LP.Character.Humanoid.Sit = false
                    end
                    local v = CheckSeaBeast()
                    repeat
                        task.wait()
                        if LP.Character.Humanoid.Health > 8000 then
                            spawn(TeleportSeabeast(v), 1)
                            chodienspamhirimixienchetcuchungmay = true
                        elseif LP.Character.Humanoid.Health <= healthlow then
                            if YTween then
                                ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,600,0))
                                chodienspamhirimixienchetcuchungmay = false
                            else
                                spawn(TeleportSeabeast(v), 1)
                                chodienspamhirimixienchetcuchungmay = true
                            end
                        end
                        NoClip = true
                        getgenv().psskill = LP.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                    until not v or not v.Parent or v.Health.Value <= 0 or not CheckSeaBeast() or not SeaEvent
                    getgenv().psskill = nil
                    chodienspamhirimixienchetcuchungmay = false
                    NoClip = false
                elseif Enemies:FindFirstChild("Shark") then
                    if LP.Character.Humanoid.Sit then
                        LP.Character.Humanoid.Sit = false
                    end
                    for i,v in pairs(Enemies:GetChildren()) do
                        if v.Name == "Shark" and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EBuso()
                                EWeapon(Selecttool)
                                if game.Players.LocalPlayer.Character.Humanoid.Health > 8000 then
                                    ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                elseif game.Players.LocalPlayer.Character.Humanoid.Health <= healthlow then
                                    if YTween then
                                        ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,600,0))
                                    else
                                        ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    end
                                end
                                NoClip = true
                            until not Enemies:FindFirstChild("Shark") or v.Humanoid.Health <= 0 or not SeaEvent
                            NoClip = false
                        end
                    end
                elseif Enemies:FindFirstChild("Piranha") then
                    if LP.Character.Humanoid.Sit then
                        LP.Character.Humanoid.Sit = false
                    end
                    for i,v in pairs(Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Piranha") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EBuso()
                                EWeapon(Selecttool)
                                if game.Players.LocalPlayer.Character.Humanoid.Health > 8000 then
                                    ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                elseif game.Players.LocalPlayer.Character.Humanoid.Health <= healthlow then
                                    if YTween then
                                        ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,600,0))
                                    else
                                        ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    end
                                end
                                NoClip = true
                            until not Enemies:FindFirstChild("Piranha") or v.Humanoid.Health <= 0 or not SeaEvent
                            NoClip = false
                        end
                    end
                elseif Enemies:FindFirstChild("Terrorshark") then
                    if LP.Character.Humanoid.Sit then
                        LP.Character.Humanoid.Sit = false
                    end
                    for i,v in pairs(Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EBuso()
                                EWeapon(Selecttool)
                                NoClip = true
                                if game.Players.LocalPlayer.Character.Humanoid.Health > 8000 then
                                    ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                elseif game.Players.LocalPlayer.Character.Humanoid.Health <= healthlow then
                                    if YTween then
                                        ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,600,0))
                                    else
                                        ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    end
                                end
                            until not Enemies:FindFirstChild("Terrorshark") or v.Humanoid.Health <= 0 or not SeaEvent
                            NoClip = false
                        end
                    end
                elseif Enemies:FindFirstChild("FishBoat") and Enemies:FindFirstChild("Fish Crew Member") then
                    if LP.Character.Humanoid.Sit then
                        LP.Character.Humanoid.Sit = false
                    end
                    for i,v in pairs(Enemies:GetChildren()) do
                        if v:FindFirstChild("VehicleSeat") then
                            repeat task.wait()
                                ToTween(v.VehicleSeat.CFrame * CFrame.new(0, -10, 0))
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                chodienspamhirimixienchetcuchungmay = true
                                NoClip = true
                                getgenv().psskill = LP.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                            until not v or not v.Parent or v.Health.Value <= 0 or not Enemies:FindFirstChild("FishBoat") or not SeaEvent
                            getgenv().psskill = nil
                            chodienspamhirimixienchetcuchungmay = false
                            NoClip = false
                        end
                    end
                elseif not Enemies:FindFirstChild("FishBoat") and Enemies:FindFirstChild("Fish Crew Member") then
                    if LP.Character.Humanoid.Sit then
                        LP.Character.Humanoid.Sit = false
                    end
                    for i,v in pairs(Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Fish Crew Member") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EBuso()
                                EWeapon(Selecttool)
                                NoClip = true
                                if game.Players.LocalPlayer.Character.Humanoid.Health > 8000 then
                                    ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                elseif game.Players.LocalPlayer.Character.Humanoid.Health <= healthlow then
                                    if YTween then
                                        ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,600,0))
                                    else
                                        ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    end
                                end
                            until not Enemies:FindFirstChild("Fish Crew Member") or v.Humanoid.Health <= 0 or not SeaEvent
                            NoClip = false
                        end
                    end
                end
            end)
        end
    end       
end)

local Section = Tabs.Race:AddSection("Low Health")

local Slider = Tabs.Race:AddSlider("Slider", {
	Title = "Set Low Health",
	Description = "Đặt Máu",
	Default = 4000,
	Min = 0,
	Max = 13095,
	Rounding = 1,
Callback = function(Value)
	healthlow = Value
end
})
Slider:OnChanged(function(Value)
	healthlow = Value
end)
Slider:SetValue(4000)

local Toggle = Tabs.Race:AddToggle("Toggle", {
    Title = "Low Health Y Tween",
    Description = "Bay lên Cao Nếu Yếu Máu", 
    Default = true })
    Toggle:OnChanged(function(Value)
        YTween = Value
end)
Options.Toggle:SetValue(true)

local Section = Tabs.Race:AddSection("Spam Skill")

local Toggle = Tabs.Race:AddToggle("Toggle", {
    Title = "Spam Melee",
    Description = "", 
    Default = false })
    Toggle:OnChanged(function(Value)
        SpamMelees = Value
end)
Options.Toggle:SetValue(false)

local Toggle = Tabs.Race:AddToggle("Toggle", {
    Title = "Spam Sword",
    Description = "", 
    Default = false })
    Toggle:OnChanged(function(Value)
        SpamSwords = Value
end)
Options.Toggle:SetValue(false)

local Toggle = Tabs.Race:AddToggle("Toggle", {
    Title = "Spam Gun",
    Description = "", 
    Default = false })
    Toggle:OnChanged(function(Value)
        SpamGuns = Value
end)
Options.Toggle:SetValue(false)

local Toggle = Tabs.Race:AddToggle("Toggle", {
    Title = "Spam Devil Fruit",
    Description = "", 
    Default = false })
    Toggle:OnChanged(function(Value)
        SpamDFs = Value
end)
Options.Toggle:SetValue(false)
----------------------------------------------------------------------------------------------------------------------------------------
--shop
local Dropdown = Tabs.S:AddDropdown("Dropdown", {
    Title = "Select Melee",
    Values = {
		"Dark Step",
		"Electro",
		"Fishman Karate",
		"Dragon Claw",
		"SuperHuman",
		"Death Step",
		"Electric Claw",
		"SharkMan Karate",
		"Dragon Talon",
		"God Human",
        "Seguine Art"
    },
    Multi = false,
    Default = 1,
})
Dropdown:SetValue("")
Dropdown:OnChanged(function(Value)
    _G.BuyMelee = Value
end)

Tabs.S:AddButton({
    Title = "Buy Melee",
    Description = "Mua Melee",
    Callback = function()
        if _G.BuyMelee == "Dark Step" then
            RS.Remotes.CommF_:InvokeServer("BuyBlackLeg")
        elseif _G.BuyMelee == "Electro" then
            RS.Remotes.CommF_:InvokeServer("BuyElectro")
        elseif _G.BuyMelee == "Fishman Karate" then
            RS.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
        elseif _G.BuyMelee == "Dragon Claw" then
            RS.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
            RS.Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
        elseif _G.BuyMelee == "SuperHuman" then
            RS.Remotes.CommF_:InvokeServer("BuySuperhuman")
        elseif _G.BuyMelee == "Death Step" then
            RS.Remotes.CommF_:InvokeServer("BuyDeathStep")
        elseif _G.BuyMelee == "Electric Claw" then
            RS.Remotes.CommF_:InvokeServer("BuyElectricClaw")
        elseif _G.BuyMelee == "SharkMan Karate" then
            RS.Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
            RS.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
        elseif _G.BuyMelee == "Dragon Talon" then
            RS.Remotes.CommF_:InvokeServer("BuyDragonTalon")
        elseif _G.BuyMelee == "God Human" then
            RS.Remotes.CommF_:InvokeServer("BuyGodhuman")
        elseif _G.BuyMelee == "Seguine Art" then
            RS.Remotes.CommF_:InvokeServer("BuySanguineArt")
        end
      end
})

Tabs.S:AddButton({
    Title = "Buy Race Ghoul",
    Description = "Mua Tộc Quỷ",
    Callback = function()
        local args = {[1] = "Ectoplasm", [2] = "BuyCheck", [3] = 4}
        RS.Remotes.CommF_:InvokeServer(unpack(args))
    local args = {[1] = "Ectoplasm", [2] = "Change", [3] = 4}
        RS.Remotes.CommF_:InvokeServer(unpack(args))
  	end   
})

Tabs.S:AddButton({
    Title = "Buy Race Cyborg",
    Description = "Mua Tộc Cyborg",
    Callback = function()
        local args = {[1] = "CyborgTrainer", [2] = "Buy"}
        RS.Remotes.CommF_:InvokeServer(unpack(args))
      end
})

Tabs.S:AddButton({
    Title = "Buy Buso Haki",
    Description = "Mua haki Buso",
    Callback = function()
        RS.Remotes.CommF_:InvokeServer("BuyHaki","Buso")
      end
})

Tabs.S:AddButton({
    Title = "Buy Geppo",
    Description = "Mua Geppo",
    Callback = function()
        RS.Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
      end
})

Tabs.S:AddButton({
    Title = "Buy Soru",
    Description = "Mua Soru",
    Callback = function()
        RS.Remotes.CommF_:InvokeServer("BuyHaki","Soru")
      end
})

Tabs.S:AddButton({
    Title = "Buy Ken(Observation)",
    Description = "Mua haki quan sát",
    Callback = function()
        RS.Remotes.CommF_:InvokeServer("KenTalk","Buy")
      end
})

Tabs.S:AddButton({
    Title = "Reset Stats",
    Description = "Hoàn Hoàn trả chỉ số",
    Callback = function()
        RS.Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
        RS.Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
      end
})

Tabs.S:AddButton({
    Title = "Race Reroll",
    Description = "Đổi Tộc",
    Callback = function()
        RS.Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
	    RS.Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
      end
})

Tabs.S:AddButton({
    Title = "Random Fruit",
    Description = "Đổi Fruit",
    Callback = function()
        RS.Remotes.CommF_:InvokeServer("Cousin","Buy")
      end
})

Tabs.S:AddButton({
    Title = "Devil Fruit Shop",
    Description = "Cửa Hàng Fruit",
    Callback = function()
        RS.Remotes.CommF_:InvokeServer("GetFruits")
        PG.Main.FruitShop.Visible = true
      end
})

local Toggle = Tabs.S:AddToggle("Toggle", {
    Title = "Store Fruit",
    Description = "Cất Fruit", 
    Default = false })
    Toggle:OnChanged(function(Value)
        fSTORE = Value
end)
Options.Toggle:SetValue(false)

local Toggle = Tabs.S:AddToggle("Toggle", {
    Title = "Teleport to Fruit",
    Description = "Nhặt Fruit", 
    Default = false })
    Toggle:OnChanged(function(Value)
        TPFruit = Value
end)
Options.Toggle:SetValue(false)
spawn(function()
    while wait(.1) do
        if TPFruit then
            for i,v in pairs(WS:GetChildren()) do
                if string.find(v.Name, "Fruit") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                end
            end
        end
        if fSTORE then
            StoreFruit()
		end
    end
end)
----------------------------------------------------------------------------------------------------------------------------------------
--Miscs
Tabs.M:AddButton({
    Title = "Rejoin Server",
    Description = "Vào Lại Sv",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
      end
})
Tabs.M:AddButton({
    Title = "Hop Server",
    Description = "Đổi Sv",
    Callback = function()
        HopServer()
      end
})
local Section = Tabs.M:AddSection("Esp Section")

local ToggleEspPlayer = Tabs.M:AddToggle("ToggleEspPlayer", {Title = "Esp Player",Description = "Định vị Người Chơi", Default = false })
ToggleEspPlayer:OnChanged(function(Value)
    ESPPlayer = Value
	UpdatePlayerChams()
end)
Options.ToggleEspPlayer:SetValue(false)


local ToggleEspFruit = Tabs.M:AddToggle("ToggleEspFruit", {Title = "Esp Demon Fruit",Description = "Định Vị Trái", Default = false })
ToggleEspFruit:OnChanged(function(Value)
    DevilFruitESP = Value
    while DevilFruitESP do wait()
        UpdateDevilChams() 
    end
end)
Options.ToggleEspFruit:SetValue(false)
local ToggleEspIsland = Tabs.M:AddToggle("ToggleEspIsland", {Title = "Esp Island",Description = "Định Vị Đảo", Default = false })

ToggleEspIsland:OnChanged(function(Value)
    IslandESP = Value
    while IslandESP do wait()
        UpdateIslandESP() 
    end
end)
Options.ToggleEspIsland:SetValue(false)
local ToggleEspFlower = Tabs.M:AddToggle("ToggleEspFlower", {Title = "Esp Flower",Description = "Định Vị Hoa", Default = false })

ToggleEspFlower:OnChanged(function(Value)
    FlowerESP = Value
	UpdateFlowerChams() 
end)
Options.ToggleEspFlower:SetValue(false)
spawn(function()
    while wait(2) do
        if FlowerESP then
            UpdateFlowerChams() 
        end
        if DevilFruitESP then
            UpdateDevilChams() 
        end
        if ChestESP then
            UpdateChestChams() 
        end
        if ESPPlayer then
            UpdatePlayerChams()
        end
        if RealFruitESP then
            UpdateRealFruitChams()
        end
    end
end)
----------------------------------------------------------------------------------------------------------------------------------------
--Raids
SelectRaid = {}
RaidsModule = require(game.ReplicatedStorage.Raids)
for i,v in pairs(RaidsModule.raids) do
    table.insert(SelectRaid,v)
end
for i,v in pairs(RaidsModule.advancedRaids) do
    table.insert(SelectRaid,v)
end
local DropdownRaid = Tabs.Raid:AddDropdown("DropdownRaid", {
    Title = "Choose Raid",
    Values = SelectRaid,
    Multi = false,
    Default = 1,
})
DropdownRaid:SetValue("...")
DropdownRaid:OnChanged(function(Value)
    getgenv().SelectChip = Value
end)
local ToggleBuy = Tabs.Raid:AddToggle("ToggleBuy", {Title = "Auto Buy Microchip", Description = "Mua Chip",Default = false })
ToggleBuy:OnChanged(function(Value)
    getgenv().Auto_Buy_Chips_Dungeon = Value
end)
Options.ToggleBuy:SetValue(false)
spawn(function()
    while wait() do
		if getgenv().Auto_Buy_Chips_Dungeon then
			pcall(function()
				local args = {
					[1] = "RaidsNpc",
					[2] = "Select",
					[3] = getgenv().SelectChip
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end)
        end
    end
end)

    local ToggleStart = Tabs.Raid:AddToggle("ToggleStart", {Title = "Auto Join Raid",Description = "Vào Tập Kích", Default = false })
    ToggleStart:OnChanged(function(Value)
        getgenv().Auto_StartRaid = Value
end)
Options.ToggleStart:SetValue(false)
spawn(function()
    while wait(.1) do
        pcall(function()
            if getgenv().Auto_StartRaid then
                if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                    if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                        if Dressora then
                            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                        elseif Zou then
                            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                        end
                    end
                end
            end
        end)
    end
end)

local ToggleKillAura = Tabs.Raid:AddToggle("ToggleKillAura", {Title = "Auto Kill Mobs",Description = "Giết Quái", Default = false })
ToggleKillAura:OnChanged(function(Value)
    getgenv().KillAura = Value
end)
Options.ToggleKillAura:SetValue(false)
spawn(function()
    while wait() do
        if getgenv().KillAura then
            pcall(function()
                for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                         repeat wait()
                            sethiddenproperty(game:GetService('Players').LocalPlayer,"SimulationRadius",math.huge)
                            v.Humanoid.Health = 0
                            v.HumanoidRootPart.CanCollide = false
                        until not getgenv().KillAura or not v.Parent or v.Humanoid.Health <= 0
                    end
                end
            end)
        end
    end
end)

local ToggleNextIsland = Tabs.Raid:AddToggle("ToggleNextIsland", {Title = "Auto Next Place",Description = "Qua Đảo", Default = false })
ToggleNextIsland:OnChanged(function(Value)
    getgenv().AutoNextIsland = Value
end)
Options.ToggleNextIsland:SetValue(false)
spawn(function()
    while task.wait() do
        if getgenv().AutoNextIsland then
            pcall(function()
                if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
                    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
                        Tween2(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame * CFrame.new(0,70,100))
                    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
                        Tween2(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame * CFrame.new(0,70,100))
                    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
                        Tween2(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame * CFrame.new(0,70,100))
                    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
                        Tween2(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame * CFrame.new(0,70,100))
                    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                        Tween2(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame * CFrame.new(0,70,100))
                    end
                end
            end)
        end
    end
end)

local ToggleAwake = Tabs.Raid:AddToggle("ToggleAwake", {Title = "Auto Awake",Description = "Thức tỉnh V2", Default = false })
ToggleAwake:OnChanged(function(Value)
    getgenv().AutoAwakenAbilities = Value
end)
Options.ToggleAwake:SetValue(false)
spawn(function()
    while task.wait() do
        if getgenv().AutoAwakenAbilities then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
            end)
        end
    end
end)
----------------------------------------------------------------------------------------------------------------------------------------
--Teleport
local Teleport = Tabs.Teleport:AddSection("Teleport World")
Tabs.Teleport:AddButton({
    Title = "Teleport to Old World",
    Description = "Sea 1",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end
})
Tabs.Teleport:AddButton({
    Title = "Teleport to Second World",
    Description = "Sea 2",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})
Tabs.Teleport:AddButton({
    Title = "Teleport to Third World",
    Description = "Sea 3",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
})
local Mastery = Tabs.Teleport:AddSection("Teleport Island")
if Main then
                IslandList = {
                "WindMill",
                "Marine",
                "Middle Town",
                "Jungle",
                "Pirate Village",
                "Desert",
                "Snow Island",
                "MarineFord",
                "Colosseum",
                "Sky Island 1",
                "Sky Island 2",
                "Sky Island 3",
                "Prison",
                "Magma Village",
                "Under Water Island",
                "Fountain City",
                "Shank Room",
                "Mob Island",
                                }
elseif Dressora then
       IslandList = {
        "The Cafe",
        "Frist Spot",
        "Dark Area",
        "Flamingo Mansion",
        "Flamingo Room",
        "Green Zone",
        "Factory",
        "Colossuim",
        "Zombie Island",
        "Two Snow Mountain",
        "Punk Hazard",
        "Cursed Ship",
        "Ice Castle",
        "Forgotten Island",
        "Ussop Island",
        "Mini Sky Island",
       }
elseif Zou then
    IslandList = {
        "Mansion",
        "Port Town",
        "Great Tree",
        "Castle On The Sea",
        "MiniSky", 
        "Hydra Island",
        "Floating Turtle",
        "Haunted Castle",
        "Ice Cream Island",
        "Peanut Island",
        "Cake Island",
        "Cocoa Island",
        "Candy Island",
        "Tiki Outpost",
       }
    end
local DropdownIsland = Tabs.Teleport:AddDropdown("DropdownIsland",{
    Title = "Choose Island",
    Values = IslandList,
    Multi = false,
    Default = 1,
})
DropdownIsland:SetValue("...")
DropdownIsland:OnChanged(function(Value)
    getgenv().SelectIsland = Value
end)
Tabs.Teleport:AddButton({
    Title = "Teleport to Island",
    Description = "Bay Đến Đảo",
    Callback = function()
            if getgenv().SelectIsland == "WindMill" then
                ToTween(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
            elseif getgenv().SelectIsland == "Marine" then
                ToTween(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
            elseif getgenv().SelectIsland == "Middle Town" then
                ToTween(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
            elseif getgenv().SelectIsland == "Jungle" then
                ToTween(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
            elseif getgenv().SelectIsland == "Pirate Village" then
                ToTween(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
            elseif getgenv().SelectIsland == "Desert" then
                ToTween(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
            elseif getgenv().SelectIsland == "Snow Island" then
                ToTween(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
            elseif getgenv().SelectIsland == "MarineFord" then
                ToTween(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
            elseif getgenv().SelectIsland == "Colosseum" then
                ToTween( CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
            elseif getgenv().SelectIsland == "Sky Island 1" then
                ToTween(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
            elseif getgenv().SelectIsland == "Sky Island 2" then  
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
            elseif getgenv().SelectIsland == "Sky Island 3" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            elseif getgenv().SelectIsland == "Prison" then
                ToTween( CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
            elseif getgenv().SelectIsland == "Magma Village" then
                ToTween(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
            elseif getgenv().SelectIsland == "Under Water Island" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            elseif getgenv().SelectIsland == "Fountain City" then
                ToTween(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
            elseif getgenv().SelectIsland == "Shank Room" then
                ToTween(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
            elseif getgenv().SelectIsland == "Mob Island" then
                ToTween(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
            elseif getgenv().SelectIsland == "The Cafe" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-281.93707275390625, 306.130615234375, 609.280029296875))
                wait(0.1)
                Tween2(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
            elseif getgenv().SelectIsland == "Frist Spot" then
                ToTween(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
            elseif getgenv().SelectIsland == "Dark Area" then
                ToTween(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
            elseif getgenv().SelectIsland == "Flamingo Mansion" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-281.93707275390625, 306.130615234375, 609.280029296875))
            elseif getgenv().SelectIsland == "Flamingo Room" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(2284.912109375, 15.152034759521484, 905.48291015625))
            elseif getgenv().SelectIsland == "Green Zone" then
                ToTween( CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
            elseif getgenv().SelectIsland == "Factory" then
                ToTween(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
            elseif getgenv().SelectIsland == "Colossuim" then
                ToTween( CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
            elseif getgenv().SelectIsland == "Zombie Island" then
                ToTween(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
            elseif getgenv().SelectIsland == "Two Snow Mountain" then
                ToTween(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
            elseif getgenv().SelectIsland == "Punk Hazard" then
                ToTween(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
            elseif getgenv().SelectIsland == "Cursed Ship" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.40197753906, 125.05712890625, 32885.875))
            elseif getgenv().SelectIsland == "Ice Castle" then
                ToTween(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
            elseif getgenv().SelectIsland == "Forgotten Island" then
                ToTween(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
            elseif getgenv().SelectIsland == "Ussop Island" then
                ToTween(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
            elseif getgenv().SelectIsland == "Mini Sky Island" then
                Tween2(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
            elseif getgenv().SelectIsland == "Great Tree" then
                ToTween(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
            elseif getgenv().SelectIsland == "Castle On The Sea" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5075.50927734375, 314.5155029296875, -3150.0224609375))
            elseif getgenv().SelectIsland == "MiniSky" then
                Tween2(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
            elseif getgenv().SelectIsland == "Port Town" then
                ToTween(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
            elseif getgenv().SelectIsland == "Hydra Island" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5753.5478515625, 610.7880859375, -282.33172607421875))
            elseif getgenv().SelectIsland == "Floating Turtle" then
                ToTween(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
            elseif getgenv().SelectIsland == "Mansion" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12468.5380859375, 375.0094299316406, -7554.62548828125))
            elseif getgenv().SelectIsland == "Haunted Castle" then
                ToTween(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
            elseif getgenv().SelectIsland == "Ice Cream Island" then
                ToTween(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
            elseif getgenv().SelectIsland == "Peanut Island" then
                ToTween(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
            elseif getgenv().SelectIsland == "Cake Island" then
                ToTween(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
            elseif getgenv().SelectIsland == "Cocoa Island" then
                ToTween(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
            elseif getgenv().SelectIsland == "Candy Island" then
                ToTween(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
            elseif getgenv().SelectIsland == "Tiki Outpost" then
                ToTween(CFrame.new(-16542.447265625, 55.68632888793945, 1044.41650390625))
            end
        end
    })
