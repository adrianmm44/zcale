package zcale.types.mixed;

@:coreType
abstract IntOrString
	from Int to Int 
	from String to String {
			
	@:extern public inline function isInt() : Bool {
		
		return ( Std.is( this, Int ) );
	}
	
	@:extern public inline function isString() : Bool {
		
		return ( Std.is( this, String ) );
	}
}