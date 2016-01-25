package zcale.types;

import zcale.types.ChainType;

@:forward( set )

abstract IntChain<T>( ChainType<T,Int> ) {
	
	@:extern public var value( get, set ) : Int;
	
	@:extern public inline function new( user : T, value : Int = 0 )
	{
		this = new ChainType( user, value );
	}
		
	@:to
	@:extern private inline function get_value() : Int
	{
		return this.value;
	}
		
	@:extern private inline function set_value( v : Int ) : Int
	{
		return this.value = v;
	}
}