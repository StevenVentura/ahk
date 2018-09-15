//OverwatchAFK.cpp

//https://msdn.microsoft.com/en-us/library/windows/desktop/dd375731(v=vs.85).aspx
//WM codes:: http://www.autoitscript.com/autoit3/docs/appendix/WinMsgCodes.htm
#include "TCHAR.h"
#include "Windows.h"
#include <iostream>
#include <WinUser.h>
#include <stdio.h>
#include "ctime"
using namespace std;
typedef wchar_t WCHAR;

typedef char *LPSTR;
typedef const char *LPCSTR;
typedef WCHAR *LPWSTR;
typedef const WCHAR *LPCWSTR;

#ifdef UNICODE
typedef WCHAR TCHAR;
#else
typedef char TCHAR;
#endif

typedef TCHAR *LPTSTR;
typedef const TCHAR *LPCTSTR;

//http://stackoverflow.com/questions/6058439/how-to-send-mouse-click-event-to-a-game-application





int _tmain(int argc, _TCHAR* argv[])
{
    //find the window frame for overwatch
HWND overwatchWindow = FindWindow(NULL, _T("Overwatch"));//TEXT("Calculator"));

//get the window handle onto the inner frame for the game client itself
overwatchWindow = FindWindow(_T("TankWindowClass"),NULL);

srand((unsigned)time(0));//set the seed

/*
program behavior:
jump periodically and walk around randomly.



*/

//keys:                 W S A D
int moveDirection [4] = {0x57,0x53,0x41,0x44};
int moveDurationMax = 1000;
int moveDurationCounter = 0;
int directionChoice = 0;


while(1)
{
int sleepThisLoop = (rand()%1000);
Sleep(sleepThisLoop);
int miscButtonToPress = (rand()%100);
if (miscButtonToPress < 25){//q key
PostMessage(overwatchWindow, WM_KEYDOWN, 0x51,0);
Sleep(50);
PostMessage(overwatchWindow, WM_KEYUP, 0x51,0);
}
else if (miscButtonToPress < 50)//e key
{
PostMessage(overwatchWindow, WM_KEYDOWN, 0x45,0);
Sleep(50);
PostMessage(overwatchWindow, WM_KEYUP, 0x45,0);

}
else if (miscButtonToPress < 75)
{
    //z key
PostMessage(overwatchWindow, WM_KEYDOWN, 0x5A,0);
Sleep(50);
PostMessage(overwatchWindow, WM_KEYUP, 0x5A,0);
}
else if (miscButtonToPress < 100)
{
//F key
PostMessage(overwatchWindow, WM_KEYDOWN, 0x46,0);
Sleep(50);
PostMessage(overwatchWindow, WM_KEYUP, 0x46,0);

}
moveDurationCounter += moveDurationMax;

if (moveDurationCounter >  moveDurationMax) {
//change directions.

//release the current key.
PostMessage(overwatchWindow, WM_KEYUP, moveDirection[directionChoice],0);
//set up variables for next direction
    moveDurationCounter = 0;
    moveDurationMax = ((rand()%1000)*3) + 1000;

    directionChoice = rand()%4;
    if (directionChoice == 0) {
        //if its forward then make it a bit longer.
        moveDurationMax += 2000;

    }
//press the new key.
PostMessage(overwatchWindow, WM_KEYDOWN, moveDirection[directionChoice],0);

}


//chance of jumping.
if (rand()%100 < 25)
{
//jump -- C key 0x43
PostMessage(overwatchWindow, WM_KEYDOWN, 0x43, 0);
Sleep(50);
PostMessage(overwatchWindow, WM_KEYUP, 0x43, 0);
//0x20 = spacebar
//0x43 = C key
}











}





return 0;
}
