﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; HotKey to Initiate VI-mode with Double-tap of Alt
~Alt::
If (A_PriorHotKey = "~Alt" AND A_TimeSincePriorHotKey < 200)
{
; Set the flags for OSD
Gui, 99:+AlwaysOnTop -Caption +ToolWindow +Disabled -SysMenu +Owner
; Add and set the OSD Text
Gui, 99:Font, s12 bold
Gui, 99:Add, Text, cAA0000, VIM-Mode Activated (Esc to Exit Vim-Mode)
; OSD Background Color (Black)
Gui, 99:Color, 000000
Gui, 99:Show,NoActivate xCenter y10, VIM-Mode Activated
}
Send, {~AltUp}
Return

#IfWinExist VIM-Mode Activated

    ; ESC ends VIM-mode
    ESC:: Gui, 99:Destroy

    ; cursor movements
    h:: SendInput {Left Down}
    j:: SendInput {Down Down}
    k:: SendInput {Up Down}
    l:: SendInput {Right Down}

    ; page movements
    w:: SendInput ^{Right}
    b:: SendInput ^{Left}
    x:: SendInput {Delete}
    0:: SendInput {Home}
    -:: SendInput {End}

    ; selection movements with Shift
    +h:: SendInput +{Left Down}
    +j:: SendInput +{Down Down}
    +k:: SendInput +{Up Down}
    +l:: SendInput +{Right Down}
    +w:: SendInput +^{Right}
    +b:: SendInput +^{Left}
    +x:: SendInput +{Delete}
    ):: SendInput +{Home}
    _:: SendInput +{End}

    ; Copy (Yank) / Cut (Delete) / Paste (Put)
    y:: ^c
    p:: ^v
    d:: ^x

    ; HotKey to VIM maps
    u:: SendInput ^z
#IfWinExist

; cursor movements
; !h:: SendInput {Left Down}
; !j:: SendInput {Down Down}
; !k:: SendInput {Up Down}
; !l:: SendInput {Right Down}

; page movements
; !w:: SendInput ^{Right}
; !b:: SendInput ^{Left}
; !x:: SendInput {Delete}
; !0:: SendInput {Home}
; !-:: SendInput {End}

; selection movements with Shift
; +!h:: SendInput +{Left Down}
; +!j:: SendInput +{Down Down}
; +!k:: SendInput +{Up Down}
; +!l:: SendInput +{Right Down}
; +!w:: SendInput +^{Right}
; +!b:: SendInput +^{Left}
; +!x:: SendInput +{Delete}
; !):: SendInput +{Home}
; !_:: SendInput +{End}

; HotKey to VIM maps
; !u:: SendInput ^z

; Mac/Windows/Linux Compatibility
^q:: SendInput !{F4}
!i:: SendInput {F2}

; HHKB Mappings
;   awesome Ctrl !!!
Capslock::Ctrl

