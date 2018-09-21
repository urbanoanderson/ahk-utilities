# User Guide

## Author

AHKUtilities is written and mantained by Anderson Urbano.

## About

AHKUtilities is a collection of custom Windows hotkeys for productivity features implemented using [AutoHotKey](https://autohotkey.com/).

## Instalation

- Install Auto Hot Key for Windows ([link](https://autohotkey.com/download))
- Clone or download `AHKUtilities.ahk` from this repository.
- Insert your credentials for certain script functions:
    - <EMAIL_ADDRESS>
    - <TELEGRAM_BOT_KEY>
    - <TELEGRAM_CHAT_ID>
- Execute `AHKUtilities.ahk` with Auto Hot Key.
- Optional: Set `AHKUtilities.ahk` to be automatically executed at startup.

## How to Use

AHKUtilities can be used by holding a special hotkey enabler (HE) and pressing a command key. By default, the hotkey enabler is ScrollLock. The following list contains descriptions of available hotkeys for these features:

### Power Settings

- `HE+F1`: Sets energy mode to "Power Saver".

- `HE+F2`: Sets energy mode to "Balanced".

- `HE+F3`: Sets energy mode to "High Performance".

### Website search

- `HE+G`: Opens a new browser tab and searches the selected text on google.

- `HE+Y`: Opens a new browser tab and searches the selected text on youtube.

### Media keys

- `HE+LEFT`: Previous song.

- `HE+RIGHT`: Next song.

- `HE+UP`: Stop song.

- `HE+DOWN`: Play/Pause song.

- `HE+NUMPAD_PLUS`: Increase volume.

- `HE+NUMPAD_MINUS`: Decrease volume.

- `HE+NUMPAD_MULTIPLY`: Mute volume.

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

## Future Updates

- Allow for easy setting of different a hotkey enabler.
- Easy access to credential parameters as global variables.
- Multiple script files for different sets of features. 