#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

WinActivate("[CLASS:Chrome_WidgetWin_1]", "")

MouseClick($MOUSE_CLICK_LEFT, 2600, 470, 1, 1)
Send("name=$(echo '")
;sleep(200)

;MouseClickDrag($MOUSE_CLICK_LEFT, 2306, 260, 2560, 263)
;sleep(200)
MouseClick($MOUSE_CLICK_LEFT, 2724, 264, 3, 1)
Send("^c")
;sleep(200)

MouseClick($MOUSE_CLICK_RIGHT, 2600, 540, 1, 1)
;sleep(200)

MouseClick($MOUSE_CLICK_LEFT, 2636, 691, 1, 1)
;sleep(200)

Send("'|tr '-' '_')")
Send("{ENTER}")
Send("cd /data/bigo/log/$name")
Send("{ENTER}")
Send("cd /data/bigo/log/${{}name{}}_d")
Send("{ENTER}")
Send("tail -f *log | grep -i recoverall")
Send("{ENTER}")

#comments-start

name=$(echo "welog-groupmic-205-a-eu-848cdf5567-ftzkj" | awk -F- '{NF-=4;print $0}' | tr ' ' '-')


#comments-end
