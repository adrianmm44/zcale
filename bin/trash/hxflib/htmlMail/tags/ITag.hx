/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.htmlMail.tags;

import hxf.core.dom.element.interfaces.IElement;
import hxflib.htmlMail.HtmlRegistry;
import hxflib.htmlMail.Tag;

class ITag extends Tag
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : HtmlRegistry )
	{
		super( this, reg );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
		
	override public function setElement( node : Xml ) : Void
	{
		var italicText = dom.create.italicText();
		
		setIdentifiers( italicText, node );
		
		domElement = italicText;
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////