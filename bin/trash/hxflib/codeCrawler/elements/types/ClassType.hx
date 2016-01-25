/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.codeCrawler.elements.types;

import hxflib.codeCrawler.elements.overall.Comment;
import hxflib.codeCrawler.elements.macro.IfElseMacro;
import hxflib.codeCrawler.elements.access.PublicAccess;
import hxflib.codeCrawler.elements.access.PrivateAccess;
import hxflib.codeCrawler.elements.access.StaticAccess;
import hxflib.codeCrawler.elements.access.OverrideAccess;
import hxflib.codeCrawler.elements.types.classType.Property;
import hxflib.codeCrawler.elements.types.linkedDocument.Extension;
import hxflib.codeCrawler.elements.types.linkedDocument.Implementation;
import hxflib.codeCrawler.elements.types.BodyElement;
import hxflib.codeCrawler.elements.types.BodyContent;
import hxflib.codeCrawler.interfaces.ICodeElement;

class ClassElement extends BodyElement implements ICodeElement
{		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : Dynamic )
	{
		super( this, reg, "class" );
		
		// openChar  = "{"; // temporary deactivated becasue ClassBody uses this as start indecation
		// closeChar = "}";,                             
		this.addPotentialElement( new Comment( 		   registry ) );
		this.addPotentialElement( new Property( 	   registry ) );
		this.addPotentialElement( new IfElseMacro( 	   registry ) );
		this.addPotentialElement( new BodyContent( 	   registry ) );
		this.addPotentialElement( new PublicElement(   registry ) );
		this.addPotentialElement( new PrivateElement(  registry ) );
		this.addPotentialElement( new StaticElement(   registry ) );
		this.addPotentialElement( new OverrideElement( registry ) );
		
		this.addPotentialElement( new Extension( 	   registry ) );
		this.addPotentialElement( new Implementation(  registry ) );
		
		
		//this.addPotentialElement( new BodyContent(    registry ) );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function newInstance() : ICodeElement
	{
		return new ClassElement( registry );
	}
				
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////