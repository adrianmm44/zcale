package zcale.macros;

import zcale.macros.regex.RegexPattern;
import zcale.macros.regex.RegexPatternBase;
import zcale.macros.regex.RegexOptions;
import zcale.types.macros.StringMacros;

class Regex
{
	public static var pattern( get, never ) : RegexPatternBase;
	public static var options( get, never ) : RegexOptions;
	
	@:extern
	private static inline function get_pattern() : RegexPatternBase
	{
		return new RegexPatternBase();
	}
	
	@:extern
	private static inline function get_options() : RegexOptions
	{
		return new RegexOptions();
	}
	
	@:extern
	public static inline function match( str : String, pattern : String, options : String = "" ) : Bool
	{		
		return new EReg( pattern, options ).match( str );
	}
	
	@:extern
	public static inline function replace( str : String, by : String, pattern : String, options : String = "" ) : String
	{
		return new EReg( pattern, options ).replace( str, by );
	}
}