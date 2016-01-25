package zcale.macros.regex;

abstract RegexOptions( String )
{		
	public var insensitive( get, never ) : RegexOptions;
	public var globalReach( get, never ) : RegexOptions;
	public var multiline( 	get, never ) : RegexOptions;
	
	@:extern
	public inline function new( str : String = "" )
	{
		this = str;
	}
		
	@:extern
	private inline function get_insensitive() : RegexOptions
	{
		return new RegexOptions( this + "i" );
	}
	
	@:extern
	private inline function get_globalReach() : RegexOptions
	{
		return new RegexOptions( this + "g" );
	}
	
	@:extern
	private inline function get_multiline() : RegexOptions
	{
		return new RegexOptions( this + "m" );
	}
		
	@:extern
	public inline function toString() : String
	{
		return this;
	}
}