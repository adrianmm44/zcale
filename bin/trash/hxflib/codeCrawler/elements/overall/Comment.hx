/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.codeCrawler.elements.overall;

import hxflib.codeCrawler.CodeElement;
import hxflib.codeCrawler.interfaces.ICodeElement;

class Comment extends CodeElement implements ICodeElement
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var comment 	 : String = "";
	public var multiline : Bool   = false;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : Dynamic )
	{
		super( this, reg, "/" );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function newInstance() : ICodeElement
	{
		return new Comment( registry );
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function tryToParse() : Void
	{
		var str : String = modules.current.code.read( 2 );
		
		if( str == "//" )
		{
			modules.current.code.index += modules.current.code.endIndexOf( str );
			
			parseComment();
		}
		else if( str == "/*" )
		{
			modules.current.code.index += modules.current.code.endIndexOf( str );
			
			multiline = true;			
			parseMultilineComment();
		}
		else {
			dispatchEvent( eventType().parseNot );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function parseComment() : Void
	{
		if( modules.current.code.indexOf("\n") > -1 )
		{
			comment = modules.current.code.readUntil("\n");
		}
		else {
			comment = modules.current.code.read();
		}
		
		modules.current.code.index += modules.current.code.endIndexOf( comment );
			
		dispatchEvent( eventType().complete );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function parseMultilineComment() : Void
	{
		if( modules.current.code.indexOf("*/") > -1 )
		{
			comment = modules.current.code.readUntil("*/");
						
			modules.current.code.index += modules.current.code.endIndexOf("*/");
			
			dispatchEvent( eventType().complete );
		}
		else {
			dispatchError( eventData().error, this, "parseMultilineComment", "comment is not closed by */" );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public override function toString() : String
	{
		if( multiline == false )
		{
			return "\n" + "//" + comment;
		}
		else {
			return "\n" + "/*" + comment + "*/";
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////