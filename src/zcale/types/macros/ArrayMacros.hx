package zcale.macros;

import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Type;

class ArrayMacros {
	
	#if !build
			
	macro public static function merge<T>( e : ExprOf<Array<T>> ) : ExprOf<Array<T>> { // with special thanks to nadako who wrote this
	
		var typedExpr = Context.typeExpr( e ); // type given expression and returns it

        switch ( typedExpr.t ) { // checks resulting type
		
            case TInst( _.get() => { pack : [], name : "Array" }, _ ):
            default:
               	throw new Error( "Not an Array expression", e.pos );
        }
		
        var valuesExprs = [];
		
        function loop( e : TypedExpr ) { // loop through typed expression
		
            switch ( e.expr ) {			
                case TCall({ expr : TField( e1, FInstance( _, _.get() => { name : "concat"} ))}, [ e2 ] ): // a call to "concat" instance field                
					loop( e1 );
					loop( e2 );								
                case TArrayDecl( values ): // array declaration				
					for ( value in values ){
                    	valuesExprs.push( Context.getTypedExpr( value ));
					}				
                default:
					throw new Error("Invalid expression", e.pos );				
            }
        }		
        loop( typedExpr );
		
        return macro $a{ valuesExprs };
	}
	
	#else
	
	@:extern public static inline function merge<T>( array : Array<T> ) : Array<T> {
		
		return array;
	}
	
	#end
}