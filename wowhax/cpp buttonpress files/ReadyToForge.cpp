//key codes:: http://msdn.microsoft.com/en-us/library/windows/desktop/dd375731(v=vs.85).aspx
//WM codes:: http://www.autoitscript.com/autoit3/docs/appendix/WinMsgCodes.htm
#include "TCHAR.h"
#include "Windows.h"
#include <iostream>
#include <WinUser.h>
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
HWND hwndWindowNotepad = FindWindow(NULL, _T("LaunchUnrealUWindowsClient"));//TEXT("Calculator"));
hwndWindowNotepad = FindWindow(_T("LaunchUnrealUWindowsClient"),NULL);
if (hwndWindowNotepad)
{
	cout << "Found the game window: " << hwndWindowNotepad << endl;
	cout << "<:3c~" << endl << "Are you Ready to Forge?";
}
else
	cout << "didnt find game window. run again pls" << endl;



//hwndWindowNotepad = FindWindow(_T("GxWindowClass"),NULL);

//srand((unsigned)time(0));
int count = 0;
while(1)
{


//0x56 = v

PostMessage(hwndWindowNotepad, WM_KEYDOWN, 0x56, 0);
Sleep(50);
PostMessage(hwndWindowNotepad, WM_KEYUP, 0x56, 0);

//0x20 = spacebar

//0x52 = r
for (int i = 0; i < 10; i++) {
PostMessage(hwndWindowNotepad, WM_KEYDOWN, 0x52, 0);
Sleep(10);
PostMessage(hwndWindowNotepad, WM_KEYUP, 0x52, 0);
}



Sleep(117);
Sleep(4000);



}

/*
while(1)
{

//0x56 = v

for (int c = 0; c < 4; c++) {
PostMessage(hwndWindowNotepad, WM_KEYDOWN, 0x56, 0);
Sleep(50);
PostMessage(hwndWindowNotepad, WM_KEYUP, 0x56, 0);

//0x20 = spacebar

//0x52 = r
for (int i = 0; i < 10; i++) {
PostMessage(hwndWindowNotepad, WM_KEYDOWN, 0x52, 0);
Sleep(10);
PostMessage(hwndWindowNotepad, WM_KEYUP, 0x52, 0);
}
Sleep(606);
}

Sleep(117);
Sleep(8000);





}*/





return 0;
}