/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.codeCrawler.elements.types;

import hxflib.codeCrawler.CodeElement;
//import hxflib.codeCrawler.elements.overall.Comment;
//import hxflib.codeCrawler.elements.macro.IfElseMacro;
import hxflib.codeCrawler.interfaces.ICodeElement;

class Typedef extends CodeElement implements ICodeElement
{		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var name : String = "";
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : Dynamic )
	{
		super( this, reg, "typedef" );
		
		// openChar  = "{"; // temporary deactivated becasue ClassBody uses this as start indecation
		// closeChar = "}";
		//this.addPotentialElement( new Comment( 		registry ) );
		//this.addPotentialElement( new IfElseMacro( 	registry ) );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function newInstance() : ICodeElement
	{
		return new Typedef( registry );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function tryToParse() : Void
	{
		var str : String = modules.current.code.readWord();
		
		if( str == keyword )
		{
			syntax = "\n";
			
			if( registry.elementInfo.access.exists("private") == true ){
				registry.elementInfo.reset();
				syntax += "private ";
			}
			
			syntax += keyword + " ";
			modules.current.code.index += modules.current.code.endIndexOf( keyword );
				
			name 	= modules.current.code.readWord("=");			
			syntax += modules.current.code.readUntil( "}", true );
			modules.current.code.index += modules.current.code.endIndexOf("}");
			
			dispatchEvent( eventType().complete );
		}
		else {
			dispatchEvent( eventType().parseNot );
		}
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////