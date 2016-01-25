package zcale.tools;

import haxe.ds.StringMap;
import zcale.types.ArrayType;

using zcale.tools.PathTools;
using zcale.types.helpers.StringHelper;

class PathTools {
	
	public static function firstElement( path : String, delimiter : String = "/" ) : String {
		
		path = path.removeFrontDelimiter( delimiter );
		
		if( path.contains( delimiter )) {
			path = path.substr( 0, path.indexOf( delimiter )); // gets the first element
		}						
		return path;
	}
	
	public static function lastElement( path : String, delimiter : String = "/" ) : String {
		
		path = path.removeEndDelimiter( delimiter );
		return path.substr( path.lastIndexOf( delimiter ) + 1 ); // gets the last element
	}
	
	public static function removeFirstElement( path : String, delimiter : String = "/" ) : String {
		
		path = path.removeFrontDelimiter( delimiter );
		
		if( path.contains( delimiter )) {
			path = path.substr( path.indexOf( delimiter )); // removes first element
						
			if( path == delimiter ) {
				path = "";
			}
		}
		else if( path.length > 0 ) {
			path = "";
		}
		return path;
	}
	
	public static function removeLastElement( path : String, delimiter : String = "/" ) : String {
		
		path = path.removeEndDelimiter( delimiter );		
		
		if( path.contains( delimiter )) {
			path = path.substr( 0, path.lastIndexOf( delimiter )); // removes last element
		}
		else if( path.length > 0 ) {
			path = "";
		}
		return path;
	}
	
	public static function removeFrontDelimiter( path : String, delimiter : String = "/" ) : String {
		
		if( path.firstChar() == delimiter ){ 
			path = path.substr( 1 );
		}
		return path;
	}
	
	public static function removeEndDelimiter( path : String, delimiter : String = "/" ) : String {
		
		if( path.lastChar() == delimiter ) {
			path = path.substr( 0, -1 );
		}
		return path;
	}
	
	public static function hasExtension( path : String, delimiter : String = "/" ) : Bool {
		
		return ( path.lastElement( delimiter ).contains("."));
	}
	
	public static function removeExtension( path : String, delimiter : String = "/" ) : String {
		
		if( path.hasExtension( delimiter )) {
			path = path.substr( 0, path.lastIndexOf("."));
		}
		return path;
	}
	
	public static function seekParentDir( path : String, dir : String, delimiter : String = "/" ) : String {
		
		if( dir.length > 0 && path.contains( dir )) {			
			return path.substr( 0, path.lastIndexOf( dir ) + dir.length );
		}
		else {
			return null; // if no directory is found the path resturns null
		}
	}
		
	public static function cleanPath( path : String, delimiter : String = "/" ) : String {
		
		var doubleDelimiter : String = delimiter + delimiter;
		
		while ( path.contains( doubleDelimiter )){
			path = path.replace( doubleDelimiter, delimiter ); // cleans path from double delimiters
		}
		return path;
	}
	
	public static function paramsToString( params : StringMap<String> ) : String {
		
		var  str = "";
		for ( key in params.keys() ) {
			str += key + "=" + params.get( key ) + "&";
		}
		if( str.length > 0 ) {
			str = str.substr( 0, -1 ); // removes the last &
		}
		return str;
	}
}