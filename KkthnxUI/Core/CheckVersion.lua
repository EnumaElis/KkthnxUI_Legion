local K, C, L = select(2, ...):unpack()

local KkthnxUIVersion = CreateFrame("Frame")
local Version = tonumber(GetAddOnMetadata("KkthnxUI", "Version"))
local MyName = UnitName("player") .. "-" .. GetRealmName()
MyName = gsub(MyName, "%s+", "")

function KkthnxUIVersion:Check(event, prefix, message, channel, sender)
	if (event == "CHAT_MSG_ADDON") then
		if (prefix ~= "KkthnxUIVersion") or (sender == MyName) then
			return
		end

		if (tonumber(message) > Version) then -- We recieved a higher version, we're outdated. :(
			K.Print(L_MISC_UI_OUTDATED)
			self:UnregisterEvent("CHAT_MSG_ADDON")
		end
	else
		-- Tell everyone what version we use.
		local Channel

		if IsInRaid() then
			Channel = (not IsInRaid(LE_PARTY_CATEGORY_HOME) and IsInRaid(LE_PARTY_CATEGORY_INSTANCE)) and "INSTANCE_CHAT" or "RAID"
		elseif IsInGroup() then
			Channel = (not IsInGroup(LE_PARTY_CATEGORY_HOME) and IsInGroup(LE_PARTY_CATEGORY_INSTANCE)) and "INSTANCE_CHAT" or "PARTY"
		elseif IsInGuild() then
			Channel = "GUILD"
		end

		if Channel then -- Putting a small delay on the call just to be certain it goes out.
			K.Delay(2, SendAddonMessage, "KkthnxUIVersion", Version, Channel)
		end
	end
end

KkthnxUIVersion:RegisterEvent("PLAYER_ENTERING_WORLD")
KkthnxUIVersion:RegisterEvent("GROUP_ROSTER_UPDATE")
KkthnxUIVersion:RegisterEvent("CHAT_MSG_ADDON")
KkthnxUIVersion:SetScript("OnEvent", KkthnxUIVersion.Check)

RegisterAddonMessagePrefix("KkthnxUIVersion")