/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxf.core.system.mail.targets;

import hxf.core.tools.ClassTools;
import hxf.core.remote.RemoteCaller;
import hxf.core.remote.events.RemoteDispatcher;

class ClientMail extends RemoteDispatcher
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( sub : Dynamic, reg : Dynamic )
	{
		super( sub, reg );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function send( args : { to 	   	 : Array<String>, 
								   from    	 : String,
								   subject 	 : String,
								   htmlMsg	 : String,
								   ?cc     	 : Array<String>,
								   ?bcc    	 : Array<String>,
								   ?replyTo	 : String,
								   ?errorTo  : String,
								   ?priority : Int,
								   ?company  : String } ) : Void
	{
		var caller = new RemoteCaller( registry );
		caller.addEventListener( caller.eventType().complete, onSendComplete );
		caller.addEventListener( caller.eventType().error, 	  onSendError    );
		
		caller.call( ClassTools.getClassPath( subClass ), ClassTools.getLocalMethod(), [ args ] );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////

	private function onSendComplete( caller : RemoteCaller ) : Void
	{
		eventData().remoteData = caller.eventData().remoteData;
		
		dispatchEvent( eventType().complete );
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////

	private function onSendError( caller : RemoteCaller ) : Void
	{		
		dispatchError( caller.eventData().error, this, "send" );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////