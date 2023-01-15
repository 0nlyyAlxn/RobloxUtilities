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

			if not EmbedDataTable.footer or EmbedDataTable.footer == nil then
				EmbedDataTable.footer = {}
			end
			
			if not EmbedDataTable.fields or EmbedDataTable.fields == nil then
				EmbedDataTable.fields = {}
			end

			local WebHookData = {
				["embeds"] = {{
					
					["author"] = {
						["name"] = tostring(EmbedDataTable.Title),
						["icon_url"] = EmbedDataTable.Image,
					},
					
					["description"] = tostring(EmbedDataTable.Message),
					["color"] = EmbedDataTable.Color,

					["thumbnail"] = {
						["url"] = EmbedDataTable.Image,
					},
					
					["footer"] = EmbedDataTable. footer,

					["fields"] = EmbedDataTable.fields
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