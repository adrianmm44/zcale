package zcale.types.helpers;

class StringHelper {
	
	@:extern public static inline function trim( str : String ) : String {
		
		return StringTools.trim( str );
	}
	@:extern public static inline function ltrim( str : String ) : String {
		
		return StringTools.ltrim( str );
	}
	@:extern public static inline function rtrim( str : String ) : String {
		
		return StringTools.rtrim( str );
	}
	@:extern public static inline function replace( source : String, str : String, by : String ) : String {
		
		return StringTools.replace( source, str, by );
	}
	@:extern public static inline function startsWith( source : String, str : String ) : Bool {
		
		return StringTools.startsWith( source, str );
	}
	@:extern public static inline function endsWith( source : String, str : String ) : Bool {
		
		return StringTools.endsWith( source, str );
	}
	@:extern public static inline function contains( source : String, str : String  ) : Bool {
		
		return ( source.indexOf( str ) > -1 );
	}
	@:extern public static inline function firstChar( str : String ) : String {
		
		return str.substr( 0, 1 );
	}
	@:extern public static inline function lastChar( str : String ) : String {
		
		return str.substr( -1 );
	}
}