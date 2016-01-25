/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxf.core.tools;

using hxf.core.tools.StringExtender;

class StringExtender
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function contains( source : String, str : String  ) : Bool
	{
		return ( source.indexOf( str ) > -1 );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
		
 	public static function removeFirstChar( str : String, ?char : String ) : String
	{
		if( char == null || str.substr( 0, 1 ) == char )
		{
			str = str.substr( 1 );
		}
		
		return str;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function removeLastChar( str : String, ?char : String ) : String
	{
		if( char == null || str.substr( -1 ) == char ) 
		{
			str = str.substr( 0, -1 );
		}

		return str;
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function toUpperCaseFirst( str : String ) : String
	{
		return str.substr( 0, 1 ).toUpperCase() + str.substr( 1 );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function toLowerCaseFirst( str : String ) : String
	{
		return str.substr( 0, 1 ).toLowerCase() + str.substr( 1 );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
 	
	public static function toCamelCase( str : String, ?breakChars : Array<String> ) : String
	{
		str = str.toLowerCase();
		
		if( breakChars == null ){
            breakChars = ["-"];
        }
			
        for( char in breakChars )
        {
        	if( str.contains( char ) == true )
            {
                var newString : String = "";
				
                for( strElement in str.split( char ) )
				{
                     newString += toUpperCaseFirst( strElement );
                }

        		str = newString;
            }
        }

		return toLowerCaseFirst( str );
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////