package zcale.macros.regex;

import zcale.macros.regex.RegexPattern;

abstract RegexPatternBase( String )
{	
	public var anyChar( 	 get, never ) : RegexPattern;
	public var space( 		 get, never ) : RegexPattern;
	public var digit( 		 get, never ) : RegexPattern;
	public var alphaNum( 	 get, never ) : RegexPattern;
	
	public var not(			 get, never ) : RegexPattern;
	public var nonSpace( 	 get, never ) : RegexPattern;
	public var nonDigit( 	 get, never ) : RegexPattern;
	public var nonAlphaNum(  get, never ) : RegexPattern;
	
	public var startString(  get, never ) : RegexPattern;
	public var startWord( 	 get, never ) : RegexPattern;
	public var notStartWord( get, never ) : RegexPattern;	
	public var startGroup( 	 get, never ) : RegexPattern;
		
	@:extern
	public inline function new( str : String = "" )
	{
		this = str;
	}
		
	@:extern
	public inline function chars( chars : String ) : RegexPattern 
	{		
		return new RegexPattern( this + chars );
	}
	
	@:extern
	public inline function range( chars : String ) : RegexPattern
	{
		return new RegexPattern(  this + "[" + chars + "]" );
	}
	
	@:extern
	public inline function notRange( chars : String ) : RegexPattern
	{
		return new RegexPattern(  this + "[^" + chars + "]" );
	}
	
	@:extern
	private inline function get_anyChar() : RegexPattern
	{
		return new RegexPattern( this + "." );
	}
	
	@:extern
	private inline function get_space() : RegexPattern
	{
		return new RegexPattern( this + "\\s" );
	}
	
	@:extern
	private inline function get_digit() : RegexPattern
	{
		return new RegexPattern( this + "\\d");
	}
	
	@:extern
	private inline function get_alphaNum() : RegexPattern
	{
		return new RegexPattern( this + "\\w" );
	}
	
	@:extern
	private inline function get_not() : RegexPattern
	{
		return new RegexPattern( this + "!");
	}
	
	@:extern
	private inline function get_nonSpace() : RegexPattern
	{
		return new RegexPattern( this + "\\S" );
	}
	
	@:extern
	private inline function get_nonDigit() : RegexPattern
	{
		return new RegexPattern( this + "\\D");
	}
	
	@:extern
	private inline function get_nonAlphaNum() : RegexPattern
	{
		return new RegexPattern( this + "\\W");
	}
	
	@:extern
	private inline function get_startString() : RegexPattern
	{
		return new RegexPattern( this + "^" );
	}
	
	@:extern
	private inline function get_startWord() : RegexPattern
	{
		return new RegexPattern( this + "\\b" );
	}
	
	@:extern
	private inline function get_notStartWord() : RegexPattern
	{
		return new RegexPattern( this + "\\B" );
	}
	
	@:extern
	private inline function get_startGroup() : RegexPattern
	{
		return new RegexPattern( this + "(" );
	}
		
	@:extern
	public inline function toString() : String
	{
		return this;
	}
}