function ZO_Stats:AddStatRow(statType1, statType2)
    --use my controll instead of the default one
    local row = self:CreateControlFromVirtual("StatsRow", "SCI_StatsRow")
    self.statEntries[statType1] = row:GetNamedChild("Stat1")
    self:SetUpStat(self.statEntries[statType1], statType1)
    self.statEntries[statType2] = row:GetNamedChild("Stat2")
    self:SetUpStat(self.statEntries[statType2], statType2)
end

 local function GetValue(self)
    local statType = self.value.statType
    local value = GetPlayerStat(self.value.statType)
    
    return value
end

local function GetDisplayValue(self)
    local value = self:GetValue()
    local statType = self.value.statType

    if(statType == STAT_CRITICAL_STRIKE or statType == STAT_SPELL_CRITICAL) then
        return zo_strformat(SI_STAT_PERCENTAGE_VALUE, zo_round(value / 10))
    else
        return value
    end
end

local function UpdateStatValue(self)
    if not self:IsHidden() then
        local value = self:GetValue()
        local displayValue = self:GetDisplayValue()
        local softCap = GetStatSoftCap(self.value.statType)
        local difference = GetPlayerStat(self.value.statType,
                STAT_BONUS_OPTION_APPLY_BONUS,
                STAT_SOFT_CAP_OPTION_DONT_APPLY_SOFT_CAP) - value
                
        if self.pendingBonusAmount > 0 then
            self.pendingBonus:SetHidden(false)
            self.pendingBonus:SetText(zo_strformat(SI_STAT_PENDING_BONUS_FORMAT, self.pendingBonusAmount))
        else
            self.pendingBonus:SetHidden(true)           
        end

        self.value:SetText(displayValue)
        
        if softCap then
            self.ratio:SetHidden(false)
            self.softcap:SetText(softCap)
            self.softcap:SetColor(STAT_DIMINISHING_RETURNS_COLOR:UnpackRGBA())
            if difference > 0 then
                self.malus:SetText("+".. difference)
                self.malus:SetColor(1,0.1,0.1,1)
            else
                self.malus:SetText("")
            end
        else
            self.ratio:SetHidden(true)
        end
        
        if(softCap == nil or value <= softCap) then
            self.name:SetColor(ZO_NORMAL_TEXT:UnpackRGBA())
            self.value:SetColor(ZO_SELECTED_TEXT:UnpackRGBA())
            self.diminishingReturns:SetHidden(true)
        else
            self.name:SetColor(STAT_DIMINISHING_RETURNS_COLOR:UnpackRGBA())
            self.value:SetColor(STAT_DIMINISHING_RETURNS_COLOR:UnpackRGBA())
            self.diminishingReturns:SetHidden(false)
        end            
    end
end

function ZO_Stats:SetUpStat(statEntry, statType)
    statEntry.name:SetText(GetString("SI_DERIVEDSTATS", statType))
    statEntry.value.statType = statType
    statEntry.pendingBonusAmount = 0

    statEntry.UpdateStatValue = UpdateStatValue
    statEntry.GetDisplayValue = GetDisplayValue
    statEntry.GetValue = GetValue

    statEntry:UpdateStatValue()
    statEntry:RegisterForEvent(EVENT_STATS_UPDATED, function(_, unitTag) if unitTag == "player" then statEntry:UpdateStatValue() end end)
    statEntry:SetHandler("OnEffectivelyShown", function() statEntry:UpdateStatValue() end)
end