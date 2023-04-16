#NoEnv
#NoTrayIcon
#SingleInstance force

SendMode Input

WinSet, Transparent, 0, ahk_class Shell_TrayWnd
WinSet, Transparent, 0, ahk_class Shell_SecondaryTrayWnd

^LWin:: ; Ctrl + left Win key
if Transparent := !Transparent
{
	WinSet, Transparent, 0, ahk_class Shell_TrayWnd
	WinSet, Transparent, 0, ahk_class Shell_SecondaryTrayWnd
}
else
{
	WinSet, Transparent, 255, ahk_class Shell_TrayWnd
	WinSet, Transparent, 255, ahk_class Shell_SecondaryTrayWnd
	WinSet, TransColor, OFF, ahk_class Shell_TrayWnd
	WinSet, TransColor, OFF, ahk_class Shell_SecondaryTrayWnd
	WinSet, Transparent, OFF, ahk_class Shell_TrayWnd
	WinSet, Transparent, OFF, ahk_class Shell_SecondaryTrayWnd
	WinSet, Redraw,, ahk_class Shell_TrayWnd
	WinSet, Redraw,, ahk_class Shell_SecondaryTrayWnd
}
return
