#NoEnv
#NoTrayIcon
#SingleInstance force

SendMode Input

!XButton1::
  Sleep, 10 
  Send, {Alt Down}{Left}{Alt Up}
return

!XButton2::
  Sleep, 10
  Send, {Alt Down}{Right}{Alt Up}
return
