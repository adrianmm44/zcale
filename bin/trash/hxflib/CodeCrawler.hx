/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib;

import sys.FileSystem;
import hxf.core.Registry;
import hxf.core.tools.PathTools;
import hxf.core.events.EventDispatcher;

import hxflib.codeCrawler.registry.CodeRegistry;
import hxflib.codeCrawler.elements.Module;

@:expose 
class CodeCrawler extends EventDispatcher
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var registry : CodeRegistry;
	
	public var useExternal( default, set ) : Bool;	
	public var haxeStdPath( default, set ) : String;
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : Registry )
	{
		super( this );
		
		registry = new CodeRegistry( reg );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function crawl( path : String ) : Void
	{
		if( FileSystem.isDirectory( path ) == false ) // checks if the path is a file
		{
			parse( path );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function parse( filePath : String ) : Void
	{
		//var id 	   	 : Float  = FileSystem.stat( filePath ).ctime.getTime();
				
		var module = new Module( registry, filePath );
		module.addEventListener( module.eventType().parsePackage, onParsePackage  );
		module.addEventListener( module.eventType().complete, 	  onParseComplete );		
		module.addEventListener( module.eventType().error,    	  onParseError 	  );
		module.parse();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onParsePackage( module : Module ) : Void // sets the project path
	{
		var fileDirPath : String = PathTools.directory( module.filePath );
		var mainDirPath	: String = StringTools.replace( module.pkg.packagePath, ".", "/" ) + "/";
		
		if( mainDirPath.length > 1 && 
			fileDirPath.substr( fileDirPath.length - mainDirPath.length ) == mainDirPath )
		{
			fileDirPath = fileDirPath.substr( 0, fileDirPath.length - mainDirPath.length );
		}
		
		registry.projectPath = fileDirPath;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onParseComplete( module : Module ) : Void
	{		
		dispatchEvent( eventType().complete );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onParseError( module : Module ) : Void
	{
		// adjust error message with line number and position
		
		//document.eventData().error.message = registry.docs.current.code.toString();
		
		dispatchError( module.eventData().error, this, "parse" );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function getModules() : Map<String,Module>
	{
		return registry.modules.getModules();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function set_useExternal( value : Bool ) : Bool
	{
		registry.macroInfo.useExternal = value;
		
		return useExternal = value;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function set_haxeStdPath( value : String ) : String
	{
		registry.haxeStdPath = value;
		
		return haxeStdPath = value;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////