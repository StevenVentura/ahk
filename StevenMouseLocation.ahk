global ok := False
; This example allows you to move the mouse around to see
; the title of the window currently under the cursor:
#Persistent
SetTimer, WatchCursor, 100
return

WatchCursor:
CoordMode, Mouse, Relative
MouseGetPos, mouseX, mouseY, id, control
WinGetTitle, title, ahk_id %id%
WinGetClass, class, ahk_id %id%
;ToolTip, ahk_id %id%`nahk_class %class%`n%title%`nControl: %control%

CoordMode, Mouse, Screen
MouseGetPos, mX, mY


if (ok = True)
{
ToolTip, ahk_id %id%`nahk_class %class%`n%title%`nControl: %control%`nRelative: %mouseX%`,%mouseY%`nAbsolute: %mX%`,%mY%
}
else
{
ToolTip
}

return


^Numpad8::Please()



Please()
{
if (ok = True)
{
ok := False

}
else
{
ok := True

}


}