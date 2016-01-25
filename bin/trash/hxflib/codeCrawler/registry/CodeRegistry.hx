/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.codeCrawler.registry;

import sys.FileSystem;
import hxf.core.Registry;
import hxflib.codeCrawler.elements.Module;
import hxflib.codeCrawler.registry.ModulesRegistry;
import hxflib.codeCrawler.registry.ElementInfo;

typedef MacroInfo = {
	useExternal : Bool
}

class CodeRegistry 
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var core 	   : Registry;	
	public var modules 	   : ModulesRegistry;
	public var elementInfo : ElementInfo;
	public var macroInfo   : MacroInfo;
	public var projectPath : String = "";
	public var haxeStdPath : String = '/usr/lib/haxe/std/'; // this path is on mac computer
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : Registry )
	{
		core 	  	= reg;
		modules 	= new ModulesRegistry();
		elementInfo = new ElementInfo();
		macroInfo 	= { useExternal : false };
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function getModulePath( filePath : String ) : String
	{
		filePath = filePath.substr( projectPath.length );
		filePath = StringTools.replace( filePath, "/", "." );
		
		return filePath.substr( 0, filePath.lastIndexOf(".") );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function getFilePath( modulePath : String ) : String
	{
		var relativePath = StringTools.replace( modulePath, ".", "/" ) + ".hx";
		
		if( FileSystem.exists( haxeStdPath + relativePath ) == true )
		{
			return haxeStdPath + relativePath;
		}
		else { 
			return projectPath + relativePath;
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////