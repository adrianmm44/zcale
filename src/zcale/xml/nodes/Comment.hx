package zcale.xml.nodes;

import zcale.xml.node.ChildNode;
import zcale.xml.node.ChildNodeType;
import zcale.types.chains.StringChain;

@:forward
@:access( zcale.xml.node.ChildNode )

abstract Comment( CommentBase ) to ChildNodeType {
	
	@:extern public var value( get, set ) : String;
	
	@:extern public inline function new( ?str : String ) {
		
		this = new CommentBase( str );
	}
	
	@:extern private inline function get_value() : String {
		
		return this.content.value;
	}
	
	@:extern private inline function set_value( v : String ) : String {
		
		return this.content.value = v;
	}
	
	@:extern public inline function set( v : String ) : Comment {
		
		return this.content.set( v );
	}
}

class CommentBase extends ChildNode<Comment> {
	
	public function new( ?str : String ) {
		
		super( str );
	}
	
	public override function toString() : String {
		
		return getIndenting() + "<!-- " + content.value + " -->";
	}
}