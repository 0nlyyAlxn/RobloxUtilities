local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local WebHookModuleCaller = {}
local WebHook = nil

local SendWebHook = function(WebHookData)
	if WebHook then
		if WebHookData then
			
			local s, e = pcall(function()
				
				if game:GetService("RunService"):IsStudio() then
					return HttpService:PostAsync(WebHook, HttpService:JSONEncode(WebHookData))
				end
				
				local Headers = {
					["content-type"] = "application/json"
				}

				local req = http_request or request or HttpPost or syn and syn.request
				req({Url = WebHook, Body = game:GetService("HttpService"):JSONEncode(WebHookData), Method = "POST", Headers = Headers})
			end)
			
			if not s then
				warn(e)
			end	
		else
			return warn("ERROR: Invalid WebHookData or WebHookData is nil")
		end
	else
		warn("ERROR: Invalid WebHook or Webhook is nil")
	end
end

function WebHookModuleCaller:SetWebHook(Web_Hook)
	WebHook = Web_Hook
end

function WebHookModuleCaller:SendMessage(MessageDataTable)
	if WebHook then
		if MessageDataTable.Message then
			local WebHookData = {
				["content"] = MessageDataTable.Message
			}
			SendWebHook(WebHookData)
		else
			warn("ERROR: Invalid Message Data or Message Data is nil")
		end
	else
		warn("ERROR: Invalid WebHook or Webhook is nil")
	end
end

function WebHookModuleCaller:SendEmbed(EmbedDataTable)
	if WebHook then
		if EmbedDataTable.Title and EmbedDataTable.Message then
			
			if not EmbedDataTable.Color or EmbedDataTable.Color == nil then
				EmbedDataTable.Color = tonumber(0xFFFAFA)
			end
			
			if not EmbedDataTable.Image or EmbedDataTable.Image == nil then
				EmbedDataTable.Image = ""
			end
			
			if not EmbedDataTable.Thumbnail or EmbedDataTable.Thumbnail == nil then
				EmbedDataTable.Thumbnail = ""
			end

			if not EmbedDataTable.Footer or EmbedDataTable.Footer == nil then
				EmbedDataTable.Footer = {}
			end
			
			if not EmbedDataTable.Fields or EmbedDataTable.Fields == nil then
				EmbedDataTable.Fields = {}
			end

			local WebHookData = {
				["embeds"] = {{
					
					["author"] = {
						["name"] = tostring(EmbedDataTable.Title),
						["icon_url"] = EmbedDataTable.Image,
					},
					
					["description"] = tostring(EmbedDataTable.Message),
					["color"] = EmbedDataTable.Color,

					--["image"] = {
					   -- ["url"] = EmbedDataTable.Image,
					--},
					
					--["thumbnail"] = {
					   -- ["url"] = EmbedDataTable.Thumbnail,
					--},
					
					["footer"] = EmbedDataTable.Footer,

					["fields"] = EmbedDataTable.Fields
				}},
			}
			
			SendWebHook(WebHookData)
		else
			warn("ERROR: Invalid Message Data or Message Data is nil")
		end
	else
		warn("ERROR: Invalid WebHook or Webhook is nil")
	end
end

return WebHookModuleCaller
