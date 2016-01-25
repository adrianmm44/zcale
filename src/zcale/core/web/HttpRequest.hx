/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.core.web;

#if jquery
	import zcale.macro.js.JQ;
#else
	import haxe.Http;
#end

import zcale.core.events.*;

class RequestData extends AsyncData
{
	public var result : String;
}

@:expose

class HttpRequest 
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var eventKeys : AsyncKeys;
	public var eventData : RequestData;	
	public var event 	 : AsyncDispatcher;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new()
	{
		eventKeys = new AsyncKeys();
		eventData = new RequestData();
		event 	  = new AsyncDispatcher( this, eventData );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function request( url : String, post : Bool = false ) : Void
	{
		#if jquery
		
		var type = "GET";			
		if( post == true ){
			type = "POST";
		}		
		JQ.ajax({ url 	  : url, 
				  type    : type, 
				  success : onRequestComplete, 
				  error   : onRequestError });
		#else
		
		var http 	 = new Http( url );
		http.onData  = onRequestComplete;
		http.onError = onRequestError;
	    http.request( post );		
		
		#end
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onRequestComplete( str : String  ) : Void
	{
		eventData.result = str;
		event.dispatch( eventKeys.complete );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onRequestError( errorMessage : String ) : Void
	{
		event.dispatchError( eventData, this, "request", errorMessage );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////