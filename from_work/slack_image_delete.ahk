
MsgBox, Use this with SlackDeletron.com. Press E to exit app. Press W to spam click. Press Q to toggle Off.
e::ExitApp
global controlboye = False

q::boyefix()

boyefix()
{
controlboye := False

}

$w::
controlboye := True
  While controlboye
  {
    MouseClick, left
    Sleep, 333 ; every 
  }
Return
