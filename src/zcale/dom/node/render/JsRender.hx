/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.dom.node.render;

import zcale.Dom;
import zcale.dom.global.DomData;
import zcale.dom.node.ChildNode;
import zcale.dom.node.ElderNode;
import zcale.dom.node.TextNode;

@:access( zcale.dom.node.ChildNode )

class JsRender<T:ChildNode<T>>
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var dom : Dom;
	
	public var useIndenting   : Bool;
	public var increaseIndent : Bool = true;
	public var indentCloseTag : Bool = true;
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( ids : Array<Int> )
	{
		this.dom  	 = DomData.getInstanceById( ids ).dom;
		useIndenting = dom.data.useIndenting;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function renderChildNode( node : ChildNode<T> ) : String
	{
		/*/
		var html = "";
		if( useIndenting == true ){
			html = "\n" + dom.data.currentNode.getIndent();
		}
		return  html + "<" + node.name + node.attrs.render() + "/>";
		/*/
		
		return null;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function renderElderNode( node : ElderNode<T> ) : String
	{
		/*/
		var html = "";
		if( useIndenting == true ){
			html = "\n" + dom.data.currentNode.getIndent();
		}
		html += "<" + node.name + node.attrs.render() + ">";
		
		if( node.children.length > 0 )
		{
			if( increaseIndent == true ){
				dom.data.currentNode.indent++;
			}			
			for( child in node.children ){
				 html += child.render();
			}
			if( increaseIndent == true ){
				dom.data.currentNode.indent--;
			}			
			if( useIndenting   == true && 
				indentCloseTag == true ){
				html += "\n" + dom.data.currentNode.getIndent();
			}
		}
		return html + "</" + node.name + ">";
		/*/
		return null;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function renderText( node : TextNode ) : String
	{
		/*/
		var html = "";
		if( useIndenting == true ){
			html = "\n" + dom.data.currentNode.getIndent();
		}		
		return html + node.text;
		/*/
		return null;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////