#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory

^m::
	start=2060000000
	finish=2069999999
	Loop %finish%
	{
		Send %start%
		MouseClick Left, 700, 800, 1, 0
		start++
		Sleep 800
		WinGetText text, A
		IfInString text, Login
		{
			Send `n
		}
		Send `n
		MouseClick Left, 700, 300, 2, 0
		Send `b
	}
return
	
^l::
	
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