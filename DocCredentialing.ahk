#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Insurance IDs have been removed to protect proprietary information.

Gui, New, ,Provider Credentialing
Gui, Add, ListBox, w190 R10 vInsuranceChoice, AETNA|AMERIGROUP|BEACON|BLUESHIELD|CIGNA|CIGNA BEHAVIORAL|DENTAQUEST|MEDICAID OF KY|MEDICAID OF TN|MEDICAID OF NC|MEDICAID OF VA|MEDICARE TN|MEDICARE RR|VA PREM|TRICARE SOUTH|TRICARE EAST|TRICARE SELECT|UHC|OPTUM BH|ISHN

Gui, Add, Text, y150 xm, Ref Doc Num:
Gui, Add, Edit, y147 x85 w120 vRefDoc, 1123

Gui, Add, Text, y180 xm ,New Doc Num:
Gui, Add, Edit, y177 x85 w120 vNewDoc

Gui, Add, Text, y210 xm ,Prov Cred Num:
Gui, Add, Edit, y207 x85 w120 vProvNum

Gui, Add, Button, Default xm y250 w80 gOK, OK
Gui, Add, Button, Default y250 x125 w80 gCANCEL, CANCEL

Gui, Show
return

GuiClose:		;close Gui to Exit

GuiEscape:		;press Esc to Exit
ExitApp

CANCEL:
ExitApp

^j::
ExitApp

OK:
Gui, Submit
;MsgBox %RefDoc% and %NewDoc% and %InsuranceChoice%


IF (InsuranceChoice = "AETNA")
{
insuranceIDs := [1234, 1234, 1234, 1234]
}ELSE IF (InsuranceChoice = "AMERIGROUP")
{
insuranceIDs := [1234, 1234, 1234, 1234]
}ELSE IF (InsuranceChoice = "BEACON")
{
insuranceIDs := [1234, 1234, 1234, 1234]
}ELSE IF (InsuranceChoice = "BLUESHIELD")
{
insuranceIDs := [1234, 1234, 1234, 1234]
}ELSE IF (InsuranceChoice = "CIGNA")
{
insuranceIDs := [1234, 1234, 1234, 1234]
}ELSE IF (InsuranceChoice = "CIGNA BEHAVIORAL")
{
insuranceIDs := [1234, 1234, 1234, 1234]
}ELSE IF (InsuranceChoice = "DENTAQUEST")
{
insuranceIDs := [1234, 1234, 1234, 1234]
}ELSE IF (InsuranceChoice = "MEDICAID OF KY")
{
insuranceIDs := [1234, 1234, 1234, 1234]
}ELSE IF (InsuranceChoice = "MEDICAID OF TN")
{
insuranceIDs := [1234, 1234, 1234, 1234]
}ELSE IF (InsuranceChoice = "MEDICAID OF NC")
{
insuranceIDs := [1234, 1234, 1234, 1234]
}ELSE IF (InsuranceChoice = "MEDICAID OF VA")
{
insuranceIDs := [1234, 1234, 1234, 1234]
}ELSE IF (InsuranceChoice = "MEDICARE TN")
{
insuranceIDs := [1234, 1234, 1234, 1234]
}ELSE IF (InsuranceChoice = "MEDICARE RR")
{
insuranceIDs := [1234, 1234, 1234, 1234]
}ELSE IF (InsuranceChoice = "VA PREM" OR InsuranceChoice = "ISHN")
{
insuranceIDs := [1234, 1234, 1234, 1234]
}ELSE IF (InsuranceChoice = "TRICARE SOUTH" OR InsuranceChoice = "TRICARE SELECT")
{
insuranceIDs := [1234, 1234, 1234, 1234]
}ELSE IF (InsuranceChoice = "TRICARE EAST")
{
insuranceIDs := [1234, 1234, 1234, 1234]
}ELSE IF (InsuranceChoice = "UHC")
{
insuranceIDs := [1234, 1234, 1234, 1234]
}ELSE IF (InsuranceChoice = "OPTUM BH")
{
insuranceIDs := [1234, 1234, 1234, 1234]
}



;RefDoc = 1123
;NewDoc = 301
;ProvNum = 1316906647
;^j::
WinActivate 1 Experior - Expert PM

Sleep, 500

For index, element in insuranceIDs
SendValues(insuranceIDs[index], RefDoc, NewDoc, ProvNum)


SendValues(ins,RefDoc,NewDoc,ProvNum)
{
Send, ^{LEFT} 
Send, cpy
Sleep, 100
Send, {ENTER}
Sleep, 1500
Send, {TAB}
Send, {TAB}
Send, %ins%
If (StrLen(ins) < 6)
{
Send, {TAB}
}
Send, %ins%
If (StrLen(ins) < 6)
{
Send, {TAB}
}
Loop, 26
{
Send, {TAB}
}
Send, y
Send, %RefDoc%
If (StrLen(RefDoc) < 6)
{
Send, {TAB}
}
Send, %NewDoc%
Send, {ENTER}
Sleep, 1500
Send, IPM
Send, 1{SPACE}
Send, %ins%{SPACE}
Send, %NewDoc%

Send, {ENTER}
Sleep, 1000
Send, ^a
clipboard =
Send, ^c
ClipWait

varA = %clipboard%


IF (StrLen(ProvNum) < StrLen(varA))
{
StringLeft, tempString, varA, (StrLen(varA) - StrLen(ProvNum))
tempString = %tempString%%ProvNum%
} else
{
tempString = %ProvNum%
}

Send, %tempString%


Send, {ENTER}
Sleep, 1000
}



ExitApp



