package zcale.types.chains;

import zcale.types.ChainType;

@:forward( set )

abstract FloatChain<T>( ChainType<T,Float> ) {
	
	@:extern public var value( get, set ) : Float;
	
	@:extern public inline function new( user : T, value : Float = 0 )
	{
		this = new ChainType( user, value );
	}
	
	@:to
	@:extern private inline function get_value() : Float
	{
		return this.value;
	}
	
	@:extern private inline function set_value( v : Float ) : Float
	{
		return this.value = v;
	}
}