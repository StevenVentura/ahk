/*
!n::Run Notepad ; Alt+n
^n::Run Notepad ; Ctrl+n
+n::Run Notepad ; Shift+n
#n::Run Notepad ; the Win+n

$  ;It forces the hook in the hotkey. That is, it disallows the hotkey to be triggered by it's own send commands and generally most other virtual (non-physical) key presses.
~ ; tell keybind to propagate
*/

+!l::showmygator()
+!NumpadMult::unshow_why()
+!o::unshow()
+!t::alwaystopboye()
~#d::SaveOpenWindows()


WindowsSaved := []

alwaystopboye() {


Winset, Alwaysontop, Toggle, A






}





SaveOpenWindows() {

WindowsSaved := []

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
	WindowsSaved.Push(ahk_id %this_id%)
	
		}
	
    ; MsgBox, 4, , Visiting All Windows`n%a_index% of %id%`nahk_id %this_id%`nahk_class %this_class%`n%this_title%`n`nContinue?
    ; IfMsgBox, NO, break
}




}


unshow() {



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
	WinMinimize, ahk_id %this_id%
	
		}
	
    ; MsgBox, 4, , Visiting All Windows`n%a_index% of %id%`nahk_id %this_id%`nahk_class %this_class%`n%this_title%`n`nContinue?
    ; IfMsgBox, NO, break
}





}


unshow_why() {



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
	WinHide, ahk_id %this_id%
	
		}
	
    ; MsgBox, 4, , Visiting All Windows`n%a_index% of %id%`nahk_id %this_id%`nahk_class %this_class%`n%this_title%`n`nContinue?
    ; IfMsgBox, NO, break
}



}


showmygator() {

DetectHiddenWindows, On

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
		WinShow, ahk_id %this_id%
	WinActivate, ahk_id %this_id%
	
		}
	
    ; MsgBox, 4, , Visiting All Windows`n%a_index% of %id%`nahk_id %this_id%`nahk_class %this_class%`n%this_title%`n`nContinue?
    ; IfMsgBox, NO, break
}


}