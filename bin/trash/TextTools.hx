/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxf.core.tools;

import haxe.macro.Expr;

class TextTools
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static var whiteSpaceChars : Array<String> = [ " ", "\t", "\n", "\r" ];
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function removeSuperfluousSpace( str : String ) : String
	{		
		for( spaceChar in whiteSpaceChars ) 						// loops through all whitespace characters
		{
			if( spaceChar != " " && str.indexOf( spaceChar ) > -1 ) // checks if str contains the current spacing character excluding the " " character
			{								
				str = StringTools.replace( str,  spaceChar, " " ); 	// replaces all occurences of the current space character with the " " character
			}
		}
		
		while( str.indexOf("  ") > -1 )								// while str contains double spaces it runs the following code
		{
			str = StringTools.replace( str, "  ", " " );			// replaces all occurences of double spaces by one space
		}
		
		return str;
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function indexOfChars( str : String, chars : Array<String>, startIndex : Int = 0 ) : Int
	{
		var index 	 	 : Int = -1;
		var currentIndex : Int;
		
		for( currentChar in chars )
		{
			currentIndex = str.indexOf( currentChar, startIndex );
			
			if( currentIndex > -1 )
			{
				if( index == -1 || currentIndex < index ){
					index = currentIndex;
				}
			}
		}
		
		return index;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function lastIndexOfChars( str : String, chars : Array<String> ) : Int
	{
		var index  		 : Int = -1;
		var currentIndex : Int;
		
		for( currentChar in chars )
		{
			currentIndex = str.lastIndexOf( currentChar );
						
			if( currentIndex > index )
			{
				index = currentIndex;
			}
		}
		
		return index;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function indexOfSpace( str : String, startIndex : Int = 0 ) : Int
	{
		return indexOfChars( str, whiteSpaceChars, startIndex );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function lastIndexOfSpace( str : String ) : Int
	{
		return lastIndexOfChars( str, whiteSpaceChars );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function wordWrap( str 		: String, 
									 length 	: Int, 
									 breakChars : String = "\n", 
									 cutWords 	: Bool 	 = false ) : String
	{
		var wrappedStr : String = ""; 
		var currentStr : String = "";
		var strPointer : Int 	= 0; 
		var wrapLength : Int 	= length;
		var spaceIndex : Int;
		
		if( length == 0 || cutWords == false ){
			wrapLength++;													 // increases the wrap length by 1 for a more accurate wrap positioning
		}
		
		while( strPointer < str.length )						  	  		 // loops while the string pointer is below the total lenght of the declared string
		{
			currentStr = str.substr( strPointer, wrapLength ); 	  			 // sets the current string according to the wrap length
			spaceIndex = lastIndexOfSpace( currentStr ); 	 				 // sets the last index of a whitespace character in the current string
			
			if( spaceIndex > 0 && 								  			 // checks if a whitespace character has been found and
				strPointer + wrapLength < str.length )			  	  		 // checks if the current string is not the last peace of the entire string
			{
				currentStr  = currentStr.substr( 0, spaceIndex ); 			 // shortens the current string until the last found whitespace character
				strPointer += spaceIndex;									 // increases the string pointer up until the next whitespace index
			}
			else if( cutWords == false )									 // checks if it's not allowed to cut a word in half
			{
				currentStr = str.substr( strPointer );						 // sets the remaining string
				spaceIndex = indexOfSpace( currentStr, 1 ); 				 // sets the first index of a whitespace character of the remaining string
				
				if( spaceIndex > 0 &&										 // checks if a whitespace character has been found and
					strPointer + wrapLength < str.length )					 // checks if the current string is not the last peace of string 
				{
					currentStr  = currentStr.substr( 0, spaceIndex );		 // shortens the current string until the first found whitespace character
					strPointer += spaceIndex;								 // increases the string pointer up until the next whitespace index
				}
				else {
					strPointer += currentStr.length;						 // increases the string pointer up until the end of the string
				}
			}
			else {															 // in this case the string is allowed to be cut in the current position
				strPointer += wrapLength ;								 	 // increases the string pointer up until the wrap length
			}
			
			wrappedStr += currentStr + breakChars;							 // adds the current string to the wrapped string with break characters
		}
				
		return wrappedStr.substr( 0, wrappedStr.lastIndexOf( breakChars ) ); // returns the wrapped string without the last break characters
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function unWrap( str : String, startChars : String, endChars : String ) : String
	{
		var startIndex : Int = str.indexOf( startChars );
		var endIndex   : Int = str.lastIndexOf( endChars );
				
		if( startIndex > -1 && endIndex > startIndex )
		{
			str = str.substr( startIndex + startChars.length, endIndex - startIndex - startChars.length );
		}
		
		return str;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function selectByRef( str : String, startChars : String, endChars : String ) : String
	{
		var startIndex : Int = str.indexOf( startChars );
		var endIndex   : Int = str.indexOf( endChars, startIndex + startChars.length );
		
		if( startIndex > -1 && endIndex > startIndex )
		{
			str = str.substr( startIndex, endIndex - startIndex + endChars.length );
		}
		
		return str;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function removeByRef( str : String, startChars : String, endChars : String ) : String
	{
		var startIndex : Int = str.indexOf( startChars );
		var endIndex   : Int = str.indexOf( endChars, startIndex + startChars.length );
		
		if( startIndex > -1 && endIndex > startIndex )
		{
			str = str.substr( 0, startIndex ) + str.substr( endIndex + endChars.length );
		}
		
		return str;
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function specialCharsEncode( str : String ) : String
	{
		if( str.indexOf("&") > -1 ){
			str = StringTools.replace( str, "&", "&amp;"); // encodes special characters
		}
		
		return str; 
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function specialCharsDecode( str : String ) : String
	{
		if( str.indexOf("&amp;") > -1 ){ 
			str = StringTools.replace( str, "&amp;", "&"); // decodes special characters
		}
		
		return str;
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////