/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.htmlMail.tags;

import hxf.core.dom.element.interfaces.IElement;
import hxflib.htmlMail.HtmlRegistry;
import hxflib.htmlMail.Tag;

class BodyTag extends Tag
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : HtmlRegistry )
	{
		super( this, reg );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	override private function setElement( node : Xml ) : Void
	{
		dom.body   = dom.create.body();		
		domElement = dom.body;
	}
			
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////