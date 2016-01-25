package zcale.types.chains;

import haxe.ds.StringMap;

@:forward( set )

abstract StringMapChain<T,V>( SMChain<T,V> ) {
		
	@:extern public inline function new( user : T, ?map : StringMap<V> ) {
		
		this = new SMChain( user, map );
	}
	@:extern public inline function get( key : String ) : Null<V> {
		
		return this.map.get( key );
	}	
	@:extern public inline function exists( key : String ) : Bool {
		
		return this.map.exists( key );
	}
	@:extern public inline function keys() : Iterator<String> {
		
		return this.map.keys();
	}
	@:extern public inline function iterator() : Iterator<V> {
		
		return this.map.iterator();
	}
	@:extern public inline function remove( key : String ) : Bool {
		
		return this.map.remove( key );
	}	
	@:extern public inline function toString() : String {
		
		return this.map.toString();
	}
}

class SMChain<T,V> {
	
	private var user : T;
	
	public var map : StringMap<V>;
	
	public function new( user : T, ?map : StringMap<V> ) {
		
		this.user = user;
		
		if( this.map == null ) {
			this.map = new StringMap();
		}
		else {
			this.map = map;
		}
	}		
	public function set( key : String, value : V ) : T {
		
		map.set( key, value );
		return user;
	}
}