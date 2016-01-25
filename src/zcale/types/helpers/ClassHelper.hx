package zcale.types.helpers;

class ClassHelper {
	
	@:extern public static inline function getClassPath( instance : Dynamic ) : String {
		
		return Type.getClassName( Type.getClass( instance ));
	}
	
	@:extern public static inline function createInstance<T>( classPath : String, args : Array<Dynamic> ) : T {
		
		return Type.createInstance( Type.resolveClass( classPath ), args );
	}
}