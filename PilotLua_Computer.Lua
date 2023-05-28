local Apps
Beep(1)
local Screen = GetPartFromPort(1,"TouchScreen") or GetPartFromPort(1,"Screen")
Screen:ClearElements()
BackgroundImageID = 10980958764
BackgroundImageMode = Enum.ScaleType.Tile
BackgroundImageTiling = 500

local BackgroundText = Screen:CreateElement("TextLabel",{
    Size = UDim2.fromScale(1,1);
    ZIndex = 1;
    TextScaled = true;
    Text = "Loading..";
    TextColor3 = Color3.new(1,1,1);
    BackgroundTransparency = 1;
})

local BackgroundObject = Screen:CreateElement("ImageLabel",{
    Size = UDim2.fromScale(1,1);
    Image = "rbxassetid://3899340539";
    ScaleType = Enum.ScaleType.Tile;
    TileSize = UDim2.fromOffset(BackgroundImageTiling, BackgroundImageTiling);
    ZIndex = 0;
    BackgroundTransparency = 1;
    ImageTransparency = 1;
})
task.wait(2.5)
BackgroundText.TextColor3 = Color3.new(1,1,1)

BackgroundText.Text = "Successfully loaded, one moment while we gather all the required Assets and data."

task.wait(5)

for i = 1,1000 do
    BackgroundObject.ImageTransparency -= 1/1000
end

local ChatLogUI

function ChatLogs()
    ChatLogUI = Screen:CreateElement()
end

function NoChatLogs()
    
end




Apps = {
    ChatLogs = {
        Name = "Chat Logger",
        Icon = 6655732457,
        OnRun = ChatLogs,
        LogOut = NoChatLogs,
        IsRunning = false
    }
}

for i = 1, #Apps do
    local Button = Screen:CreateElement("ImageButton",{
        BackgroundTransparency = 1,
        Image = "rbxassetid://"..Apps[i].Icon,
        Position = UDim2.fromScale(0.05*(i-1),0),
        Size = UDim2.fromScale(0.05,0.05)
    })
    local Text = Screen:CreateElement("TextLabel",{
        BackgroundTransparency = 1,
        Text = Apps[i].Name,
        Position = Button.Size + UDim2.fromScale(0,0.075),
        Size = UDim2.fromScale(0.05,0.025)
    })
end