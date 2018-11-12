/*
!n means Alt+n
^n means Ctrl+n
+n means Shift+n
#n means Win+n
*/

/*
revision 10/3/18
STEVEN VENTURA
all meme reserve

need bindings for:

enter     = shift 2
undo      = alt 1
redo      = shift 1
backspace = 2

copy      = numpad plus, 
paste     = 1


later i can add my Sequence of Copy Paste thing.
it will copy things and add it to an AHK table window UI
later i can make the UI for buttons to click to copypaste things, can use load file for info


+XButton2::enterboy()
redoboy()
undoboy()
+XButton1::
*/

PgUp::Ins
XButton2::BackSpace
XButton1::pasteboy()


NumpadAdd::copyboy()
#Numpad5::p1()
#Numpad6::p2()
#Numpad4::u1()

u1() {
SavedClip := ClipboardAll
    Clipboard := "987345693"
    Send ^v
    Clipboard := SavedClip
    SavedClip := ""
}

p1() {
SavedClip := ClipboardAll
    Clipboard := "nevro2018"
    Send ^v
    Clipboard := SavedClip
    SavedClip := ""
}

p2() {
	Sleep 4000
    Send Nevro2018
}


enterboy()
{
SendInput, {LShift Up}
Click
Send, {Enter}
}

undoboy()
{
Send ^z
}

redoboy()
{
Send ^y
}






copyboy()
{
Send ^c

}

pasteboy()
{
Click
Sleep, 100
Send ^v
}