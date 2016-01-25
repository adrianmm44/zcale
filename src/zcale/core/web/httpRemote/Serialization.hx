/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.core.web.httpRemote;

extern class Serialization 
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static inline function toObject( str : String ) : Dynamic
	{
		return haxe.Json.parse( str );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static inline function toString( obj : Dynamic ) : String
	{	
		return haxe.Json.stringify( obj );
	}
			
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////