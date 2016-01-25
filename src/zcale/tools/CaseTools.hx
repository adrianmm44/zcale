package zcale.tools;

import haxe.macro.Expr;
import haxe.macro.Context;
import zcale.macros.Regex;

using zcale.tools.CaseTools;

class CaseTools {
	
	@:extern public static inline function toUpperCaseFirst( str : String ) : String {
		
		return str.substr( 0, 1 ).toUpperCase() + str.substr( 1 );
	}
	
	@:extern public static inline function toLowerCaseFirst( str : String ) : String {
		
		return str.substr( 0, 1 ).toLowerCase() + str.substr( 1 );
	}
	
	macro public static function isUpperCase( str : ExprOf<String> ) : ExprOf<Bool> {
		
		var pattern = Regex.pattern.startString.range("A-Z").oneOrMore.endString;
		
		return macro zcale.macros.Regex.match( $e{ str }, $v{ pattern.toString() });
	}
	
	macro public static function isLowerCase( str : ExprOf<String> ) : ExprOf<Bool> {
		
		var pattern = Regex.pattern.startString.range("a-z").oneOrMore.endString;
		
		return macro zcale.macros.Regex.match( $e{ str }, $v{ pattern.toString() });
	}
		
	public static function indexOfUpperCase( str : String ) : Int {
		
		var regex = new EReg( Regex.pattern.range("A-Z").toString(), "" );
		if( regex.match( str )){
			return regex.matchedPos().pos;
		}
		else{
			return -1;
		}
	}
	
	public static function toSpinalCase( str : String ) : String {
		
      	str = str.toLowerCaseFirst();		
		
		var pos : Int = str.indexOfUpperCase();		
		while( pos > -1 ){
			str = str.substr( 0, pos ) + "-" + str.substr( pos ).toLowerCaseFirst();
			pos = str.indexOfUpperCase();
		}
		return str;
    }
	/*/
	macro public static function isUpperCase( str : ExprOf<String> ) : ExprOf<Bool>
	{
		var pattern = Regex.pattern.startString.range("A-Z").oneOrMore.endString;
		
		return macro zcale.macros.Regex.match( $e{ str }, $v{ pattern.toString() });
	}
	/*/
	/*/
	public static function toCamelCase( $str, $delimiter = '-' )
    {
        if( strpos( $str, $delimiter ) !== false )
        {
            $newString = '';
            foreach( explode( $delimiter, $str ) as $strElement )
            {
                $newString .= ucfirst( $strElement );
            }
            $str = $newString;
        }
        else{
            $str = ucfirst( $str );
        }
        return $str;
    }

    public static function toMixedCase( $str, $delimiter = '-' )
    {
        return lcfirst( self::toCamelCase( $str, $delimiter ));
    }

    public static function toSnakeCase( $str )
    {
        $str = lcfirst( $str );

        while( preg_match('/[A-Z]/', $str ))
        {
            preg_match('/[A-Z]/', $str, $matches, PREG_OFFSET_CAPTURE );

            $pos = $matches[ 0 ][ 1 ]; // gets the position of the current uppercase letter
            $str = substr( $str, 0, $pos ) . '_' . lcfirst( substr( $str, $pos )); // changes the uppercase letter to snake case
        }
        return $str;
    }
	/*/
}