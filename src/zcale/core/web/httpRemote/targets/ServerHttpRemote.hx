/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.core.web.httpRemote.targets;

import zcale.core.events.*;
import zcale.core.web.httpRemote.IHttpRemote;
import zcale.macros.ClassMacros;

class ServerHttpRemote<T:AsyncData> implements IHttpRemote<T>
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
		var cls : IHttpRemote<T>;
		var errorMessage = "";
		
		try {
			cls = ClassMacros.createInstance( classPath, [] );
			cls.event.addListener( cls.eventKeys.complete, onCallComplete );
			cls.event.addListener( cls.eventKeys.error,    onCallError    );
			
			try {
				Reflect.callMethod( cls, Reflect.field( cls, methodName ), args );
			}
			catch( error : Dynamic ){
				errorMessage = "Call method " + methodName + " failed in " + classPath;
			}
		} 
		catch( error : Dynamic ){
			errorMessage = "Not found class " + classPath;
		}
		
		if( errorMessage.length > 0 ){
			event.dispatchError( eventData, this, ClassMacros.getLocalMethod(), errorMessage );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onCallComplete( cls : IHttpRemote<T> ) : Void
	{		
		eventData = cls.eventData;
		event.dispatch( eventKeys.complete );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onCallError( cls : IHttpRemote<T> ) : Void
	{
		event.dispatchError( cls.eventData, this, "call" );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////