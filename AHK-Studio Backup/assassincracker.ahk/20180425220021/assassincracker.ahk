#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory

^m::
	start=2064277232
	finish=2069999999
	Loop 1
	{
		popupcheck=OK
		successcheck=Navigation
		Send %start%
		MouseClick Left, 750, 800, 1, 0
		Sleep 1500
		WinGetText text, A
		If InStr(text, popupcheck)
		{
			MsgBox fuck
			Send `n
		}
		else if InStr(text, successcheck)
		{
			MsgBox shit
			FileAppend 
			(
			-
			%start%
			), %A_ScriptDir%\found.txt
		}
		MouseClick Left, 100, 0, 2, 0
		start++
		Send `b
	}
return
	
^l::
	WinGetText text, A
	MsgBox %text%
return

^n::
	start=0
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
		start++
		Sleep 25
		Send `b`b`b`b
	}
	Exit 0
return