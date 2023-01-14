local players = game:GetService("Players"):GetPlayers()
local found = false


for _, player in pairs(players) do
    local response = syn.request({
        Url = "https://api.ropro.io/getUserInfoTest.php?userid=" .. player.UserId,
        Method = "GET",
    })
    local json = response.Body
    local decodedJson = game:GetService("HttpService"):JSONDecode(json)
    local discord = decodedJson["discord"]

    if discord ~= nil and discord ~= "" then
        found = true
        print(player.Name .. "'s Discord: " .. discord)
    end
end

if not found then
    print("No discords found.")
end



