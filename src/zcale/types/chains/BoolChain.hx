package zcale.types.chains;

import zcale.types.ChainType;

@:forward( set )

abstract BoolChain<T>( ChainType<T,Bool> ) {
	
	@:extern public var value( get, set ) : Bool;
	
	@:extern public inline function new( user : T, value : Bool = false )
	{
		this = new ChainType( user, value );
	}
	
	@:to
	@:extern private inline function get_value() : Bool
	{
		return this.value;
	}
	
	@:extern private inline function set_value( v : Bool ) : Bool
	{
		return this.value = v;
	}
	
	@:extern public inline function isTrue() : Bool
	{
		return ( this.value );
	}
	
	@:extern public inline function isFalse() : Bool
	{
		return ( ! this.value );
	}
}