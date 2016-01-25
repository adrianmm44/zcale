package zcale.types;

@:forward( length, insert, remove, iterator, toString )

abstract ArrayType<T>( Array<T> ) from Array<T> to Array<T> {
	
	@:extern private inline function new( a : Array<T> ) {
		
		this = a;
	}	
	@:extern public inline function first() : Null<T> {
		
		return this[ 0 ];
	}			
	@:extern public inline function last() : Null<T> {
		
		return this[ this.length - 1 ];
	}	
	@:extern public inline function add( x : T ) : Int {
		
		return this.push( x );
	}	
	@:extern public inline function addFront( x : T ) : Void {
		
		this.unshift( x );
	}		
	@:extern public inline function removeFirst() : Null<T> {
		
		return this.shift();
	}	
	@:extern public inline function removeLast() : Null<T> {
		
		return this.pop();
	}	
	@:extern public inline function combine( a : ArrayType<T> ) : ArrayType<T> {
		
		return this.concat( a );
	}	
	@:extern public inline function join( delimiter : String ) : String {
		
		return this.join( delimiter );
	}
}