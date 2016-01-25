package zcale.core.boot.targets;

import js.Browser;
import zcale.settings.CoreSettings;
import zcale.core.events.*;
import zcale.core.boot.IBoot;
import zcale.core.boot.ITracer;
import zcale.core.patterns.ISingleton;

@:expose

class JsBoot implements IBoot implements ISingleton
{	
	public var printHtml : Bool = false;
	public var completed : Bool = false;	
	public var eventKeys : AsyncKeys;
	public var eventData : AsyncData;
	public var event 	 : AsyncDispatcher;
	public var tracer 	 : ITracer;
		
	private function new()
	{
		eventKeys = new AsyncKeys();
		eventData = new AsyncData();
		event 	  = new AsyncDispatcher( this, eventData );
	}
		
	public function boot( mainClass : Class<Dynamic> ) : Void
	{
		completed = true;		
		event.dispatch( eventKeys.complete );
	}
		
	public function trace( str : Dynamic ) : Void
	{
		Browser.document.getElementById( CoreSettings.idTraces ).innerHTML += '\n' + Std.string( str );
	}
}