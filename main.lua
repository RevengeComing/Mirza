local MirzaEventFrame = CreateFrame("Frame")

-- MAIL_INBOX_UPDATE
-- MAIL_LOCK_SEND_ITEMS
-- MAIL_SEND_INFO_UPDATE
-- MAIL_SUCCESS
-- MAIL_UNLOCK_SEND_ITEMS
-- MAIL_SEND_SUCCESS

function OnBagUpdateEventHandler()
    for i = 0, 5 do
        bag_num_slots = GetContainerNumSlots(i)
        for j = 1, bag_num_slots do
            local texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(i, j)
            print(texture, itemCount, locked, quality, readable, lootable, itemLink)
        end
    end
end

function OnLootOpenedEventHandler()
    number_of_loots = GetNumLootItems()
    for i = 1, number_of_loots do
        local lootIcon, lootName, lootQuantity, rarity, locked, isQuestItem, questId, isActive = GetLootSlotInfo(i)
        print(lootIcon, lootName, lootQuantity, rarity, locked, isQuestItem, questId, isActive)
    end
end

local event_handlers_functions = {}
event_handlers_functions["BAG_UPDATE"] = OnBagUpdateEventHandler
event_handlers_functions["LOOT_OPENED"] = OnLootOpenedEventHandler

function OnEventHandler(self, event, ...)
    print("kire asb")
    event_handlers_functions[event]()
end

MirzaEventFrame:RegisterEvent("BAG_UPDATE")
MirzaEventFrame:RegisterEvent("LOOT_OPENED")
MirzaEventFrame:SetScript("OnEvent", OnEventHandler)