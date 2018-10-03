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

enter     = alt 1
undo      = shift 2
redo      = shift 1
backspace = 2

copy      = 
paste     = 1


later i can add my Sequence of Copy Paste thing.
it will copy things and add it to an AHK table window UI



*/


PgUp::Ins
XButton2::BackSpace
XButton1::pasteboy()
+XButton2::undoboy()
+XButton1::redoboy()




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
Send ^v
}