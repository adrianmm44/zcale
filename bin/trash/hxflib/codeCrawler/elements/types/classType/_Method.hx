/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.codeCrawler.elements.cls;

import hxf.core.tools.ClassTools;
import hxf.core.tools.TextTools;
import hxflib.codeCrawler.CodeElement;
import hxflib.codeCrawler.interfaces.ICodeElement;

class Method extends CodeElement implements ICodeElement
{	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var keywords : Array<String>;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : Dynamic )
	{
		super( this, reg );
		
		keywords = [ "private", "public", "static", "inline", "override" ];
		
		addPotentialElement( new Comment( registry ) );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function newInstance() : ICodeElement
	{
		return new Method( registry );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public override function startsWith( char : String ) : Bool
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
		var str : String = registry.current.read( keyword.length );
				
		if( str == keyword )
		{
			registry.current.readPoint += registry.current.endIndexOf( keyword );
						
			// setClass();
		}
		else {
			dispatchEvent( eventType().parseNot );
		}
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
	
	public function toString() : String
	{
		return "";
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////