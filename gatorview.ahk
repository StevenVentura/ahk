/*
!n::Run Notepad ; Alt+n
^n::Run Notepad ; Ctrl+n
+n::Run Notepad ; Shift+n
#n::Run Notepad ; the Win+n
*/

+!l::showmygator()



showmygator() {

; Example #2: This will visit all windows on the entire system and display info about each of them:
WinGet, id, list,,, Program Manager
Loop, %id%
{
    this_id := id%A_Index%
    ; WinActivate, ahk_id %this_id%
    WinGetClass, this_class, ahk_id %this_id%
    WinGetTitle, this_title, ahk_id %this_id%
	
	if (InStr(this_title, "Windows Photo Viewer"))
		{
	WinActivate, ahk_id %this_id%
		
		}
	
    ; MsgBox, 4, , Visiting All Windows`n%a_index% of %id%`nahk_id %this_id%`nahk_class %this_class%`n%this_title%`n`nContinue?
    ; IfMsgBox, NO, break
}


}