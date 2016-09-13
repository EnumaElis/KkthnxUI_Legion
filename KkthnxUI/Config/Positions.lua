local K, C, L, _ = select(2, ...):unpack()

-- IF YOU'RE SAVING FRAME POSITIONS, USE "UIPARENT", NOT UIPARENT
C["Position"] = {
	["Alerts"] = {"TOP", "UIParent", "TOP", 0, -22},
	["AltPowerBar"] = {"TOP", "UIParent", "TOP", 0, -100},
	["Attempt"] = {"TOP", "UIParent", "TOP", -85, -25},
	["BGScore"] = {"TOPLEFT", "UIParent", "TOPLEFT", 0, -4},
	["Bag"] = {"RIGHT", "UIParent", "RIGHT", -140, -20},
	["Bank"] = {"LEFT", "UIParent", "LEFT", 23, 150},
	["BnetPopup"] = {"BOTTOMLEFT", "ChatFrame1", "TOPLEFT", 4, 54},
	["BottomBars"] = {"BOTTOM", "UIParent", "BOTTOM", 0, 5},
	["CaptureBar"] = {"TOP", "UIParent", "TOP", 0, -170},
	["Chat"] = {"BOTTOMLEFT", "UIParent", "BOTTOMLEFT", 3, 5},
	["ExtraButton"] = {"BOTTOMRIGHT", "ActionButton1", "BOTTOMLEFT", -3, 0},
	["GroupLoot"] = {"BOTTOM", "UIParent", "BOTTOM", -238, 700},
	["Loot"] = {"TOPLEFT", "UIParent", "TOPLEFT", 245, -220},
	["Minimap"] = {"TOPRIGHT", "UIParent", "TOPRIGHT", -4, -4},
	["MinimapButtons"] = {"TOPRIGHT", "Minimap", "TOPLEFT", -4, 1},
	["PetHorizontal"] = {"BOTTOMRIGHT", "UIParent", "BOTTOM", -175, 167},
	["PlayerBuffs"] = {"TOPRIGHT", "Minimap", "TOPLEFT", -26, 4},
	["PulseCD"] = {"CENTER", "UIParent", "CENTER", 0, 0},
	["WorldMap"] = {"CENTER", "UIParent", "CENTER", 0, 100},
	["RightBars"] = {"BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT", -5, 330},
	["StanceBar"] = {"BOTTOMRIGHT", "UIParent", "BOTTOM", -202, 167},
	["StatsFrame"] = {"CENTER", "StatFrame", "CENTER", 0, 0},
	["TalkingHead"] = {"TOP", "UIParent", "TOP", 0, -21},
	["Ticket"] = {"TOPLEFT", "UIParent", "TOPLEFT", 0, -1},
	["Tooltip"] = {"BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT", -2, 2},
	["UIError"] = {"TOP", "UIParent", "TOP", 0, -80},
	["Vehicle"] = {"TOP", "Minimap", "BOTTOM", 0, -18},
	["VehicleBar"] = {"BOTTOMRIGHT", "ActionButton1", "BOTTOMLEFT", -3, 0},
	-- UNITFRAME POSITIONS
	UnitFrames = {
		["Arena"] = {"BOTTOMRIGHT", "UIParent", "RIGHT", -60, -70},
		["Boss"] = {"RIGHT", "RightActionBarAnchor", "LEFT", 20, -70},
		["Player"] = {"BOTTOMRIGHT", "ActionBarAnchor", "TOPLEFT", -9, 175},
		["PlayerCastBar"] = {"BOTTOM", "ActionBarAnchor", "TOP", 0, 175},
		["Target"] = {"BOTTOMLEFT", "ActionBarAnchor", "TOPRIGHT", 9, 175},
		["TargetCastBar"] = {"BOTTOM", "CastingBarFrame", "TOP", 0, 21},
	},
	-- FILGER POSITIONS
	Filger = {
		["Cooldown"] = {"BOTTOMRIGHT", "PlayerFrame", "TOPRIGHT", 63, 17},
		["PlayerBuffIcon"] = {"BOTTOMRIGHT", "PlayerFrame", "TOPRIGHT", 2, 173},
		["PlayerProcIcon"] = {"BOTTOMLEFT", "TargetFrame", "TOPLEFT", -2, 173},
		["PvECC"] = {"TOPLEFT", "PlayerFrame", "BOTTOMLEFT", -2, -44},
		["PvEDebuff"] = {"BOTTOMRIGHT", "PlayerFrame", "TOPRIGHT", 2, 253},
		["SpecialProcIcon"] = {"BOTTOMRIGHT", "PlayerFrame", "TOPRIGHT", 2, 213},
		["TargetBar"] = {"BOTTOMLEFT", "TargetFrame", "BOTTOMRIGHT", 9, -41},
		["TargetBuffIcon"] = {"BOTTOMLEFT", "TargetFrame", "TOPLEFT", -2, 253},
		["TargetDebuffIcon"] = {"BOTTOMLEFT", "TargetFrame", "TOPLEFT", -2, 213},
	},
}