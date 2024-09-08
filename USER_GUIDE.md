# Artisan Mail Manager - User Guide

## Introduction
Artisan Mail Manager is an addon for World of Warcraft that helps you manage emails from the Artisan's Consortium. It can automatically loot items and gold from these emails and delete empty ones, saving you time and effort.

## Installation
1. Download the Artisan Mail Manager addon files
2. Locate your World of Warcraft addon folder:
   - Usually found at: `World of Warcraft\_retail_\Interface\AddOns\`
3. Create a new folder named `ArtisanMailManager`
4. Place the downloaded files (`ArtisanMailManager.lua` and `ArtisanMailManager.toc`) into this folder
5. Restart World of Warcraft or reload your UI (/reload)

## Using the Addon

### In-Game Button
1. Open your mailbox in-game
2. Look for a button labeled "Process Artisan Mail" in the top right corner of the mail frame
3. Click this button to start processing Artisan's Consortium emails

### Slash Command
You can also use the slash command `/amm` to start processing emails from anywhere in the game.

### Confirmation Dialog
For your safety, a confirmation dialog will appear before processing begins. This dialog will show you how many Artisan's Consortium emails were found.

### What the Addon Does
When activated, Artisan Mail Manager will:
1. Scan your inbox for emails from the Artisan's Consortium
2. For each Artisan's Consortium email:
   - If it contains items or gold, these will be automatically looted
   - If it's empty, the email will be deleted
3. The addon processes one email at a time with a short delay to avoid overwhelming the server

### Stopping the Process
The addon will automatically stop processing emails if:
- There are no more Artisan's Consortium emails to process
- You close the mailbox

## Safety Features
- The addon only processes emails from the Artisan's Consortium
- A confirmation dialog prevents accidental activation
- The addon stops if you close the mailbox

## Troubleshooting
If you encounter any issues:
1. Ensure the addon is up to date
2. Try disabling other addons to check for conflicts
3. If problems persist, please report the issue to the addon author
