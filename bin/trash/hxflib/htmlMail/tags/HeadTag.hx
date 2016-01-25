/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.htmlMail.tags;

import hxf.core.Css;
import hxf.core.dom.elements.Head;
import hxf.core.dom.element.interfaces.IElement;
import hxflib.htmlMail.HtmlRegistry;
import hxflib.htmlMail.Tag;

class HeadTag extends Tag
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var cssLinks : Iterator<Xml>;
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : HtmlRegistry )
	{
		super( this, reg );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	override private function setElement( node : Xml ) : Void
	{
		dom.head = dom.create.head();
		
		setTitle( node );
		setCss( node );
						
		domElement = dom.head;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function setTitle( node : Xml ) : Void
	{
		var title = node.elementsNamed("title");
		
		if( title.hasNext() == true )
		{
			var titleTag : Xml = title.next();
			
			dom.head.title  = titleTag.firstChild().nodeValue;
			node.removeChild( titleTag );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function setCss( node : Xml ) : Void
	{
		var styles = node.elementsNamed("style");
		var style  : Xml;
		var cssStr : String;
		var css    : Css;
				
		while( styles.hasNext() == true )
		{
			style  = styles.next();			
			cssStr = style.firstChild().nodeValue;
			css    = Css.parse( cssStr );
			
			for( selector in css.selectors().keys() )
			{
				dom.css.set( selector );
				
				for( property in css.selectors().get( selector ).keys() )
				{
					var value : String = css.selectors().get( selector ).get( property );
					
					dom.css.get( selector ).set( property, value );
				}
			}
						
			node.removeChild( style );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	private function qwdw() : Void
	{
		var loader = new TextLoader();
		loader.addEventListener( loader.eventType().complete, onComplete );
		loader.addEventListener( loader.eventType().error, 	  onError 	 );
		loader.load(  )
	}
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////