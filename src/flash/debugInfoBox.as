class debugInfoBox extends MovieClip
{

	/* INITIALIZATION */
	public var pin1_locked:TextField;
	public var pin2_locked:TextField;
	public var pin3_locked:TextField;
	public var pin4_locked:TextField;
	public var pin5_locked:TextField;

	public var pin1_hitFrames:TextField;
	public var pin2_hitFrames:TextField;
	public var pin3_hitFrames:TextField;
	public var pin4_hitFrames:TextField;
	public var pin5_hitFrames:TextField;

	public var pin1_hitBoxActive:TextField;
	public var pin2_hitBoxActive:TextField;
	public var pin3_hitBoxActive:TextField;
	public var pin4_hitBoxActive:TextField;
	public var pin5_hitBoxActive:TextField;

	public function debugInfoBox()
	{
		super();
		updateDebug();
		this.onEnterFrame = function()
		{
			updateDebug();
		};
	}

	function updateDebug()
	{
		checkPin(_root.pin1.pinSet,pin1_locked);
		checkPin(_root.pin2.pinSet,pin2_locked);
		checkPin(_root.pin3.pinSet,pin3_locked);
		checkPin(_root.pin4.pinSet,pin4_locked);
		checkPin(_root.pin5.pinSet,pin5_locked);
		pin1_hitFrames.text = String(_root.pin1.hitFrames);
		pin2_hitFrames.text = String(_root.pin2.hitFrames);
		pin3_hitFrames.text = String(_root.pin3.hitFrames);
		pin4_hitFrames.text = String(_root.pin4.hitFrames);
		pin5_hitFrames.text = String(_root.pin5.hitFrames);
		checkHitBox(_root.pin1.hitBoxActive,pin1_hitBoxActive);
		checkHitBox(_root.pin2.hitBoxActive,pin2_hitBoxActive);
		checkHitBox(_root.pin3.hitBoxActive,pin3_hitBoxActive);
		checkHitBox(_root.pin4.hitBoxActive,pin4_hitBoxActive);
		checkHitBox(_root.pin5.hitBoxActive,pin5_hitBoxActive);
	}

	function checkHitBox(hitBoxActive, pinLable)
	{
		if (hitBoxActive)
		{
			pinLable.text = "TRUE";
			pinLable.textColor = 0x4DEE7E;
		}
		else
		{
			pinLable.text = "FALSE";
			pinLable.textColor = 0xFF384D;
		}
	}

	function checkPin(pinSet, pinLable)
	{
		if (pinSet)
		{
			pinLable.text = "SET";
			pinLable.textColor = 0x4DEE7E;
		}
		else
		{
			pinLable.text = "UNSET";
			pinLable.textColor = 0xFF384D;
		}
	}
}