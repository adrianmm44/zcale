/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.codeCrawler.elements.types;

import hxflib.codeCrawler.elements.types.BodyElement;
import hxflib.codeCrawler.elements.types.BodyContent;
import hxflib.codeCrawler.elements.overall.Comment;
import hxflib.codeCrawler.elements.macro.IfElseMacro;
import hxflib.codeCrawler.interfaces.ICodeElement;

class EnumElement extends BodyElement implements ICodeElement
{	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : Dynamic )
	{
		super( this, reg, "enum" );
		
		// openChar  = "{"; // temporary deactivated becasue ClassBody uses this as start indecation
		// closeChar = "}";
		this.addPotentialElement( new Comment( 	   registry ) );
		this.addPotentialElement( new IfElseMacro( registry ) );
		this.addPotentialElement( new BodyContent( registry ) );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function newInstance() : ICodeElement
	{
		return new EnumElement( registry );
	}
			
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////