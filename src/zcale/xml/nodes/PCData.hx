package zcale.xml.nodes;

import zcale.xml.node.ChildNode;
import zcale.xml.node.ChildNodeType;

@:forward
@:access( zcale.xml.node.ChildNode )

abstract PCData( ChildNode<PCData> ) to ChildNodeType {
	
	@:extern public var value( get, set ) : String;
	
	@:extern public inline function new( ?str : String ) {
		
		this = new ChildNode( str );
	}
	
	@:extern private inline function get_value() : String {
		
		return this.content.value;
	}
	
	@:extern private inline function set_value( v : String ) : String {
		
		return this.content.value = v;
	}
	
	@:extern public inline function set( v : String ) : PCData {
		
		return this.content.set( v );
	}
}