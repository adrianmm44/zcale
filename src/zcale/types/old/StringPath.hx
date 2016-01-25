package zcale.types;

import zcale.types.ArrayType;
import zcale.types.tools.PathTools;

@:forward

abstract String( StringType ) from StringType to StringType
{
	@:extern 
	private inline function new( path : String )
	{
		this = path;
	}
	
	@:op( A + B )
	@:extern		
	private inline function add( path : String ) : String
	{
		return this + path;
	}
	
	@:extern
	public inline function firstElement( delimiter : String = "/" ) : String
	{
		return PathTools.firstElement( this, delimiter );
	}
	
	@:extern
	public inline function lastElement( delimiter : String = "/" ) : String
	{
		return PathTools.lastElement( this, delimiter );
	}
	
	@:extern
	public inline function removeFirstElement( delimiter : String = "/" ) : String
	{
		return PathTools.removeFirstElement( this, delimiter );
	}
	
	@:extern
	public inline function removeLastElement( delimiter : String = "/" ) : String
	{
		return PathTools.removeLastElement( this, delimiter );
	}
	
	@:extern
	public inline function removeFrontDelimiter( delimiter : String = "/" ) : String
	{
		return PathTools.removeFrontDelimiter( this, delimiter );
	}
	
	@:extern
	public inline function removeEndDelimiter( delimiter : String = "/" ) : String
	{
		return PathTools.removeEndDelimiter( this, delimiter );
	}
	
	@:extern
	public inline function hasExtension( delimiter : String = "/" ) : Bool
	{
		return PathTools.hasExtension( this, delimiter );
	}
	
	@:extern
	public inline function removeExtension( delimiter : String = "/" ) : String
	{
		return PathTools.removeExtension( this, delimiter );
	}
	
	@:extern
	public inline function seekParentDir( dir : String, delimiter : String = "/" ) : String
	{
		return PathTools.seekParentDir( this, dir, delimiter );
	}
		
	@:extern 
	public inline function cleanPath( delimiter : String = "/" ) : String
	{
		return PathTools.cleanPath( this, delimiter );
	}
}