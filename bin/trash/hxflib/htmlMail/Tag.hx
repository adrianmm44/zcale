/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.htmlMail;

import hxf.core.Dom;
import hxf.core.dom.element.interfaces.IElement;
import hxf.core.dom.element.content.interfaces.IContent;
import hxf.core.events.EventDispatcher;
import hxf.core.tools.TextTools;
import hxflib.htmlMail.HtmlRegistry;
import hxflib.htmlMail.Tags;

class Tag extends EventDispatcher
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var registry 	 : HtmlRegistry;	
	private var dom 		 : Dom;
	private var domElement 	 : IElement;	
	private var nodeIterator : Iterator<Xml>;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( sub : Dynamic, reg : HtmlRegistry )
	{
		super( sub );
		
		registry = reg;
		dom 	 = reg.dom;
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function parse( node : Xml ) : Void
	{
		setElement( node );
		
		if( domElement != null )
		{
			nodeIterator = node.iterator();			
			parseNextChild();
		}
		else {
			dispatchError( eventData().error, subClass, "parse", "domElement not defined in " + node.nodeName );
		}		
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function parseNextChild() : Void
	{
		if( nodeIterator.hasNext() == true )
		{
			var node : Xml = nodeIterator.next();
						
			if( node.nodeType == Xml.Element )
			{
				var cls : Class<Tag> = Tags.get( node.nodeName );												
				
				if( cls != null )
				{
					var tag : Tag = Type.createInstance( cls, [ registry ] );
					tag.addEventListener( tag.eventType().complete, onParseChildComplete );
					tag.addEventListener( tag.eventType().error, 	onParseChildError 	 );
					tag.parse( node );
				}
				else {
					dispatchError( eventData().error, subClass, "parseNextChild", node.nodeName + " is not a valid element" );
				}
			}
			else if( node.nodeType == Xml.PCData || 
					 node.nodeType == Xml.CData )
			{
				var text = StringTools.trim( node.nodeValue );				
				
				if( text.length > 0 ){
					text = TextTools.removeSuperfluousSpace( text );
					text = TextTools.specialCharsDecode( text );					
					domElement.append( String( text ) );
				}
				
				parseNextChild();
			}
			else {
				parseNextChild();
			}
		}
		else {
			dispatchEvent( eventType().complete );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onParseChildComplete( tag : Tag ) : Void
	{
		domElement.append( Element( tag.getElement() ) );
				
		parseNextChild();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onParseChildError( tag : Tag ) : Void
	{
		dispatchError( tag.eventData().error, subClass, "parse" );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function getElement() : IElement
	{
		return domElement;
	}	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function setElement( node : Xml ) : Void
	{
		// needs to be overridden for element specific functionality
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function setIdentifiers( content : IContent, node : Xml ) : Void
	{
		var id 	: String = node.get("id");
		var cls : String = node.get("class");
		
		if( id != null ){
			content.id = id;
		}
		
		if( cls != null ){
			content.cls = cls;
		}
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////