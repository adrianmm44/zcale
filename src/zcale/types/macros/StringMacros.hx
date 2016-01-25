package zcale.types.macros;

class StringMacros {
	
	macro public static function merge( expr : ExprOf<String> ) : ExprOf<String> {
		
		return macro $v{ haxe.macro.ExprTools.getValue( expr ) };
	}
}