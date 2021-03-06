#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory
	
^l::
	WinGetText text, A
	MsgBox %text%
return

^m::
	start=8500
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
			FileAppend 
			(
			`n
			%start%
			), found.txt
			MsgBox found it!
			Break
		}
		start++
		Sleep 25
		Send `b`b`b`b
	}
	Exit 0
return