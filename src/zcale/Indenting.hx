package zcale;

abstract Indenting( Int ) from Int to Int {
	
	@:extern public inline function new( i : Int = 0 ) {
		
		this = i;
	}
	
	@:extern public inline function add( i : Int ) : Int {
		
		return this = this + i;
	}
	
	@:op( A + B )
	@:extern private inline function sum( i : Int ) : Int {
		
		return this + i;
	}
	
	@:op(A++)
	@:extern public inline function incr() : Int { // increment
	
		return ++this;
	}
	
	@:op(A--)
	@:extern public inline function decr() : Int { // decrement
	
		return --this;
	}
	
	public function toString() : String {
		
		var str = "";
		for ( i in 0...this ) {
			str += "\t";
		}
		return str;
	}
}