/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.core.web.scriptLoader.targets;

import js.Browser;
import js.html.ScriptElement;
import zcale.core.events.*;
import zcale.core.web.scriptLoader.IScriptLoader;

using Lambda;
using zcale.macros.ArrayExtender;

@:expose

class JsScriptLoader implements IScriptLoader
{	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static var loadedScripts : Array<String> = [];
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var filePath : String;
	
	public var eventKeys : AsyncKeys;
	public var eventData : AsyncData;
	public var event 	 : AsyncDispatcher;
			
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new()
	{
		eventKeys = new AsyncKeys();
		eventData = new AsyncData();
		event 	  = new AsyncDispatcher( this, eventData );
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function load( filePath : String ) : Void
	{
		if( loadedScripts.has( filePath ) == false )
		{
			this.filePath  = filePath;			
			var script : ScriptElement = cast( Browser.document.createElement("script"), ScriptElement );
			script.src	   = filePath;
			script.type    = "text/javascript";
			script.onload  = onLoadComplete;
			script.onerror = onLoadError;
			Browser.document.getElementsByTagName("head").item( 0 ).appendChild( script );
			// trace( filePath );
		}
		else {
			event.dispatch( eventKeys.complete );
		}
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onLoadComplete( data : String ) : Void
	{
		loadedScripts.add( filePath );
						
		event.dispatch( eventKeys.complete );
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onLoadError( errorMessage : Dynamic ) : Void
	{
		event.dispatchError( eventData, this, "load", "File not found: " + filePath );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////