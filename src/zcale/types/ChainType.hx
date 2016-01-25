package zcale.types;

class ChainType<T,V> {
	
	private var user : T;
	
	public var value : V;
	
	public function new( user : T, ?value : V ) {
		
		this.user  = user;
		this.value = value;
	}
	
	public function set( v : V ) : T {
		
		value = v;
		return user;
	}
}