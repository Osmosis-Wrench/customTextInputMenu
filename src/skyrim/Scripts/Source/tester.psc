Scriptname tester extends quest
{The documentation string.}

; code
event oninit()
    registerforkey(26)
endevent

event onkeydown(int keycode)
    ConsoleUtil.PrintMessage("test")
    UI.OpenCustomMenu("CustomTextInputBox/customTextInputMenu")
    ;if keycode == 26
    ;    customTextBoxMenu_Script.OpenMenu(self as form)
    ;    customTextBoxMenu_Script.SetData("test", 100, 100, 500, 500)
    ;endif
endevent