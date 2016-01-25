package zcale.types.macros;

import haxe.macro.Expr;
import haxe.macro.Context;

using zcale.tools.PathTools;

class ClassMacros {
	
	macro public static function getLocalClass() : Expr {
		
		return Context.makeExpr( Context.getLocalClass().toString(), Context.currentPos() );
	}	
	macro public static function getLocalPackage() : Expr {
		
		return Context.makeExpr( Context.getLocalClass().toString().removeLastElement('.'), Context.currentPos() );
	}	
	macro public static function getLocalMethod() : Expr {
		
		return Context.makeExpr( Context.getLocalMethod(), Context.currentPos() );
	}	
	macro public static function getLocalArgs() : Expr { // with special thanks to jszymanski who wrote thiss
	
		var expr = Context.typeExpr( Context.parse( Context.getLocalMethod(), Context.currentPos() ));
		
		switch( expr ) {			
			case { t : TFun( args, _ ) } :			
				var a = [];
				for ( arg in args ){
					a.push( macro $i{ arg.name } );
				}
				return macro ( $a{ a } : Array<Dynamic> );
			default :
				return macro null;
		}
	}
}