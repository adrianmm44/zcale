/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.htmlMail.tags;

import hxf.core.dom.element.interfaces.IElement;
import hxflib.htmlMail.HtmlRegistry;
import hxflib.htmlMail.Tag;

class ImgTag extends Tag
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : HtmlRegistry )
	{
		super( this, reg );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
		
	override public function setElement( node : Xml ) : Void
	{
		var src    : String = node.get("src");
		var alt    : String = node.get("alt");
		var width  : String = node.get("width");
		var height : String = node.get("height");
		
		var image = dom.create.image();
		
		setIdentifiers( image, node );		
		
		if( src != null ){
			image.src = src;
		}
		
		if( alt != null ){
			image.alt = alt;
		}
		
		if( width != null ){
			image.width = width;
		}
		
		if( height != null ){
			image.height = height;
		}
		
		domElement = image;
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////