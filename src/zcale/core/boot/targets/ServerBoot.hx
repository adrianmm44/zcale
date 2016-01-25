package zcale.core.boot.targets;

import haxe.ds.StringMap;
import zcale.Path;
import zcale.core.events.*;
import zcale.core.boot.IBoot;
import zcale.core.boot.ITracer;
import zcale.core.patterns.ISingleton;
import zcale.core.web.HttpRemote;
import zcale.core.web.httpRemote.CallData;
import zcale.core.web.httpRemote.Serialization;
import zcale.server.html.views.HtmlIndex;
import zcale.settings.MainSettings;
import zcale.settings.CoreSettings;

using StringTools;
using zcale.PathTools;
using zcale.core.events.AsyncData;
using zcale.macros.ArrayExtender;

class ServerBoot implements IBoot implements ISingleton
{	
	public var printHtml : Bool = true;
	public var completed : Bool = false;
	public var eventKeys : AsyncKeys;
	public var eventData : AsyncData;
	public var event 	 : AsyncDispatcher;
	public var tracer 	 : ITracer;
	
	private var index 	 : HtmlIndex;
		
	private function new()
	{
		eventKeys = new AsyncKeys();
		eventData = new AsyncData();
		event 	  = new AsyncDispatcher( this, eventData );
	}
		
	public function boot( mainClass : Class<Dynamic> ) : Void
	{
		if( completed == false ){
			index = new HtmlIndex();
			index.mainFilePath = '/' + Type.getClassName( mainClass ).replace('.', '/');
			index.title = index.mainFilePath.lastElement();
			tracer = index;
			
			init();
		}
		else {
			event.dispatch( eventKeys.complete );
		}
	}
	
	private function init() : Void
	{
		completed  = true;
		
		var params = Path.PARAMS;
		if( params.exists( CoreSettings.varRemoteData ) == true ){
			printHtml = false;
			remoteCall( params.get( CoreSettings.varRemoteData ) );
		}
		else if( params.exists( CoreSettings.varRunTarget ) == true )
		{
			switch( params.get( CoreSettings.varRunTarget ) )
			{
				case CoreSettings.runJsTarget:
					 index.target = HtmlIndex.jsTarget;					 
					 index.mainFilePath = MainSettings.jsOutputPath + index.mainFilePath + MainSettings.jsExtension;
				
				case CoreSettings.runFlashTarget: 
					 index.target = HtmlIndex.flashTarget;
					 index.mainFilePath = MainSettings.flashOutputPath + index.mainFilePath + MainSettings.flashExtension;
				
				case CoreSettings.runWebTargets: 
					 index.target = HtmlIndex.webTargets;
					
				default: event.dispatch( eventKeys.complete );
			}
		}
		else {
			event.dispatch( eventKeys.complete );
		}
		
		if( printHtml == true ){
			Sys.print( index.toString() );
		}
	}
		
	private function remoteCall( callData : String ) : Void
	{
		var call : CallData = Serialization.toObject( callData );
		
		var remote = new HttpRemote<Dynamic>( eventData );
		remote.event.addListener( remote.eventKeys.complete, onRemoteComplete );
		remote.event.addListener( remote.eventKeys.error, 	 onRemoteError    );
		remote.call( call.classPath, call.methodName, call.arguments );
	}
		
	private function onRemoteComplete( remote : HttpRemote<Dynamic> ) : Void
	{
		Sys.print( Serialization.toString( AsyncData.toObject( remote.eventData )));
	}
		
	private function onRemoteError( remote : HttpRemote<Dynamic> ) : Void
	{
		remote.event.error.addCrumb( this, "remoteCall");
					
		Sys.print( Serialization.toString( AsyncData.toObject( remote.eventData )));
	}
		
	public function trace( str : Dynamic ) : Void
	{
		tracer.trace( str );
	}
}