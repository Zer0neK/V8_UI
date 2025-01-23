local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Anscripterato/scriptui/refs/heads/main/main.lua"))()

local HttpService = game:GetService("HttpService")

local folderPath = "WindUI"
makefolder(folderPath)

local function SaveFile(fileName, data)
    local filePath = folderPath .. "/" .. fileName .. ".lua"
    local jsonData = HttpService:JSONEncode(data)
    writefile(filePath, jsonData)
end

local function LoadFile(fileName)
    local filePath = folderPath .. "/" .. fileName .. ".lua"
    if isfile(filePath) then
        local jsonData = readfile(filePath)
        return HttpService:JSONDecode(jsonData)
    end
end

local function ListFiles()
    local files = {}
    for _, file in ipairs(listfiles(folderPath)) do
        local fileName = file:match("([^/]+)%.lua$")
        if fileName then
            table.insert(files, fileName)
        end
    end
    return files
end

local themeValues = {}
for name, _ in pairs(WindUI:GetThemes()) do
    table.insert(themeValues, name)
end


local Window = WindUI:CreateWindow({
    Title = "剑客V8", 
    Icon = "rbxassetid://95284483872602", --可以是rbx
    Author = "ato", 
    Folder = "安脚本ato制作", --保存文件夹
    Size = UDim2.fromOffset(290, 340), 
    KeySystem = { 
        Key = "安脚本牛逼", 
        Note = "获得卡密请去b站关注作者，然后加q群即可", 
        URL = "安脚本Q群号:1025412071", 
        SaveKey = true,
    }, 
    Transparent = true,-- 透明度
    Theme = "Dark",
    SideBarWidth = 160, --左边滑动的宽度
    HasOutline = true, --这是什么
})

--打开隐藏按钮
Window:EditOpenButton({
    Title = "打开",
    Icon = "image-upscale",  
    CornerRadius = UDim.new(0,10),
    StrokeThickness = 3,
    Color = ColorSequence.new(
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    )
})

--标签
local MainTab = Window:Tab({
    Title = "公告",
    Icon = "notebook-tabs",
})
--锁定
--Locked真假值

--锁定和解锁
--类型:Lock()
--类型:Unlock()

--销毁ui
--Window:Close():Destroy()

--Desc通用注释

--什么意思
--Window:SelectTab(1)

--消息提示，用于输入，下滑等等
--[[WindUI:Notify({
            Title = "输入消息",
            Content = "消息: " .. 返回值,
            Duration = 5,
        })
--]]        

--功能分界线
--local Divider = Window:Divider()

--部分
MainTab:Section({ 
    Title = "部分",
    TextSize = 25,
})

--短形式
MainTab:Section({ Title = "短部分" })

--段落，可只有个标题
local Paragraph = MainTab:Paragraph({
    Title = "标题",
    Desc = "文本",
    Image = "frown",
    ImageSize = 20,
})

--加图案需在第二位
local Paragraph5 = MainTab:Paragraph({
    Title = "段落与按钮",
    Buttons = {
        {
            Title = "按钮",
            Callback = function() print("hi") end
        },
    }
})

--更新段落
--Paragraph1:SetTitle("新标题!")
--Paragraph1:SetDesc("新文本")

--展示代码，像git的view
MainTab:Code({
    Title = "展示",
    Code = [[--放啥都行，自带lua颜色
local "hi" if
]],
})

--问答
local Dialog = Window:Dialog({
    Title = "标题",
    Content = "说明",
    Buttons = {
        {
            Title = "确认",
            Callback = function()
                print("confirm")
            end
        },
        {
            Title = "关闭",
            Callback = function()
                print("cancel")
            end
        },
        {
            Title = "牛逼",
            Callback = function()
                print("idk")
            end
        }
    }
})

--按钮
local Button = MainTab:Button({
    Title = "按钮",
    Desc = "注释",
    Callback = function()
        Dialog:Open()
    end,
})

_G.qqq = true

function qqq()
	while _G.qqq == true do
	wait()
	
	end
end

local Button = MainTab:Toggle({
    Title = "勾选",
    Value = false,
    Callback = function(state)
        _G.qqq = state
            qqq()
    end,
})

--拖动条
local Slider = MainTab:Slider({
    Title = "拖动",
    Step = 1,
    Value = {
        Min = 20,
        Max = 120,
        Default = 70,
    },
    Callback = function(value)
        game.Workspace.Camera.FieldOfView = value--这是视角
    end
})

--快捷键，电脑或虚拟键盘用
local KeybindClicked = false
local Keybind = MainTab:Keybind({
    Title = "快捷",
    Desc = "注释",
    Value = "LeftShift",--左边shift
    CanChange = true,
    Callback = function(k)
        if not KeybindClicked then
            Window:Close()
        else
            Window:Open()
        end
        KeybindClicked = not KeybindClicked
    end
})
local Keybind = MainTab:Keybind({
    Title = "键盘快捷",
    Value = "F",
    CanChange = true,
    Callback = function(k)
        print(k)
    end
})

--输入框
local Input = MainTab:Input({
    Title = "输入框",
    Value = "",
    PlaceholderText = "请输入",
    ClearTextOnFocus = false,
    Callback = function(Text)
    
    end
})

--下滑
local Dropdown = MainTab:Dropdown({
    Title = "下滑",
    Multi = false,
    Value = "",
    AllowNone = true,
    Values = {},
    Callback = function(Tab)
    
    end
})

MainTab:Button({
    Title = "刷新下滑列表",
    Callback = function()
        local someItems = {}
        
        for i = 1, 2 do
            table.insert(someItems, "我操你妈" .. i)
        end

        Dropdown:Refresh(someItems)
    end
})

--多选下滑
local Dropdown = MainTab:Dropdown({
    Title = "多选",
    Multi = true,
    Value = {
        "Tab 1", "Tab 5"
    },
    Values = {
        "Tab 1", "Tab 2", "Tab 3", "Tab 4", "Tab 5", 
    },
    Callback = function(Tab)
    end
})

--颜色选择
local Colorpicker = MainTab:Colorpicker({
    Title = "颜色选择",
    Default = Color3.fromRGB(255, 129, 0),
    Callback = function(color)
    end
})

--颜色选择提示
--[[WindUI:Notify({
            Title = "Colorpicker Callback",
            Content = "Color: \nR: " .. math.floor(color.R * 255) .. "\nG: " .. math.floor(color.G * 255) .. "\nB: " .. math.floor(color.B * 255),
            Duration = 6,
        })
]]

local Button = MainTab:Button({
    Title = "消息按钮",
    Callback = function()
        WindUI:Notify({
            Title = "标题",
            Content = "注释",
            Icon = "eye",
            Duration = 5,--持续时间
        })
    end,
})

WindUI:AddTheme({
    Name = "Halloween",
    
    Accent = "#331400",
    Outline = "#400000",
    
    Text = "#EAEAEA",
    PlaceholderText = "#AAAAAA"
})



---- 2. Use Theme

WindUI:SetTheme("Dark")

---- 3. Load Themes

local themeDropdown = MainTab:Dropdown({
    Title = "选择ui风格",
    Multi = false,
    AllowNone = false,
    Value = nil,
    Values = themeValues,
    Callback = function(theme)
        WindUI:SetTheme(theme)
    end
})
themeDropdown:Select(WindUI:GetCurrentTheme())

local ToggleTransparency = MainTab:Toggle({
    Title = "设置ui透明",
    Callback = function(e)
        Window:ToggleTransparency(e)
    end,
    Value = WindUI:GetTransparency()
})

local fileNameInput = ""
MainTab:Input({
    Title = "输入文件名",
    PlaceholderText = "请输入",
    Callback = function(text)
        fileNameInput = text
    end
})

local cnm = "你好"
MainTab:Button({
    Title = "保存文件",
    Callback = function()
        if fileNameInput ~= "" then
            SaveFile(fileNameInput, { cnm })
        end
    end
})

local filesDropdown
local files = ListFiles()

filesDropdown = MainTab:Dropdown({
    Title = "选择文件",
    Multi = false,
    AllowNone = true,
    Values = files,
    Callback = function(selectedFile)
        fileNameInput = selectedFile
    end
})

MainTab:Button({
    Title = "查看文件信息",
    Callback = function()
        if fileNameInput ~= "" then
            local data = LoadFile(fileNameInput)
            if data then
                WindUI:Notify({
                    Title = "查看文件",
                    Content = "文件信息: " .. HttpService:JSONEncode(data),
                    Duration = 5,
                })
                if data.Transparent then 
                    Window:ToggleTransparency(data.Transparent)
                    ToggleTransparency:SetValue(data.Transparent)
                end
                if data.Theme then WindUI:SetTheme(data.Theme) end
            end
        end
    end
})

MainTab:Button({
    Title = "更新文件",
    Callback = function()
        if fileNameInput ~= "" then
            SaveFile(fileNameInput, { Transparent = WindUI:GetTransparency(), Theme = WindUI:GetCurrentTheme() })
        end
    end
})

MainTab:Button({
    Title = "刷新文件列表",
    Callback = function()
        filesDropdown:Refresh(ListFiles())
    end
})

local currentThemeName = WindUI:GetCurrentTheme()
local themes = WindUI:GetThemes()

local ThemeAccent = themes[currentThemeName].Accent
local ThemeOutline = themes[currentThemeName].Outline
local ThemeText = themes[currentThemeName].Text
local ThemePlaceholderText = themes[currentThemeName].PlaceholderText

function updateTheme()
    WindUI:AddTheme({
        Name = currentThemeName,
        Accent = ThemeAccent,
        Outline = ThemeOutline,
        Text = ThemeText,
        PlaceholderText = ThemePlaceholderText
    })
    WindUI:SetTheme(currentThemeName)
end

local CreateInput = MainTab:Input({
    Title = "ui风格名称",
    Value = currentThemeName,
    Callback = function(name)
        currentThemeName = name
    end
})

MainTab:Colorpicker({
    Title = "背景颜色",
    Default = Color3.fromHex(ThemeAccent),
    Callback = function(color)
        ThemeAccent = color:ToHex()
    end
})

MainTab:Colorpicker({
    Title = "边框颜色",
    Default = Color3.fromHex(ThemeOutline),
    Callback = function(color)
        ThemeOutline = color:ToHex()
    end
})

MainTab:Colorpicker({
    Title = "文字颜色",
    Default = Color3.fromHex(ThemeText),
    Callback = function(color)
        ThemeText = color:ToHex()
    end
})

MainTab:Colorpicker({
    Title = "输入文本颜色",
    Default = Color3.fromHex(ThemePlaceholderText),
    Callback = function(color)
        ThemePlaceholderText = color:ToHex()
    end
})

MainTab:Button({
    Title = "更新ui",
    Callback = function()
        updateTheme()
    end
})
