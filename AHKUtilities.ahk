#NoEnv
#SingleInstance force
SetWorkingDir %A_ScriptDir%

;=====================================================================
; READ SETUP VARIABLES
;=====================================================================

IniRead, EMAIL_ADDRESS, AHKUtilities.config, Configuration, EMAIL_ADDRESS
IniRead, TELEGRAM_BOT_KEY, AHKUtilities.config, Configuration, TELEGRAM_BOT_KEY
IniRead, TELEGRAM_CHAT_ID, AHKUtilities.config, Configuration, TELEGRAM_CHAT_ID

;=====================================================================
; GLOBAL VARIABLE DECLARATION
;=====================================================================

multiClipboardIdx := 1
global multiClipboard := []
multiClipboard[1] := "ClipBoard 1"
multiClipboard[2] := "ClipBoard 2"
multiClipboard[3] := "ClipBoard 3"
multiClipboard[4] := "ClipBoard 4"
multiClipboard[5] := "ClipBoard 5"
multiClipboard[6] := "ClipBoard 6"
multiClipboard[7] := "ClipBoard 7"
multiClipboard[8] := "ClipBoard 8"
multiClipboard[9] := "ClipBoard 9"

;=====================================================================
; KEYBOARD AND AUTO_HOT_KEY RELATED FUNCTIONS 
;=====================================================================

; Reload any changes on script and keep ScrollLock always off
Insert::
{
    SetScrollLockState, AlwaysOff
    Reload

    Return
}

; Enable/Disable AutoHotKey script (Pause Break)
Insert & Pause::
{
    Suspend
    Return
}

; Keep Number Lock on
NumLock::
{
    SetNumLockState, AlwaysOn
    Return
}

;=====================================================================
; POWER SETTINGS
;=====================================================================

; Toggle Economy Mode
Insert & F1::
{
    Run, powercfg -s a1841308-3541-4fab-bc81-f71556f20b4a ,,Hide
    TrayTip Plano de Energia, Modo de Economia
    Return
}

; Toggle Moderate Mode
Insert & F2::
{
    Run, powercfg -s 381b4222-f694-41f0-9685-ff5bb260df2e ,,Hide
    TrayTip Plano de Energia, Modo Moderado
    Return
}

; Toggle High Performance Mode
Insert & F3::
{
    Run, powercfg -s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c ,,Hide
    TrayTip Plano de Energia, Modo de Alto Desempenho
    Return
}

;=====================================================================
; WEB SEARCH
;=====================================================================

; Search selected text on google
Insert & G::
{
	Send, ^c
	Sleep 50
	Run, http://www.google.com/search?q=%ClipBoard%
	Return
}

; Search selected text on youtube
Insert & Y::
{
    Send, ^c
    Sleep 50
    Run, https://www.youtube.com/results?search_query=%ClipBoard%
    Return
}

;=====================================================================
; MEDIA KEYS
;=====================================================================

; Control Songs 
;Insert & Left::Media_Prev
;Insert & Right::Media_Next
;Insert & Down::Media_Play_Pause
;Insert & Up::Media_Stop
;Insert & NumpadAdd::Volume_Up
;Insert & NumpadSub::Volume_Down
;Insert & NumpadMult::Volume_Mute

; Launch Spotify App if installed
Insert & S::
{
    Run ".\WinApps\Spotify"
    Return
}

;=====================================================================
; STRING INSERTION AND MANIPULATION
;=====================================================================

; Convert Selected Text to Uppercase
Insert & U::
{
    SetKeyDelay, 0
    Send, ^x
    Sleep, 150
    StringUpper Clipboard, Clipboard
    Send %Clipboard%
	Return
}

; Convert Selected Text to Lowercase
Insert & L::
{
    SetKeyDelay, 0
    Send, ^x
    Sleep, 150
    StringLower Clipboard, Clipboard
    Send %Clipboard%
	Return
}

;Auto Type my email
Insert & A::
{
    SetKeyDelay, 0
    Send, %EMAIL_ADDRESS%
    Return
}

;=====================================================================
; GUI ROUTINES
;=====================================================================

; Keep a Window Always on Top
Insert & SPACE::
{
    Winset, Alwaysontop, , A
	Return
}

; Get pixel color from mouse position on screen
Insert & P::
{
    MouseGetPos, MouseX, MouseY
    PixelGetColor, color, %MouseX%, %MouseY%
    ClipBoard := StrReplace(color, "0x", "#")
    Return
}

;=====================================================================
; MULTI-CLIPBOARD TOOL FOR COPYING AND PASTING
;=====================================================================

; Switch clipboard index
Insert & 1::multiClipboardIdx := 1
Insert & 2::multiClipboardIdx := 2
Insert & 3::multiClipboardIdx := 3
Insert & 4::multiClipboardIdx := 4
Insert & 5::multiClipboardIdx := 5
Insert & 6::multiClipboardIdx := 6
Insert & 7::multiClipboardIdx := 7
Insert & 8::multiClipboardIdx := 8
Insert & 9::multiClipboardIdx := 9

; Custom copy
Insert & C::
{
    temp := ClipBoard
    Send ^c
    ClipWait
    multiClipboard[multiClipboardIdx] := ClipBoard
    ClipBoard := temp
    Return
}

; Custom paste
Insert & V::
{
    temp := ClipBoard
    ClipBoard := multiClipboard[multiClipboardIdx]
    Send ^v
    ClipBoard := temp
    Return
}

;=====================================================================
; TELEGRAM INTEGRATION
;=====================================================================

; Make bot send selected text to specified chat Id
Insert & T::
{
	Send, ^c
	Sleep 50

    WinHTTP := ComObjCreate("WinHTTP.WinHttpRequest.5.1")
	textMessage = %ClipBoard%
    telegramBotKey = %TELEGRAM_BOT_KEY%
    telegramChatId = %TELEGRAM_CHAT_ID%
    WinHTTP.Open("POST", Format("https://api.telegram.org/bot{1}/sendMessage?chat_id={2}&text={3}", telegramBotKey, telegramChatId, textMessage), 0)
	WinHTTP.Send()

    TrayTip Text Sent to Telegram, %textMessage%
	
    ;Result := WinHTTP.ResponseText
    ;Status := WinHTTP.Status
    ;msgbox % "status: " status "`n`nresult: " result
	
	Return
}