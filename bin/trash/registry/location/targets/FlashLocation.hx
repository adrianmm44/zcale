/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxf.core.registry.location.targets;

import hxf.core.tools.PathTools;
import hxf.core.registry.location.LocationBase;

class FlashLocation extends LocationBase
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : Dynamic )
	{
		super( reg );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function update() : Void
	{
		updatePaths();
		
		if( registry.objectvars.runServer != true )
		{
			rootUrl	 = PathTools.removeLastDir( rootUrl  );
			rootPath = PathTools.removeLastDir( rootPath );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////