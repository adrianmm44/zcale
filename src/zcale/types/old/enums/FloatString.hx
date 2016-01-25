package zcale.types.enums;

abstract FloatString( FloatStringEnum ) from FloatStringEnum to FloatStringEnum {
	
	@:from
	@:extern public static inline function fromFloat(  v : Float  ) : FloatString {
		
		return TFloat(  v );
	}
	
    @:from
 	@:extern public static inline function fromString( v : String ) : FloatString {
	
		return TString( v );
	}
}

enum FloatStringEnum {
	
	TFloat(  v : Float );
    TString( v : String );
}