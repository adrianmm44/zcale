package zcale.types.mixed;

@:coreType 
abstract StringOrArray
	from Array<String> to Array<String>
	from String to String {
	
	@:extern public inline function isArray() : Bool {

		return ( Std.is( this, Array ) );
	}
	
	@:extern public inline function isString() : Bool {
		
		return ( Std.is( this, String ) );
	}
	
	@:extern public inline function toArray() : Array<String> {
		
		return this;
	}
	
	@:extern public inline function toString() : String {
		
		return this;
	}
}