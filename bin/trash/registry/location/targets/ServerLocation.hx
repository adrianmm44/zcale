/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxf.core.registry.location.targets;

import hxf.core.tools.PathTools;
import hxf.core.registry.ObjectVars;
import hxf.core.registry.location.LocationBase;

class ServerLocation extends LocationBase
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
		
		var objectvars : Array<String> = PathTools.directories( relativePath );
		
		switch( objectvars[ 0 ] )
		{
			case ObjectVars.TEST_TARGETS :
			
				 registry.objectvars.testTargets = true;
				 relativePath = PathTools.removeFirstDir( relativePath );
			
			case ObjectVars.RUN_FLASH : 
			
				 registry.objectvars.runFlash = true;
				 relativePath = PathTools.removeFirstDir( relativePath );
			
			case ObjectVars.RUN_JS : 
			
				 registry.objectvars.runJs = true;
				 relativePath = PathTools.removeFirstDir( relativePath );
			
			default :
				 registry.objectvars.runServer = true;
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////