import gfx.managers.FocusHandler;
import gfx.ui.InputDetails;
import gfx.ui.NavigationCode;
import gfx.controls.TextInput;
import Shared.GlobalFunc;
import skyui.components.ButtonPanel;

import skyui.defines.Input;

class customTextMenu extends MovieClip
{
	public var TextInputBox_mc:TextInput;
	public var actualTextBox:TextField;
	public var closeHint:TextField;
	public var fillColorProperty:Number;
	public var fillAlphaProperty:Number;
	public var buttonPanel_mc:ButtonPanel;

	public function customTextMenu()
	{
		super();
		actualTextBox = TextInputBox_mc.textFieldBox;
		closeHint = TextInputBox_mc.closeHint;
		buttonPanel_mc = TextInputBox_mc.buttonPanel_mc;
		fillColorProperty = 0x333333;
		fillAlphaProperty = 40;

	}

	public function onLoad()
	{
		super.onLoad();
		_visible = true;
		//TextInputBox_mc.textFieldBox.noTranslate = true;
		skse.AllowTextInput(true);
		trace(actualTextBox.text);

		Mouse.addListener(this);
		Key.addListener(this);

		gfx.managers.FocusHandler.instance.setFocus(actualTextBox.textField,0);
		actualTextBox.focused = true;
		Selection.setFocus(actualTextBox.textField);
		Selection.setSelection(0,0);

		setupTextBox("test",100,100,500);
		//updateButtons();
	}

	private function updateButtons():Void
	{
		var acceptControls:Object;
		var cancelControls:Object;

		buttonPanel_mc.clearButtons();
		var cancelButton = buttonPanel_mc.addButton({text:"Cancel", controls:cancelControls});
		var acceptButton = buttonPanel_mc.addButton({text:"Accept", controls:acceptControls});
		acceptButton.addEventListener("click",this,"onAcceptPress");
		cancelButton.addEventListener("click",this,"onCancelPress");
		buttonPanel_mc.updateButtons();
	}

	private function onAcceptPress():Void
	{
		exitMenu(false);
	}

	private function onCancelPress():Void
	{
		exitMenu(true);
	}

	private function exitMenu(canceled:Boolean):Void
	{
		trace("exit menu "+canceled);
		skse.AllowTextInput(false);
		skse.SendModEvent("CustomTextInputBox_1_textInputClose",actualTextBox.text,canceled ? 1 : 0);
		skse.CloseMenu("CustomMenu");
	}

	public function setupTextBox(initialText:String, boxX:Number, boxY:Number, boxWidth:Number, boxHeight:Number, fillColor:Number, fillOpacity:Number):Void
	{
		actualTextBox.text = initialText;
		fillColor == undefined ? fillColorProperty = 0x333333 : fillColorProperty = fillColor;
		fillOpacity == undefined ? fillAlphaProperty = 40 : fillAlphaProperty = fillOpacity;
		setBoxParams(boxX,boxY,boxWidth,boxHeight);
	}

	public function handleInput(details:InputDetails, pathToFocus:Array):Boolean
	{
		trace(details);
		trace(pathToFocus);

		var bHandledInput:Boolean = false;
		if (GlobalFunc.IsKeyPressed(details))
		{
			if (details.navEquivalent == NavigationCode.ENTER)
			{
				exitMenu(false);
				bHandledInput = true;
			}
			else if (details.navEquivalent == NavigationCode.TAB)
			{
				exitMenu(true);
				bHandledInput = true;
			}
		}

		if (bHandledInput)
		{
			return bHandledInput;
		}
		else
		{
			var nextClip = pathToFocus.shift();
			if (nextClip.handleInput(details, pathToFocus))
			{
				return true;
			}
		}

		return false;
	}

	public function setBoxParams(boxX:Number, boxY:Number, boxWidth:Number, boxHeight:Number):Void
	{
		actualTextBox._x = boxX;
		actualTextBox._y = boxY;
		boxWidth > 0 ? actualTextBox._width = boxWidth : actualTextBox._width = 200;
		boxHeight > 0 ? actualTextBox._height = boxHeight : actualTextBox._height = 200;
		drawCustomRectangle(actualTextBox._x,actualTextBox._y,actualTextBox._width,actualTextBox._height,fillColorProperty,fillAlphaProperty);
		closeHint._x = (actualTextBox._x + actualTextBox._width - closeHint._width);
		closeHint._y = (actualTextBox._y + actualTextBox._height);
	}

	function drawCustomRectangle(startPosX:Number, startPosY:Number, rectangleWidth:Number, rectangleHeight:Number, fillColor:Number, fillAlpha:Number):Void
	{
		clear();
		beginFill(fillColor,fillAlpha);
		//lineStyle(5, 0xFF00FF, 100); // for testing
		moveTo(startPosX,startPosY);
		lineTo(startPosX + rectangleWidth,startPosY);
		lineTo(startPosX + rectangleWidth,startPosY + rectangleHeight);
		lineTo(startPosX,startPosY + rectangleHeight);
		lineTo(startPosX,startPosY);
		endFill();
	}

}