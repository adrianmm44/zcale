/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxf.core.registry.targets;

import haxe.Unserializer;
import hxf.core.registry.RegistryBase;

class FlashRegistry extends RegistryBase
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////

	public function new( sub : Dynamic )
	{
		super( sub );
		
		target.directory = "swf/";
		target.extension = ".swf";
				
		if( flash.Lib.current.root.loaderInfo.parameters.objectvars != null )
		{
			objectvars = Unserializer.run( flash.Lib.current.root.loaderInfo.parameters.objectvars );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////