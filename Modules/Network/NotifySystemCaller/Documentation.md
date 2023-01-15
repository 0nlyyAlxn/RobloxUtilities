# NotifySystemCaller By 0nlyyAlxn
This documentation is to know the use of the notification system.

## Booting the NotifySystemCaller
```lua
local NotifySystemCaller = loadstring(game:HttpGet(('https://raw.githubusercontent.com/0nlyyAlxn/RobloxUtilities/main/Modules/Network/NotifySystemCaller/NotifySystemModule.lua')))()
```

## Notify Example
```lua

local Notification = NotifySystemCaller:Notify({
	Title = "TEST NOTIFICATION",
	Description = "This is a Test Notification!"

}, {
	OutlineColor = Color3.fromRGB(0, 0, 255),
	Time = 5, Type = "default", 

}, {
	Image = nil, ImageColor  = nil,
	Callback = callback or function() end
})

--[[

Title = <string> - The title of the notification.
Description = <string> - The description of the notification.

OutlineColor = <Color3> - The color of the notification UI.
Time = <number> - The duration of the notification.
Type = <string> - The type of the notification.

Image = <string> - URL to the image you want displayed on the window.
Callback = <function> - Function to execute when pressed the check button (returns true or false).
]]
```
