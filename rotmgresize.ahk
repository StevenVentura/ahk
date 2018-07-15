;7/13/18 steven ventura got this code from https://autohotkey.com/boards/viewtopic.php?t=8448
Gui, +AlwaysOnTop
Gui, Add, ListView, h200 w870, Count|WinTitle|ahk_class|hWinEventHook|event|hwnd|idObject|idChild|dwEventThread|dwmsEventTime
for Col, Width in [50, 150, 100, 100, 50, 80, 80, 50, 100, 100]
    LV_ModifyCol(Col, Width)
;Gui, Show, x10 y10
OnExit, UnHook

; RealmPID is used for the idProcess parameter when calling SetWinEventHook
Process, Exist, Realm of the Mad God.EXE
if ErrorLevel
    RealmPID := ErrorLevel

/*  HWINEVENTHOOK WINAPI SetWinEventHook
 *      - http://msdn.microsoft.com/en-us/library/windows/desktop/dd373640%28v=vs.85%29.aspx
 *  Event Constants
 *      - http://msdn.microsoft.com/en-us/library/windows/desktop/dd318066%28v=vs.85%29.aspx
 */
;EVENT_OBJECT_CREATE := 0x8000
;EVENT_OBJECT_FOCUS := 0x8005
;EVENT_OBJECT_LOCATIONCHANGE := 0x800B
EVENT_SYSTEM_MOVESIZEEND := 0x000B
EVENT_SYSTEM_MOVESIZESTART := 0x000A
WINEVENT_OUTOFCONTEXT := 0x0
WINEVENT_SKIPOWNPROCESS := 0x2
Hook := DllCall("SetWinEventHook"
    , "UInt",   EVENT_SYSTEM_MOVESIZESTART                      ;_In_  UINT eventMin
    , "UInt",   EVENT_SYSTEM_MOVESIZEEND                        ;_In_  UINT eventMax
    , "Ptr" ,   0x0                                             ;_In_  HMODULE hmodWinEventProc
    , "Ptr" ,   RegisterCallback("WinEventProc")                ;_In_  WINEVENTPROC lpfnWinEventProc
    , "UInt",   RealmPID                                        ;_In_  DWORD idProcess
    , "UInt",   0x0                                             ;_In_  DWORD idThread
    , "UInt",   WINEVENT_OUTOFCONTEXT|WINEVENT_SKIPOWNPROCESS)  ;_In_  UINT dwflags
return


/*  WinEventProc callback function
 *      - http://msdn.microsoft.com/en-us/library/windows/desktop/dd373885%28v=vs.85%29.aspx
 */
WinEventProc(hWinEventHook, event, hwnd, idObject, idChild, dwEventThread, dwmsEventTime) {
    if (event <> 0x000B) ;
		return
	static Count := 0
    WinGetTitle, WinTitle, ahk_id %hwnd%
    WinGetClass, WinClass, ahk_id %hwnd%
	WinGetPos, X, Y, Width, Height, ahk_id %hwnd%
	NewWidth := (800/600 * (Height-38))+16
	WinMove, ahk_id %hwnd%, , , , NewWidth
	
	LV_Insert(1, "", ++Count, WinTitle, WinClass, hWinEventHook, event, hwnd, idObject, idChild, dwEventThread, dwmsEventTime)
	
    return
}

UnHook:
DllCall("UnhookWinEvent", "Ptr",Hook)
GuiEscape:
GuiClose:
ExitApp