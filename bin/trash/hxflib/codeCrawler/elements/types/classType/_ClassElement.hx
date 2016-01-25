/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.codeCrawler.elements.cls;

import hxflib.codeCrawler.CodeElement;

class ClassElement extends CodeElement
{	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var keywords : Array<String>;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( sub : Dynamic, reg : Dynamic, key : String )
	{
		super( sub, reg, key );
		
		keywords = [ "private", "public", "static", "inline", key ];
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function startsWithKeywords( char : String ) : Bool
	{
		var result : Bool = false;
		
		for( keyword in keywords )
		{
			if( char == keyword.substr( 0, 1 ) ){
				result = true;
				break;
			}
		}
		
		return result;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function tryToParse() : Void
	{
		var str : String = registry.current.readWord();
		
		/*/
		var str : String = registry.current.read( keyword.length );
				
		if( str == keyword )
		{
			registry.current.readPoint += registry.current.endIndexOf( keyword );
			
			// setClass();
		}
		else {
			dispatchEvent( eventType().parseNot );
		}
		/*/
	}
	
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function setClass() : Void
	{
		if( registry.current.indexOf("{") > -1 ) 	  // checks if the class is being opened
		{
			var classHeader : String = StringTools.trim( registry.current.readUntil("{"));
			
			registry.current.readPoint += registry.current.endIndexOf("{");
			
			setClassHeader( classHeader );
		}
		else {
			dispatchError( eventData().error, this, ClassTools.getLocalMethod(), "class is not opened with {" );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function setClassHeader( str : String ) : Void
	{
		if( TextTools.indexOfSpace( str ) > -1 )
		{
			dispatchError( eventData().error, this, ClassTools.getLocalMethod(), "is not programmed yet" );
		}
		else {
			className = str;
		}
		
		if( className.length > 0 )
		{
			parseStart();
		}
	}
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	public function toString() : String
	{
		return "";
	}
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////