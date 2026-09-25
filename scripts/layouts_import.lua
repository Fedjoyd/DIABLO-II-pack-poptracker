
Tracker:AddLayouts("layouts/settings_popup.json")

--Tracker:AddLayouts("layouts/items.json")
Tracker:AddLayouts("layouts/gate_key.json")
Tracker:AddLayouts("layouts/zone_key.json")
Tracker:AddLayouts("layouts/skills.json")

Tracker:AddLayouts("layouts/tabs.json")
Tracker:AddLayouts("layouts/tracker.json")

if (Tracker.ActiveVariantUID == "Map Tracker FB") then
    Tracker:AddLayouts("layouts/broadcast_FULL.json")
elseif (Tracker.ActiveVariantUID == "Map Tracker KB") then
    Tracker:AddLayouts("layouts/broadcast_KEY.json")
elseif (Tracker.ActiveVariantUID == "Map Tracker SB") then
    Tracker:AddLayouts("layouts/broadcast_SKILL.json")
end
