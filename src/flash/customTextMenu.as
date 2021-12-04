﻿import gfx.managers.FocusHandler;
import gfx.ui.InputDetails;
import gfx.ui.NavigationCode;
import gfx.controls.TextInput;
import Shared.GlobalFunc;
import flash.geom.Rectangle;

import skyui.defines.Input;

class customTextMenu extends MovieClip
{
	public var TextInputBox_mc:TextInput;
	public var actualTextBox:TextField;
	public var closeHint:TextField;
	public var fillColorProperty:Number;
	public var fillAlphaProperty:Number;

	public function customTextMenu()
	{
		super();
		actualTextBox = TextInputBox_mc.textFieldBox;
		closeHint = TextInputBox_mc.closeHint;
		fillColorProperty = 0x333333;
		fillAlphaProperty = 40;
		//drawRoundedRectangle(this, actualTextBox._height, actualTextBox._width, 10, 0x333333, 50);
		//drawCustomRectangle(200,200,200,200,0x333333,50);
	}

	public function onLoad()
	{
		super.onLoad();
		_visible = true;
		//TextInputBox_mc.textFieldBox.noTranslate = true;
		skse.AllowTextInput(true);
		trace(actualTextBox.text);
		setBoxParams(0,0,300,300);
	}

	public function handleInput(details:InputDetails, pathToFocus:Array):Boolean
	{
		//trace(details);
		//trace(pathToFocus);
		return false;
	}

	public function setBoxParams(boxX:Number, boxY:Number, boxWidth:Number, boxHeight:Number):Void
	{
		actualTextBox._x = boxX;
		actualTextBox._y = boxY;
		boxWidth > 0 ? actualTextBox._width = boxWidth : actualTextBox._width = 200;
		boxHeight > 0 ? actualTextBox._height = boxHeight : actualTextBox._height = 200;
		drawCustomRectangle(actualTextBox._x, actualTextBox._y, actualTextBox._width, actualTextBox._height, fillColorProperty, fillAlphaProperty);
		closeHint._x = (actualTextBox._x + actualTextBox._width - closeHint._width);
		closeHint._y = (actualTextBox._y + actualTextBox._height);
	}

	function drawCustomRectangle(startPosX:Number, startPosY:Number, rectangleWidth:Number, rectangleHeight:Number, fillColor:Number, fillAlpha:Number):Void
	{
		clear();
		beginFill(fillColor,fillAlpha);
		//lineStyle(5, 0xFF00FF, 100); // for testing
		moveTo(startPosX, startPosY);
		lineTo(startPosX + rectangleWidth,startPosY);
		lineTo(startPosX + rectangleWidth,startPosY + rectangleHeight);
		lineTo(startPosX,startPosY + rectangleHeight);
		lineTo(startPosX, startPosY);
		endFill();
	}

	function drawRoundedRectangle(target_mc:MovieClip, boxWidth:Number, boxHeight:Number, cornerRadius:Number, fillColor:Number, fillAlpha:Number):Void
	{
		with (target_mc)
		{
			beginFill(fillColor,fillAlpha);
			moveTo(cornerRadius,0);
			lineTo(boxWidth - cornerRadius,0);
			curveTo(boxWidth,0,boxWidth,cornerRadius);
			lineTo(boxWidth,cornerRadius);
			lineTo(boxWidth,boxHeight - cornerRadius);
			curveTo(boxWidth,boxHeight,boxWidth - cornerRadius,boxHeight);
			lineTo(boxWidth - cornerRadius,boxHeight);
			lineTo(cornerRadius,boxHeight);
			curveTo(0,boxHeight,0,boxHeight - cornerRadius);
			lineTo(0,boxHeight - cornerRadius);
			lineTo(0,cornerRadius);
			curveTo(0,0,cornerRadius,0);
			lineTo(cornerRadius,0);
			endFill();
		}
	}

}