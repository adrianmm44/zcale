package zcale.xml.node;

import zcale.patterns.Event;
import zcale.xml.nodes.PCData;
//import zcale.xml.node.NodeEnum;

class ElderNode<T> extends ChildNode<T>
{
	public var children( get, never ) : Array<NodeType>;
	
	private var childNodes : Array<NodeType>;
	
	public function new( ?self : T, ?tagName : String, autoCloseTag : Bool = false )
	{
		super( self, tagName, autoCloseTag );
				
		childNodes = new Array();
	}
	
	public function add( nodes : Array<Dynamic> ) : T // Array<Dynamic> should be Array<NodeEnum>
	{
		for( node in nodes )
		{
			if( Std.is( node, String ))
			{
				addText( node );
			}
			else{
				addChild( node );
			}			
			/*/
			switch( node ){
				case NString( s ):
					 addPCData( s );
				case TNode( v ):
					 addChild( v );
			}
			/*/
		}
		return self;
	}
		
	public function addChild( node : NodeType ) : T
	{
		node.parent = this;
		childNodes.push( node );
		return self;
	}
	
	public function addText( txt : String ) : T
	{
		var node = new PCData( txt );
		node.parent  = this;
		node.useIndenting = this.useIndenting;		
		childNodes.push( node );
		return self;
	}
	
	private function get_children() : Array<NodeType>
	{
		return childNodes;
	}
	
	private override function onBodyToString( self : T ) : Void
	{
		var str = "";
		if( children.length > 0 ){
			str += ">";
			for(child in children ){
				child.indenting = this.indenting + 1; 
				str += child.toString();
			}
			str += getIndenting() + "</" + tagName + ">";
		}
		else if( autoCloseTag )
		{
			str += "/>";
		}
		else{
			str += "></" + tagName + ">";
		}
		output += str;
	}
}