/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.core.web.scriptLoader.targets;

import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.display.Loader;
import flash.net.URLRequest;
import flash.system.LoaderContext;
import flash.system.ApplicationDomain;
import zcale.core.events.*;
import zcale.core.web.scriptLoader.IScriptLoader;

using Lambda;
using zcale.macros.ArrayExtender;

class FlashScriptLoader implements IScriptLoader
{		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static var loadedScripts : Array<String> = [];
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var filePath : String;
	private var loader 	 : Loader;
	
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
			this.filePath = filePath;			
			var url 	  = new URLRequest( filePath );
			var context   = new LoaderContext( false, ApplicationDomain.currentDomain, null );
			
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener( Event.COMPLETE, 		  onLoadComplete );
			loader.contentLoaderInfo.addEventListener( IOErrorEvent.IO_ERROR, onLoadError 	 );
			loader.load( url, context );
		}
		else {
			event.dispatch( eventKeys.complete );
		}
	}
					
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onLoadComplete( evt : Event ) : Void 
	{				
		loader.contentLoaderInfo.removeEventListener( Event.COMPLETE, 		 onLoadComplete );
		loader.contentLoaderInfo.removeEventListener( IOErrorEvent.IO_ERROR, onLoadError 	);
		
		loadedScripts.add( filePath );
			
		event.dispatch( eventKeys.complete );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onLoadError( evt : IOErrorEvent ) : Void
	{
		loader.contentLoaderInfo.removeEventListener( Event.COMPLETE, 		 onLoadComplete );
		loader.contentLoaderInfo.removeEventListener( IOErrorEvent.IO_ERROR, onLoadError    );
		
		event.dispatchError( eventData, this, "load", evt.text + " File not found: " + filePath );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////