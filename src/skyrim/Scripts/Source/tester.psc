Scriptname tester extends quest
{The documentation string.}

; code
event oninit()
    registerforkey(26)
endevent

event onkeydown(int keycode)
    ConsoleUtil.PrintMessage("onkeydown")
    if keycode == 26
        customTextBoxMenu_Script.OpenMenu(self as form)
    endif
endevent

event OnTextInputOpen(String asEventName, String asStringArg, Float afNumArg, Form akSender)
    ConsoleUtil.PrintMessage("OnTextInputOpen")
    if(asEventName == "CustomTextInputBox_1_textInputOpen")
        customTextBoxMenu_Script.SetData("poop butt ass", 100, 100, 500, 500)
    endif
endevent

event OnTextInputClose(String asEventName, String asStringArg, Float afNumArg, Form akSender)
    ConsoleUtil.PrintMessage("OnTextInputClose")
    If(asEventName == "CustomTextInputBox_1_textInputClose")
        ConsoleUtil.PrintMessage(asStringArg)
        customTextBoxMenu_Script.ReleaseMenu(self as form)
    endif
endevent
