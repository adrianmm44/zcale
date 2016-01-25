/////////////////////////////////////////////////////////////////////////////////////////////////////

package hxf.core.loaders;

class TextLoader 
#if flash
	extends hxf.core.loaders.textLoader.targets.FlashTextLoader
#elseif jquery
	extends hxf.core.loaders.textLoader.targets.JsTextLoader
#elseif js
	extends hxf.core.loaders.textLoader.targets.JsTextLoader
#elseif ( neko || php || macro )
	extends hxf.core.loaders.textLoader.targets.SystemTextLoader
#else
	#error "target unknown"
#end
#if debug
	implements hxf.core.loaders.interfaces.ILoader
#end
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new()
	{
		super( this );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////