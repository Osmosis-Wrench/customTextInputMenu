import Shared.GlobalFunc;
import skyui.util.Tween;
import mx.utils.Delegate;
//import flash.events.Event;
import sharedFuncs;
import Components.DeltaMeter;
import skse;

class main_controller extends MovieClip
{
	/* INITIALIZATION */
	//public var lockpicks:Number;
	//public var boltContoller:MovieClip;
	//public var pickLable:TextField;
	public var canvas_mc: MovieClip;
	var percentage_delta_meter: Object;

	public function main_controller()
	{
		super();
		//lockPick_mc = _root.lockPick;
		var percentage_delta_meter = new DeltaMeter(_root.percentBar_DeltaMeter);
		percentage_delta_meter.SetPercent(50);
		//pickLable = _root.pickCount;
		//pickLable.text = String(lockpicks);
		

		this.onEnterFrame = function()
		{
			mainLoop();
		};
	}

	public function mainLoop()
	{
		
	}
}