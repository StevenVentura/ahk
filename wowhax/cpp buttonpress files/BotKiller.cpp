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
HWND hwndWindowNotepad = FindWindow(NULL, _T("World of Warcraft"));//TEXT("Calculator"));


hwndWindowNotepad = FindWindow(_T("GxWindowClass"),NULL);

//srand((unsigned)time(0));

while(1)
{
Sleep(117);

//0x09 = tab
//PostMessage(hwndWindowNotepad, WM_KEYDOWN, 0x09, 0);
//Sleep(50);
//PostMessage(hwndWindowNotepad, WM_KEYUP, 0x09, 0);

PostMessage(hwndWindowNotepad, WM_KEYDOWN, 0x20, 0);
Sleep(50);
PostMessage(hwndWindowNotepad, WM_KEYUP, 0x20, 0);
//0x20 = spacebar


PostMessage(hwndWindowNotepad, WM_KEYDOWN, 0x5A, 0);
Sleep(50);
PostMessage(hwndWindowNotepad, WM_KEYUP, 0x5A, 0);

}





return 0;
}