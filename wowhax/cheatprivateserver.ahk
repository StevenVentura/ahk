Esc::ExitApp

toggle := false

x::SetTimer, Macro, % ((toggle := !toggle) ? "0" : "Off")

Macro:
    Send, {Tab}
	Sleep, 50
	Send, {3}
	Sleep, 50
    return