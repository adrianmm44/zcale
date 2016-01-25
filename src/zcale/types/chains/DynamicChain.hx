package zcale.types;

import zcale.types.ChainType;

@:forward( set )

abstract DynamicChain<T>( ChainType<T,Dynamic> ) {
	
	@:extern public var value( get, set ) : Dynamic;
	
	@:extern public inline function new( user : T, ?value : Dynamic )
	{
		this = new ChainType( user, value );
	}
	
	@:to
	@:extern private inline function get_value() : Dynamic
	{
		return this.value;
	}
	
	@:extern private inline function set_value( v : Dynamic ) : Dynamic
	{
		return this.value = v;
	}
	
	@:extern public inline function isset() : Bool
	{
		return ( this.value != null );
	}
}