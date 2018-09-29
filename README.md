# AHKUtilities - User Guide

[![MIT license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/urbanoanderson/ahkutilities/blob/master/LICENSE.txt)

## Author

AHKUtilities is written and mantained by Anderson Urbano (anderson.urb01@gmail.com).

## About

AHKUtilities is a collection of custom Windows hotkeys for productivity features implemented using [AutoHotKey v1.1](https://autohotkey.com/).

## Instalation

- Install Auto Hot Key for Windows ([link](https://autohotkey.com/download))
- Clone or download this repository.
- Edit the following setup variables at `AHKUtilities.config`:
    - <EMAIL_ADDRESS>: your personal address.
    - <TELEGRAM_BOT_KEY>: key for a telegram bot controlled by you
    - <TELEGRAM_CHAT_ID>: chatId for a chat involving the bot (probably a chat with you)
- Execute `AHKUtilities.ahk` with AutoHotKey.
- Optional: Set `AHKUtilities.ahk` to be automatically executed at startup.

## How to Use

AHKUtilities can be used by holding a special hotkey enabler (HE) and pressing a command key. By default, the hotkey enabler is `Insert`. The following list contains descriptions of available hotkeys for these features:

### Power Settings

- `HE+F1`: Sets energy mode to "Power Saver".

- `HE+F2`: Sets energy mode to "Balanced".

- `HE+F3`: Sets energy mode to "High Performance".

### Website search

- `HE+G`: Opens a new browser tab and searches the selected text on google.

- `HE+Y`: Opens a new browser tab and searches the selected text on youtube.

### Application keys

- `HE+S`: Launch Spotify app if installed.

### String insertion and manipulation

- `HE+U`: Replaces the selected text for an UPPERCASE version of it. Works better with short single-line texts.

- `HE+L`: Replaces the selected text for an LOWERCASE version of it. Works better with short single-line texts.

- `HE+A`: Auto type user's email. Great for login in websites.

### GUI Routines

- `HE+SPACE`: Keep current window always on top.

- `HE+P`: Get pixel color from current mouse position on screen.

### Multi Clipboard Tool

- `HE+NUMBER`: Select a custom clipboard with slot identified by NUMBER (wont work with keys from numberpad).

- `HE+C`: Copy selected text to current selected clipboard slot.

- `HE+V`: Paste text stored on current clipboard slot.

### Telegram Bot Integration

- `HE+T`: Make custom bot with key <TELEGRAM_BOT_KEY> send selected text to person identified by <TELEGRAM_CHAT_ID>. Great for sending links and other texts to yourself.