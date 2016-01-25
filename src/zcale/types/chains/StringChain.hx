package zcale.types.chains;

import zcale.types.ChainType;

@:forward( set, value )

abstract StringChain<T>( ChainType<T,String> ) {
	
	@:extern public inline function new( user : T, ?value : String ) {
		
		this = new ChainType( user, value );
	}
	
	@:op( A + B )
	@:extern private inline function add( str : String ) : String {
		
		return this.value + str;
	}
	
	@:extern public inline function isset() : Bool {
		
		return ( this.value != null );
	}
				
	@:to
	@:extern private inline function toString() : String {
		
		return this.value;
	}
}