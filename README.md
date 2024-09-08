# Artisan Mail Manager

## Overview
Artisan Mail Manager is a World of Warcraft addon that helps manage emails from the Artisan's Consortium. It provides functionality to automatically process these emails, including looting items and gold, and deleting empty emails.

## Features
- Automatically identifies emails from the Artisan's Consortium
- Loots items and gold from Artisan's Consortium emails
- Deletes empty emails from the Artisan's Consortium
- Provides a button in the mail frame for easy access
- Includes a slash command (/amm) for quick activation
- Implements a confirmation dialog to prevent accidental use
- Stops processing when the mailbox is closed

## Files
- `ArtisanMailManager.lua`: Main addon code
- `ArtisanMailManager.toc`: Addon metadata file

## Installation
1. Download the addon files
2. Place the files in the appropriate World of Warcraft addons directory
3. Restart the game or reload the UI

## Usage
Refer to the USER_GUIDE.md file for detailed usage instructions.

## Development
The addon is built with Lua and uses the World of Warcraft API. Key functions include:

- `isArtisanMail(sender)`: Checks if an email is from the Artisan's Consortium
- `processMail(index)`: Processes a single mail
- `processAllMails()`: Initiates the mail processing sequence
- `processMailsOneByOne()`: Processes mails one at a time with a delay

## Considerations
This addon is designed with Blizzard's Terms of Service and addon policies in mind. It requires user interaction to function and includes safeguards against excessive automation.
