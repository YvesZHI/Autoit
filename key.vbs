Set objShell = CreateObject("WScript.Shell")
Set args = Wscript.Arguments
For Each arg In args
  objShell.SendKeys arg
Next
objShell.SendKeys "{ENTER}"
