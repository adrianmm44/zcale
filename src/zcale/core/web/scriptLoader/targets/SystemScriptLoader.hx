package zcale.core.web.scriptLoader.targets;

import zcale.core.events.*;
import zcale.core.web.scriptLoader.IScriptLoader;
import zcale.macros.ClassMacros;

using Lambda;
using StringTools;
using zcale.PathTools;
using zcale.macros.ArrayExtender;

class SystemScriptLoader implements IScriptLoader
{	
	public static var loadedScripts : Array<String> = [];
		
	private var filePath : String;
	
	public var eventKeys : AsyncKeys;
	public var eventData : AsyncData;
	public var event 	 : AsyncDispatcher;
		
	public function new()
	{
		eventKeys = new AsyncKeys();
		eventData = new AsyncData();
		event 	  = new AsyncDispatcher( this, eventData );
	}
		
	public function load( filePath : String ) : Void
	{
		if( loadedScripts.has( filePath ) == false )
		{
			var classPath : String 	 = filePath.removeLastElement().replace('/', '.');
			var cls : Class<Dynamic> = Type.resolveClass( classPath );
			
			if( Type.typeof( cls ) != TNull )
			{
				try{
					Reflect.callMethod( cls, Reflect.field( cls, "main"), [] );
				}
				catch( error : Dynamic ){}
				
				loadedScripts.add( filePath );
				event.dispatch( eventKeys.complete );
			}
			else {
				event.dispatchError( eventData, this, ClassMacros.getLocalMethod(), "Class not found: " + classPath );
			}
		}
		else {
			event.dispatch( eventKeys.complete );
		}
	}
}