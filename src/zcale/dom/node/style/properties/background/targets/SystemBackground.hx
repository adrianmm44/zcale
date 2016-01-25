/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxf.core.dom.element.style.properties.background.targets;

import hxf.core.dom.element.targets.SystemElement;

class SystemBackground
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var color( default, set ) : String;
	
	private var element : SystemElement;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( element : SystemElement )
	{
		this.element = element;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function set_color( value : String ) : String
	{
		return color = value;
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////