/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.codeCrawler.elements.types.classType;

// import hxf.core.tools.ClassTools;
// import hxf.core.tools.TextTools;
import hxflib.codeCrawler.CodeElement;
import hxflib.codeCrawler.interfaces.ICodeElement;


class Property extends CodeElement implements ICodeElement
{	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
		
	public function new( reg : Dynamic )
	{
		super( this, reg, "var" );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function newInstance() : ICodeElement
	{
		return new Property( registry );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	//
	public function tryToParse() : Void
	{
		var str : String = modules.current.code.readWord();
		
		if( str == keyword )
		{
			// registry.current.readPoint += registry.current.endIndexOf( keyword );						
			
			modules.current.code.index += modules.current.code.endIndexOf( keyword );
			
			dispatchEvent( eventType().complete );
		}
		else {
			dispatchEvent( eventType().parseNot );
		}
	}
	//
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
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////