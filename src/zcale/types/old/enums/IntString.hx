package zcale.types.enums;

abstract IntString( IntStringEnum ) from IntStringEnum to IntStringEnum {
	
	@:from 
	@:extern public static inline function fromInt( v : Int  ) : IntString {
		
		return TInt( v );
	}
	
    @:from
	@:extern public static inline function fromString( v : String ) : IntString {
		
		return TString( v );
	}
}

enum IntStringEnum {
	
	TInt( v : Int );
    TString( v : String );
}