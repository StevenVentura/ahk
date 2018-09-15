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
spam H to get zenyatta


*/

while(1)
{

PostMessage(overwatchWindow, WM_KEYDOWN, 0x48, 0);
Sleep(50);
PostMessage(overwatchWindow, WM_KEYUP, 0x48, 0);
Sleep(50);










}





return 0;
}
