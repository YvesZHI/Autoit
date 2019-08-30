#include <MsgBoxConstants.au3>
#include <File.au3>

Test()

Func Test()

;   If NOT WinExists ("DarkWars", "") Then
;	  MsgBox(0, "ERROR", "Window doesn't exist")
	  ;Return
;   EndIf

   IF @OSArch = 'x64' And Not @AutoItX64 Then
	  $partOfPath = "\Sysnative\"
   Else
	  $pathOfPath = '\System32\'
   EndIf

   $file1 = @WindowsDir & $partOfPath & "pscp.exe"
   If NOT FileExists($file1) Then
	  MsgBox(0, "ERROR", "The command pscp doesn't exist. You need to download a pscp.exe and put it into C:\Windows\System32\.")
   EndIf

   $file2 = @WindowsDir & $partOfPath & "plink.exe"
   If NOT FileExists($file2) Then
	  MsgBox(0, "ERROR", "The command plink doesn't exist. You need to download a plink.exe and put it into C:\Windows\System32\.")
   EndIf

   $file3 = @ScriptDir & "\project.info"
   If NOT FileExists($file3) Then
	  MsgBox(0, "ERROR", "You need to create a config file named project.info. Ask z00436880 to get more help.")
   EndIf
   ;;;;; project.info content ;;;;;;
   ; username
   ; IP
   ; password
   ; execute [this_cmd]
   ; execution time of [this_cmd]
   ; target_file
   ; cp [target_file] to [this_win_path]
   Local $info[_FileCountLines($file3)]
   For $i = 1 to _FileCountLines($file3)
	  $info[$i - 1] = FileReadLine($file3, $i)
   Next
   FileClose($file3)
   $info[2] = StringRegExpReplace($info[2], '(\#)', "{#}") ; special character must be surrounded by {}
   ;MsgBox(0, "ERROR", $info[2])

   Run('cmd.exe')
   WinWaitActive('管理员: C:\Windows\system32\cmd.exe')
   Send("{LSHIFT}" & "{ENTER}" & @WindowsDir & $partOfPath & "\plink.exe -pw " & $info[2] & " " & $info[0] & "@" & $info[1] & " " & $info[3] & " & timeout " & $info[4] & " & " & @WindowsDir & $partOfPath & "\pscp.exe -pw " & $info[2] & " " & $info[0] & "@" & $info[1] & ":" & $info[5] & " " & $info[6] & "{ENTER}" & "{ENTER}")


EndFunc
