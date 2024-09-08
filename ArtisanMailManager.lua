-- ArtisanMailManager
-- Manages emails from the Artisan's Consortium

local addonName, addon = ...
addon.frame = CreateFrame("Frame")

-- Function to check if a mail is from Artisan's Consortium
local function isArtisanMail(sender)
    return sender and sender:match("Artisan's Consortium")
end

-- Function to process a single mail
local function processMail(index)
    local _, _, sender, subject, money, CODAmount, _, hasItem = GetInboxHeaderInfo(index)
    if isArtisanMail(sender) then
        if money > 0 or hasItem then
            -- Loot the mail
            TakeInboxMoney(index)
            for i = 1, ATTACHMENTS_MAX_RECEIVE do
                TakeInboxItem(index, i)
            end
            print("Looted mail from Artisan's Consortium")
        else
            -- Delete empty mail
            DeleteInboxItem(index)
            print("Deleted empty mail from Artisan's Consortium")
        end
        return true
    end
    return false
end

-- Function to process all mails
local function processAllMails()
    local numItems = GetInboxNumItems()
    local artisanMailCount = 0
    for i = numItems, 1, -1 do
        local _, _, sender = GetInboxHeaderInfo(i)
        if isArtisanMail(sender) then
            artisanMailCount = artisanMailCount + 1
        end
    end

    if artisanMailCount > 0 then
        local dialog = StaticPopup_Show("ARTISAN_MAIL_MANAGER_CONFIRM", artisanMailCount)
        if dialog then
            dialog.data = artisanMailCount
        end
    else
        print("No mails from Artisan's Consortium found.")
    end
end

-- Function to process mails one by one
local function processMailsOneByOne()
    if not MailFrame:IsVisible() then
        print("Mail frame is closed. Stopping mail processing.")
        return
    end

    local numItems = GetInboxNumItems()
    for i = numItems, 1, -1 do
        if processMail(i) then
            -- Wait a bit to avoid overwhelming the server
            C_Timer.After(0.5, function()
                processMailsOneByOne()
            end)
            return
        end
    end

    print("Finished processing Artisan's Consortium mails.")
end

-- Create a confirmation dialog
StaticPopupDialogs["ARTISAN_MAIL_MANAGER_CONFIRM"] = {
    text = "Are you sure you want to process %d mail(s) from Artisan's Consortium?",
    button1 = "Yes",
    button2 = "No",
    OnAccept = function(self)
        processMailsOneByOne()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
}

-- Create a button for the user interface
local button = CreateFrame("Button", "ArtisanMailManagerButton", MailFrame, "UIPanelButtonTemplate")
button:SetSize(140, 25)  -- Increased width and height
button:SetPoint("TOPRIGHT", -15, -40)  -- Adjusted position
button:SetText("Process Artisan Mail")
button:SetScript("OnClick", processAllMails)

-- Add padding to the button text
button:GetFontString():SetPoint("LEFT", 10, 0)
button:GetFontString():SetPoint("RIGHT", -10, 0)

-- Function to update button state
local function updateButtonState()
    local numItems = GetInboxNumItems()
    button:SetEnabled(numItems > 0)
end

-- Register events
addon.frame:RegisterEvent("MAIL_SHOW")
addon.frame:RegisterEvent("MAIL_CLOSED")
addon.frame:RegisterEvent("MAIL_INBOX_UPDATE")
addon.frame:SetScript("OnEvent", function(self, event)
    if event == "MAIL_SHOW" then
        button:Show()
        updateButtonState()
    elseif event == "MAIL_CLOSED" then
        StaticPopup_Hide("ARTISAN_MAIL_MANAGER_CONFIRM")
        print("Mail frame closed. Stopping mail processing.")
    elseif event == "MAIL_INBOX_UPDATE" then
        updateButtonState()
    end
end)

-- Slash command to process mails
SLASH_ARTISANMAILMANAGER1 = "/amm"
SlashCmdList["ARTISANMAILMANAGER"] = processAllMails

print("ArtisanMailManager loaded. Use /amm to process mails or click the button in the mail frame.")
