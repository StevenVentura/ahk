/*
!n::Run Notepad ; this means Alt+n
^n::Run Notepad ; this means Ctrl+n
+n::Run Notepad ; this means Shift+n
#n::Run Notepad ; this means the Win+n
*/

#x::Cut()
#c::Copy()
#v::Paste()
#z::Swap()

global board2

Swap() {
/*
idiot code btw
*/
a:= ClipboardAll
b:= board2
board2:= a
Clipboard:= b
SoundBeep, 750, 100
}

Cut() {
normalboard:= ClipboardAll
Sleep 100
Clipboard:= ;
Send {Ctrl Down}{x Down}
Sleep 50
Send {x Up}{Ctrl Up}

board2:= ClipboardAll
Clipboard:= normalboard


}
Copy() {
normalboard:= ClipboardAll
Sleep 100
Clipboard:= ;
Send {Ctrl Down}{c Down}
Sleep 50
Send {c Up}{Ctrl Up}
Sleep 1000

board2:= ClipboardAll
Clipboard:= normalboard


}

Paste() {
normalboard:= ClipboardAll
Clipboard:= board2
Send ^v
Clipboard:= normalboard


}