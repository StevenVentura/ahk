Numpad5::reloadCannonButton()


reloadCannonButton()
{

;activate runescape window
WinActivate, Old School RuneScape
;save position relative to runescape
MouseGetPos, mouseX, mouseY
;move mouse to cannon
MouseMove, 288, 202
Click
;move mouse back
MouseMove, mouseX, mouseY
;get that mouse focus back pls
Click


}



