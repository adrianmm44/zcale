/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.core.events;

@:expose

class EventKeys
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var keys : Int = 0;
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function assignKey() : Int
	{
		return keys++;
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////