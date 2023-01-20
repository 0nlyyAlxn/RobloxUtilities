# WebHookCaller By 0nlyyAlxn
This documentation is to know the use of the WebHookCaller system.

## Booting the WebHookCaller
```lua
local WebHookCaller = loadstring(game:HttpGet(('https://raw.githubusercontent.com/0nlyyAlxn/RobloxUtilities/main/Modules/Network/WebHookCaller/WebHookModuleCaller.lua')))()
```

## Booting the WebHook
```lua
WebHookModuleCaller:SetWebHook("YourWebHookHere")
```

## SendMessage Example
```lua

WebHookModuleCaller:SendMessage({
	Message = "TEST MESSAGE"
})

--[[
Message = <string> - The message it will contain when sending the webhook.
]]
```

## SendEmbed Example
```lua

local Fields = {
	{
		["name"] = "InLine Field",
		["value"] = "Some text here",
		["inline"] = true
	},
	{
		["name"] = "Not InLine Field",
		["value"] = "Some text here",
		["inline"] = false
	}
}

local footer = {
	["text"] = "TEST FOOTER",
}

WebHookModuleCaller:SendEmbed({

	Title = "TEST EMBED",
	Message = "TEST MESSAGE",

	Image = nil, -- (not required)
	Color = tonumber(0xFFFAFA),

	footer = footer,
	fields = Fields
})

--[[

Title = <string> - The Title it will contain when sending the webhook.
Message = <string> - The message it will contain when sending the webhook.

Image = <string> - URL of the image you want to display in the corner of the embed (not required).
Color = <string> - The color you want the embed to contain (Ex: tonumber(0xFFFAFA)) (not required).

footer = <table> - The footer that you want the embed to contain(not required).
fields = <table> - The fields you want the embed to contain(not required).
]]
```
