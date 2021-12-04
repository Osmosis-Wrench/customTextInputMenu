class sharedFuncs extends MovieClip
{
	static function getRandom(minVal, maxVal): Number
	{
		return minVal + Math.floor(Math.random() * (maxVal + 1 - minVal));
	}
}