package zcale.build.project.fields;

import zcale.types.chains.StringChain;

@:forward

abstract DeadCodeElimination<T>( StringChain<T> ) {
	
	@:extern public inline function new( self : T ) {
		
		this = new StringChain( self );
	}
	
	@:extern public inline function std() : T {
		
		return this.set("-dce std");
	}
	
	@:extern public inline function full() : T {
		
		return this.set("-dce full");
	}
	
	@:extern public inline function no() : T {
		
		return this.set("-dce no");
	}
	
	@:to
	@:extern private inline function toString() : String {
		
		return this.value;
	}
}