/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxf.core;

import hxf.core.tools.TextTools;

class Css
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var css : Map<String,Map<String,String>>;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( str : String )
	{
		setSelectors( str );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function parse( str : String ) : Css
	{
		while( str.indexOf("@charset") > -1 )
		{
			str = TextTools.removeByRef( str, "@charset", ";" );
		}
		
		while( str.indexOf("/*") > -1  && 
			   str.indexOf("*/") > -1 )
		{
			str = TextTools.removeByRef( str, "/*", "*/" );
		}
		
		return new Css( str );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function setSelectors( str : String ) : Void
	{
		css = new Map();
				
		var selector   : String;
		var properties : String;
		
		while( str.indexOf("{") > -1 && 
			   str.indexOf("}") > -1 )
		{
			selector   = str.substr( 0, str.indexOf("{") );
			properties = str.substr( 0, str.indexOf("}") );
			properties = properties.substr( str.indexOf("{") + 1 );
			
			for( currentSelector in selector.split(",") )
			{
				setProperties( currentSelector, properties );
			}
						
			str = str.substr( str.indexOf("}") + 1 );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function setProperties( selector : String, props : String ) : Void
	{
		css.set( selector, new Map() );
		
		var name  : String;
		var value : String;
		
		while( props.indexOf(":") > -1 && 
			   props.indexOf(";") > -1 )
		{
			name  = props.substr( 0, props.indexOf(":") );
			props = props.substr( 	 props.indexOf(":") + 1 );
			
			value = props.substr( 0, props.indexOf(";") );
			props = props.substr( 	 props.indexOf(";") + 1 );
			
			css.get( selector ).set( StringTools.trim( name  ), 
									 StringTools.trim( value ));
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function selectors() : Map<String,Map<String,String>>
	{
		return css;
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////