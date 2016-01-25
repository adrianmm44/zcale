package zcale.xml.nodes;

import zcale.xml.node.ElderNode;
import zcale.xml.node.ElderNodeType;

@:forward

abstract Element( ElderNode<Element> ) to ElderNodeType {
	
	@:extern public inline function new( name : String ) {
		
		this = new ElderNode( name );
	}
}