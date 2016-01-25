package zcale.types.StringType;

abstract DynamicObject( Dynamic ) from Dynamic {
	
    @:extern public inline function new() {
	
		this = {};
	}	
    @:arrayAccess
    @:extern public inline function get( key : String ) : Dynamic {
	
		return Reflect.field( this, key );
	}	
	@:arrayAccess	    
	@:extern public inline function set( key : String, value : Dynamic ) : Void {
		
		Reflect.setField( this, key, value );
	}	
	@:extern public inline function keys() : Array<String> {
		
		return Reflect.fields( this );
	}	
	
    @:extern public inline function exists( key : String ) : Bool {
	
		return Reflect.hasField( this, key );
	}	
	@:extern public inline function remove( key : String ) : Bool {
		
		return Reflect.deleteField( this, key );
	}
}