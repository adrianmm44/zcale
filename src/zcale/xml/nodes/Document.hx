package zcale.xml.nodes;

import zcale.xml.node.ElderNode;
import zcale.xml.node.ElderNodeType;

@:forward

abstract Document( ElderNode<Document> ) to ElderNodeType {
	
	@:extern public inline function new( name : String ) {
		
		this = new ElderNode( name );
	}
		
	@:extern public inline function toString() : String {
		
		return '<?xml version="1.0" encoding="utf-8"?>' + this.toString();
	}
}