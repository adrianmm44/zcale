/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.core.web.httpRemote.targets;

import zcale.core.Path;
import zcale.core.events.*;
import zcale.core.web.HttpRequest;
import zcale.core.web.httpRemote.CallData;
import zcale.core.web.httpRemote.Serialization;
import zcale.core.web.httpRemote.IHttpRemote;
import zcale.settings.MainSettings;
import zcale.settings.CoreSettings;

using zcale.core.events.AsyncData;

@:expose

class ClientHttpRemote<T:AsyncData> implements IHttpRemote<T>
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var eventData : T;
	public var eventKeys : AsyncKeys;	
	public var event 	 : AsyncDispatcher;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( eventData : T )
	{
		this.eventData = eventData;
		eventKeys = new AsyncKeys();
		event = new AsyncDispatcher( this, eventData );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function call( classPath : String, methodName : String, args : Array<Dynamic> ) : Void
	{
		var call : CallData = {
			classPath  : classPath,
			methodName : methodName,
			arguments  : args
		};
		
		var url = Path.rootPath + "?" + CoreSettings.varRemoteData + "=" + StringTools.urlEncode( Serialization.toString( call ));
		
		var http = new HttpRequest();
		http.event.addListener( http.eventKeys.complete, onCallComplete );
		http.event.addListener( http.eventKeys.error, 	 onCallError 	);
		http.request( url );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onCallComplete( http : HttpRequest ) : Void
	{
		// trace( http.eventData.result );
		
		eventData.fromObject( Serialization.toObject( http.eventData.result ) );
		
		if( eventData.eventKey == eventKeys.complete )
		{
			event.dispatch( eventKeys.complete );
		}
		else {
			event.dispatchError( eventData, this, "call" );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onCallError( http : HttpRequest ) : Void
	{
		event.dispatchError( http.eventData, this, "call" );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////