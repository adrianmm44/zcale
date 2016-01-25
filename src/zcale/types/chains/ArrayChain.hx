package zcale.types.chains;

import zcale.types.ArrayType;

@:forward( add, addFront, insert )

abstract ArrayChain<T,X>( ArrayChainBase<T,X> ) {
	
	@:extern public var length( get, never ) : Int;
	
	@:extern public inline function new( user : T, ?array : ArrayType<X> ) {
		
		this = new ArrayChainBase( user, array );
	}	
	@:extern private inline function get_length() : Int {
		
		return this.array.length;
	}		
	@:extern public inline function first() : X {
		
		return this.array.first();
	}	
	@:extern public inline function last() : X {
		
		return this.array.last();
	}	
	@:extern public inline function remove( x : X ) : Bool {
		
		return this.array.remove( x );
	}	
	@:extern public inline function removeFirst() : Null<X> {
		
		return this.array.removeFirst();
	}	
	@:extern public inline function removeLast() : Null<X> {
		
		return this.array.removeLast();
	}	
	@:extern public inline function combine( a : ArrayType<X> ) : ArrayType<X> {
		
		return this.array.combine( a );
	}	
	@:extern public inline function join( delimiter : String ) : String {
		
		return this.array.join( delimiter );
	}		
	@:extern public inline function iterator() : Iterator<X> {
		
		return this.array.iterator();
	}	
	@:extern public inline function toString() : String {
		
		return this.array.toString();
	}	
	@:to
	@:extern private inline function toArray() : Array<X> {
		
		return this.array;
	}
}

class ArrayChainBase<T,X> {
	
	private var user : T;
	
	public var array : ArrayType<X>;
	
	public function new( user : T, ?a : ArrayType<X> ) {
		
		this.user = user;
		
		if( a == null ) {
			array = [];
		}
		else {
			array = a;
		}
	}
	/*/
	public function set( a : ArrayType<X> ) : T {
		
		array = a;
		return user;
	}
	/*/
	public function add( x : X ) : T {
		
		array.add( x );
		return user;
	}	
	public function addFront( x : X ) : T {
		
		array.addFront( x );
		return user;
	}	
	public function insert( pos : Int, x : X ) : T {
		
		array.insert( pos, x );
		return user;
	}
}