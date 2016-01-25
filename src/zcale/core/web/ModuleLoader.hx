/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.core.web;

import zcale.Modules;
import zcale.Path;
import zcale.core.events.*;
import zcale.core.events.interfaces.IAsyncDispatcher;
import zcale.core.web.ScriptLoader;
import zcale.settings.MainSettings;
import zcale.macros.ClassMacros;

using Lambda;
using zcale.PathTools;
using zcale.macros.ArrayExtender;
using zcale.macros.StringExtender;

@:expose

class ModuleLoader implements IAsyncDispatcher
{	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static var loadedModules : Array<String> = [];
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var modules : Array<String>;
	private var currentModule : String;
	
	public var eventKeys : AsyncKeys;
	public var eventData : AsyncData;
	public var event 	 : AsyncDispatcher;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new()
	{
		modules   = new Array();		
		eventKeys = new AsyncKeys();
		eventData = new AsyncData();
		event 	  = new AsyncDispatcher( this, eventData );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function exclude( classPath : String ) : Void
	{
		loadedModules.add( classPath );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function load( moduleSequence : Array<String> ) : Void
	{
		for( path in moduleSequence )
		{
			if( path.lastElement(".").firstChar().isUpperCase() == true && 
				path != Modules.getCore().first() && 
				loadedModules.has( path ) == false )
			{
				modules.add( path );
			}
		}		
		loadNextModule();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function loadNextModule() : Void
	{
		if( modules.length > 0 )
		{
			currentModule = modules.removeLast();
			
			#if modular
				var loader = new ScriptLoader();
				loader.event.addListener( loader.eventKeys.complete, onLoadComplete );
				loader.event.addListener( loader.eventKeys.error, 	 onLoadError );
				loader.load( MainSettings.targetOutputPath + currentModule.toDirPath() + MainSettings.targetExtension );
			#else
				executeModule( currentModule );
			#end
		}
		else {
			event.dispatch( eventKeys.complete );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function executeModule( classPath : String ) : Void
	{
		var cls : Class<Dynamic> = Type.resolveClass( classPath );
		
		if( Type.typeof( cls ) != TNull )
		{
			try{
				Reflect.callMethod( cls, Reflect.field( cls, "main"), [] );
			}
			catch( error : Dynamic ){}
						
			loadedModules.add( classPath );
			loadNextModule();
		}
		else {
			event.dispatchError( eventData, this, ClassMacros.getLocalMethod(), "Class not found: " + classPath );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onLoadComplete( loader : ScriptLoader ) : Void
	{
		loader.event.removeAllListeners();
		loadedModules.add( currentModule );
		loadNextModule();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onLoadError( loader : ScriptLoader ) : Void
	{
		loader.event.removeAllListeners();
		event.dispatchError( loader.eventData, this, "load" );
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////