;=====================================================================
; SETUP VARIABLES
;=====================================================================

EMAIL_ADDRESS := "YOUR EMAIL ADDRESS"
TELEGRAM_BOT_KEY := "YOUR BOT KEY"
TELEGRAM_CHAT_ID := "YOUR CHAT ID"

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
ScrollLock::
{
    SetScrollLockState, AlwaysOff
    Reload
    Return
}

; Enable/Disable AutoHotKey script (Pause Break)
ScrollLock & Pause::Suspend

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
ScrollLock & F1::
{
    Run, powercfg -s a1841308-3541-4fab-bc81-f71556f20b4a ,,Hide
    TrayTip Plano de Energia, Modo de Economia
    Return
}

; Toggle Moderate Mode
ScrollLock & F2::
{
    Run, powercfg -s 381b4222-f694-41f0-9685-ff5bb260df2e ,,Hide
    TrayTip Plano de Energia, Modo Moderado
    Return
}

; Toggle High Performance Mode
ScrollLock & F3::
{
    Run, powercfg -s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c ,,Hide
    TrayTip Plano de Energia, Modo de Alto Desempenho
    Return
}

;=====================================================================
; WEB SEARCH
;=====================================================================

; Search selected text on google
ScrollLock & G::
{
	Send, ^c
	Sleep 50
	Run, http://www.google.com/search?q=%ClipBoard%
	Return
}

; Search selected text on youtube
ScrollLock & Y::
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
ScrollLock & Left::Media_Prev
ScrollLock & Right::Media_Next
ScrollLock & Down::Media_Play_Pause
ScrollLock & Up::Media_Stop
ScrollLock & NumpadAdd::Volume_Up
ScrollLock & NumpadSub::Volume_Down
ScrollLock & NumpadMult::Volume_Mute

;=====================================================================
; STRING INSERTION AND MANIPULATION
;=====================================================================

; Convert Selected Text to Uppercase
ScrollLock & U::
{
    SetKeyDelay, 0
    Send, ^x
    Sleep, 150
    StringUpper Clipboard, Clipboard
    Send %Clipboard%
	Return
}

; Convert Selected Text to Lowercase
ScrollLock & L::
{
    SetKeyDelay, 0
    Send, ^x
    Sleep, 150
    StringLower Clipboard, Clipboard
    Send %Clipboard%
	Return
}

;Auto Type my email
ScrollLock & A::
{
    SetKeyDelay, 0
    Send, %EMAIL_ADDRESS%
    Return
}

;=====================================================================
; GUI ROUTINES
;=====================================================================

; Keep a Window Always on Top
ScrollLock & SPACE::
{
    Winset, Alwaysontop, , A
	Return
}

; Get pixel color from mouse position on screen
ScrollLock & P::
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
ScrollLock & 1::multiClipboardIdx := 1
ScrollLock & 2::multiClipboardIdx := 2
ScrollLock & 3::multiClipboardIdx := 3
ScrollLock & 4::multiClipboardIdx := 4
ScrollLock & 5::multiClipboardIdx := 5
ScrollLock & 6::multiClipboardIdx := 6
ScrollLock & 7::multiClipboardIdx := 7
ScrollLock & 8::multiClipboardIdx := 8
ScrollLock & 9::multiClipboardIdx := 9

; Custom copy
ScrollLock & C::
{
    temp := ClipBoard
    Send ^c
    ClipWait
    multiClipboard[multiClipboardIdx] := ClipBoard
    ClipBoard := temp
    Return
}

; Custom paste
ScrollLock & V::
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
ScrollLock & T::
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