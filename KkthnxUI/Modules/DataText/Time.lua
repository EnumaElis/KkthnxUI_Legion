local K, C, L = select(2, ...):unpack()

local GetGameTime = GetGameTime
local EuropeString = "%s%02d|r:%s%02d|r"
local UKString = "%s%d|r:%s%02d|r %s%s|r"
local CurrentHour
local CurrentMin
local tslu = 1

local RaidFormat1 = "%s - %s (%d/%d)" -- Siege of Orgrimmar - Mythic (10/14)
local RaidFormat2 = "%s - %s" -- Siege of Orgrimmar - Mythic
local DayHourMinute = "%dd, %dh, %dm"
local HourMinute = "%dh, %dm"
local MinuteSecond = "%dm, %ds"
local StatColor = K.RGBToHex(1, 1, 1)

local TimeDataText = CreateFrame("Frame")
TimeDataText:RegisterEvent("PLAYER_ENTERING_WORLD")
TimeDataText:SetFrameStrata("BACKGROUND")
TimeDataText:SetFrameLevel(3)
TimeDataText:EnableMouse(true)

local TimeText = Minimap:CreateFontString(nil, "OVERLAY")
TimeText:SetFont(C.Media.Font, C.Media.Font_Size, C.Media.Font_Style)
TimeText:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, 2)

local AMPM = {
	TIMEMANAGER_PM,
	TIMEMANAGER_AM,
}

local GetResetTime = function(seconds)
	local Days, Hours, Minutes, Seconds = ChatFrame_TimeBreakDown(floor(seconds))

	if (Days > 0) then
		return format(DayHourMinute, Days, Hours, Minutes) -- 7d, 2h, 5m
	elseif (Hours > 0) then
		return format(HourMinute, Hours, Minutes) -- 12h, 32m
	else
		return format(MinuteSecond, Minutes, Seconds) -- 5m, 42s
	end
end

local GetFormattedTime = function()
	local Use24Hour = C.DataText.Time24Hr
	local UseLocalTime = C.DataText.LocalTime

	local Hour, Minute, AmPm

	if UseLocalTime then -- Local Time
		local Hour24 = tonumber(date("%H"))
		Hour = tonumber(date("%I"))
		Minute = tonumber(date("%M"))

		if Use24Hour then
			return Hour24, Minute, -1
		else
			if (Hour24 >= 12) then
				AmPm = 1
			else
				AmPm = 2
			end

			return Hour, Minute, AmPm
		end
	else -- Server Time
		Hour, Minute = GetGameTime()

		if Use24Hour then
			return Hour, Minute, -1
		else
			if (Hour >= 12) then
				if (Hour > 12) then
					Hour = Hour - 12
				end

				AmPm = 1
			else
				if (Hour == 0) then
					Hour = 12
				end

				AmPm = 2
			end

			return Hour, Minute, AmPm
		end
	end
end

local Update = function(self, t)
	tslu = tslu - t

	if (tslu > 0) then
		return
	end

	local Hour, Minute, AmPm = GetFormattedTime()

	if (CurrentHour == Hour and CurrentMin == Minute) then
		return
	end

	if (AmPm == -1) then
		TimeText:SetFormattedText(EuropeString, StatColor, Hour, StatColor, Minute)
	else
		TimeText:SetFormattedText(UKString, StatColor, Hour, StatColor, Minute, StatColor, AMPM[AmPm])
	end

	CurrentHour = Hour
	CurrentMin = Minute

	tslu = 1

	self:SetAllPoints(TimeText)
end

local OnEnter = function(self)
	local anchor, panel, xoff, yoff = "ANCHOR_BOTTOMLEFT", self:GetParent(), 0, 5
	GameTooltip:SetOwner(self, anchor, xoff, yoff)
	GameTooltip:ClearLines()

	local SavedInstances = GetNumSavedInstances()
	local SavedWorldBosses = GetNumSavedWorldBosses()

	if (SavedWorldBosses > 0) then
		GameTooltip:AddLine("World Bosses")

		for i = 1, SavedWorldBosses do
			local Name, _, Reset = GetSavedWorldBossInfo(i)

			if (Name and Reset) then
				local ResetTime = GetResetTime(Reset)

				GameTooltip:AddDoubleLine(Name, ResetTime, 1, 1, 1, 1, 1, 1)
			end
		end
	end

	if ((SavedWorldBosses > 0) and (SavedInstances > 0)) then
		-- Spacing
		GameTooltip:AddLine(" ")
	end

	if (SavedInstances > 0) then
		GameTooltip:AddLine("Saved Raids")

		for i = 1, SavedInstances do
			local Name, _, Reset, _, Locked, Extended, _, IsRaid, _, Difficulty, MaxBosses, DefeatedBosses = GetSavedInstanceInfo(i)

			if (IsRaid and Name and (Locked or Extended)) then
				local ResetTime = GetResetTime(Reset)

				if (MaxBosses and MaxBosses > 0) and (DefeatedBosses and DefeatedBosses > 0) then
					GameTooltip:AddDoubleLine(format(RaidFormat1, Name, Difficulty, DefeatedBosses, MaxBosses), ResetTime, 1, 1, 1, 1, 1, 1)
				else
					GameTooltip:AddDoubleLine(format(RaidFormat2, Name, Difficulty), ResetTime, 1, 1, 1, 1, 1, 1)
				end
			end
		end
	end

	GameTooltip:Show()
end

local OnLeave = function()
	GameTooltip:Hide()
end

function TimeDataText:Enable()
	self:SetScript("OnUpdate", Update)
	self:SetScript("OnMouseUp", GameTimeFrame_OnClick)
	self:SetScript("OnEnter", OnEnter)
	self:SetScript("OnLeave", OnLeave)
	Update(self, 1)
	RequestRaidInfo()
end

function TimeDataText:Disable()
	self.Text:SetText("")
	self:SetScript("OnUpdate", nil)
	self:SetScript("OnEnter", nil)
	self:SetScript("OnLeave", nil)
end

if C.DataText.Time then
	TimeDataText:Enable()
else
	TimeDataText:Disable()
end