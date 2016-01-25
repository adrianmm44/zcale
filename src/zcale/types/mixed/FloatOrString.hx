package zcale.types.mixed;

@:coreType 
abstract FloatOrString
	from Float to Float 
	from String to String {
	
	@:extern public inline function isFloat() : Bool {
		
		return ( Std.is( this, Float ) );
	}
		
	@:extern public inline function isString() : Bool {
		
		return ( Std.is( this, String ) );
	}
}