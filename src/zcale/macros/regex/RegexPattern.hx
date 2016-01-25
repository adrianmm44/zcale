package zcale.macros.regex;

import zcale.macros.regex.RegexPatternBase;

@:forward
abstract RegexPattern( RegexPatternBase )
{	
	public var or( 			get, never ) : RegexPattern;
	public var oneOrNone(   get, never ) : RegexPattern;
	public var oneOrMore(   get, never ) : RegexPattern;
	public var zeroOrMore(  get, never ) : RegexPattern;
	
	public var endWord( 	get, never ) : RegexPattern;
	public var notEndWord(  get, never ) : RegexPattern;
	public var endString(   get, never ) : RegexPattern;
	public var endGroup(    get, never ) : RegexPattern;
	public var repeatGroup( get, never ) : RegexPattern;
	
	@:extern
	public inline function new( str : String )
	{
		this = new RegexPatternBase( str );
	}
		
	@:extern
	public inline function repeat( times : String ) : RegexPattern
	{
		return new RegexPattern( this.toString() + "{" + times + "}" );
	}
		
	@:extern
	private inline function get_or() : RegexPattern
	{
		return new RegexPattern( this.toString() + "|" );
	}
	
	@:extern
	private inline function get_oneOrNone() : RegexPattern
	{
		return new RegexPattern( this.toString() + "?");
	}
	
	@:extern
	private inline function get_oneOrMore() : RegexPattern
	{
		return new RegexPattern( this.toString() + "+");
	}
	
	@:extern
	private inline function get_zeroOrMore() : RegexPattern
	{
		return new RegexPattern( this.toString() + "*" );
	}
		
	@:extern
	private inline function get_endWord() : RegexPattern
	{
		return new RegexPattern( this.toString() + "\\b" );
	}
	
	@:extern
	private inline function get_notEndWord() : RegexPattern
	{
		return new RegexPattern( this.toString() + "\\B" );
	}
	
	@:extern
	private inline function get_endString() : RegexPattern
	{
		return new RegexPattern( this.toString() + "$" );
	}
	
	@:extern
	private inline function get_endGroup() : RegexPattern
	{
		return new RegexPattern( this.toString() + ")" );
	}
	
	@:extern
	private inline function get_repeatGroup() : RegexPattern
	{
		return new RegexPattern( this.toString() + "\\1" );
	}		
}