/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxf.core.dom.element.style.properties;

class Background 
#if flash
	extends hxf.core.dom.element.style.properties.background.targets.FlashBackground
#elseif js
	extends hxf.core.dom.element.style.properties.background.targets.JsBackground
#elseif ( neko || php || macro )
	extends hxf.core.dom.element.style.properties.background.targets.SystemBackground
#else
	#error "target unknown"
#end
#if debug
	implements hxf.core.dom.element.style.properties.background.interfaces.IBackground
#end
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( element : Dynamic )
	{
		super( element );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////