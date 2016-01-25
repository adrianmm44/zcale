package zcale.xml.nodes;

import zcale.xml.node.ChildNode;
import zcale.xml.node.ChildNodeType;
import zcale.types.chains.StringChain;

@:forward
@:access( zcale.xml.node.ChildNode )

abstract CData( CDataBase ) to ChildNodeType {
	
	@:extern public var value( get, set ) : String;
		
	@:extern public inline function new( ?str : String ) {
		
		this = new CDataBase( str );
	}
	
	@:extern private inline function get_value() : String {
		
		return this.content.value;
	}
	
	@:extern private inline function set_value( v : String ) : String {
		
		return this.content.value = v;
	}
	
	@:extern public inline function set( v : String ) : CData {
		
		return this.content.set( v );
	}
}

class CDataBase extends ChildNode<CData> {
	
	public function new( ?str : String ) {
		
		super( str );
	}
	
	public override function toString() : String {
		
		return getIndenting() + "<![CDATA[" + content.value + "]]>";
	}
}