DetectHiddenWindows, On

!F3::go()
!F2::minihaha()
!w::minihaha()
!e::therestore()
!+t::togglealwaysontop()

please := asdf
actuallyontop := "Off"

go()
{
WinGet, var, PID, A
Process, Close, %var%

}


minihaha()
{
global please
WinGetTitle, please, A
WinMinimize, A

}

therestore()
{
global please
WinRestore, %please%
}

togglealwaysontop()
{
global actuallyontop
if (actuallyontop == "On")
{
actuallyontop = Off
SoundBeep, 420, 303
}
else
{
actuallyontop = On
SoundBeep, 1488, 303
}
WinSet, AlwaysOnTop, %actuallyontop%, A
}