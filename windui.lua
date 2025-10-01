local Library = {}
Library.__index = Library

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
WindUI:SetTheme("Dark")
WindUI.TransparencyValue = 0.2

local Window = nil

function Library:Setup()
    Window = WindUI:CreateWindow({
        Title = "Spawner UI",
        Author = "By Nexus Developed",
        Icon = "magic",
        Size = UDim2.fromOffset(580, 490),
        Folder = "NexusHub",
        Background = "rbxassetid://90045700186596"
    })
    return Window
end

function Library:CreateTab(Name, Icon)
    local win = Window or self:Setup()
    if not win then
        error("[Library]: Failed to find Window")
        return
    end

    local Tab = win:Tab({
        Title = Name,
        Icon = Icon,
        Locked = false,
    })

    return Tab
end

function Library:CreateSection(Tab, Title, Size)
    local Section = Tab:Section({
        Title = Title,
        TextXAlignment = "Left",
        TextSize = Size or 17,
    })

    return Section
end

function Library:CreateToggle(Tab, Table)
    return Tab:Toggle(Table)
end

function Library:CreateButton(Tab, Table)
    return Tab:Button(Table)
end

function Library:CreateSlider(Tab, Table)
    return Tab:Slider(Table)
end

function Library:CreateDropdown(Tab, Table)
    return Tab:Dropdown(Table)
end

function Library:CreateInput(Tab, Table)
    return Tab:Input(Table)
end

function Library:SetupAboutUs(AboutUs)
    local win = Window or self:Setup()
    if not win then
        error("[Library]: Failed to find Window")
        return
    end

    AboutUs:Paragraph({
        Title = "Discord Invites",
        Icon = "discord",
        Desc = "Join our communities for updates and support!",
    })

    AboutUs:Button({
        Title = "Discord Link (Click to Copy)",
        Icon = "link",
        Callback = function()
            setclipboard("https://discord.gg/vTTehBVWg6")
            print("Discord link copied!")
        end,
    })
end

return Library
