Scriptname customTextBoxMenu_Script extends Form
{CustomTextBoxMenu Version 1}

bool bMenuOpen
string sInitialText
string sInput

int Function getVersion()
    return 1
EndFunction

Function OpenMenu(Form akClient) Global
    akClient.RegisterForModEvent("CustomTextInputBox_1_textInputOpen", "OnTextInputOpen")
    akClient.RegisterForModEvent("CustomTextInputBox_1_textInputClose", "OnTextInputClose")
    UI.OpenCustomMenu("CustomTextInputBox/customTextInputMenu")
EndFunction

Function ReleaseMenu(Form akClient) Global
	akClient.UnregisterForModEvent("CustomTextInputBox_1_textInputOpen")
	akClient.UnregisterForModEvent("CustomTextInputBox_1_textInputClose")
EndFunction

bool Function SetData(String asInitialText = "", int BoxPosX = 0, int BoxPosY = 0, int BoxWidth = 200, int BoxHeight = 200, int fontSize = 10, int bgfillColor = 0x333333, int bgfillOpacity = 40) Global
    int i = UICallback.Create("CustomMenu", "_root.customTextMenu_mc.setupTextBox")
    if (i)
        UICallback.pushString(i, asInitialText)
        UICallback.pushInt(i, BoxPosX)
        UICallback.pushInt(i, BoxPosY)
        UICallback.pushInt(i, BoxWidth)
        UICallback.pushInt(i, BoxHeight)
        UICallback.pushInt(i, fontSize)
        UICallback.pushInt(i, bgfillColor)
        UICallback.pushInt(i, bgfillOpacity)
        if UiCallback.Send(i)
            return true
        endif
    endif
    return false
EndFunction
