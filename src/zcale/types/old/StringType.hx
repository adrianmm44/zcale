package zcale.types;

import zcale.types.helpers.StringHelper;

@:forward( length, substr, indexOf, lastIndexOf, split, toLowerCase, toUpperCase, toString )

abstract StringType( String ) from String to String
{
	@:extern 
	private inline function new( str : String )
	{
		this = str;
	}
	
	@:op( A + B )
	@:extern		
	private inline function add( str : String ) : StringType
	{
		return this + str;
	}
	
	@:extern 
	public inline function contains( str : String ) : Bool
	{
		return StringHelper.contains( this, str );
	}
	
	@:extern
	public inline function startsWith( str : String ) : Bool
	{
		return StringTools.startsWith( this, str );
	}
	
	@:extern
	public inline function endsWith( str : String ) : Bool
	{
		return StringTools.endsWith( this, str );
	}
	
	@:extern
	public inline function replace( str : String, by : String ) : StringType
	{
		return StringTools.replace( this, str, by );
	}
	
	@:extern
	public inline function firstChar() : StringType
	{
		return StringHelper.firstChar( this );
	}
	
	@:extern 
	public inline function lastChar() : StringType
	{
		return StringHelper.lastChar( this );
	}
}