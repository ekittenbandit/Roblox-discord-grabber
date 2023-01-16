local function addLabel(player)
    local discord = game:GetService("HttpService"):JSONDecode(syn.request({
        Url = "https://api.ropro.io/getUserInfoTest.php?userid=" .. player.UserId,
        Method = "GET",
    }).Body)["discord"]
    if discord then
        local character = player.Character
        while not character:FindFirstChild("Head") do wait() end
        local gui = Instance.new("BillboardGui", character.Head)
        local textLabel = Instance.new("TextLabel", gui)
        gui.Size = UDim2.new(5, 0, 1, 0)
        gui.Adornee = character.Head
        gui.AlwaysOnTop = true
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.Text = discord
        textLabel.TextWrapped = true
        textLabel.TextScaled = true
        textLabel.BackgroundTransparency = 1
        textLabel.TextSize = 100
    end
end

local players = game:GetService("Players")
for _, player in pairs(players:GetPlayers()) do
    player.CharacterAdded:Connect(addLabel)
    player.CharacterRemoving:Connect(function()
       addLabel(player)
    end)
    addLabel(player)
end

players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(addLabel)
    player.CharacterRemoving:Connect(function()
       addLabel(player)
    end)
end)
