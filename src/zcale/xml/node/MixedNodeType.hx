package zcale.xml.node;

import zcale.xml.node.ChildNode;
import zcale.xml.node.ChildNodeType;

@:coreType 
abstract MixedNodeType 
	from ChildNodeType to ChildNodeType	
	from String to String {
		
	@:extern public inline function isNode() : Bool {

		return ( Std.is( this, ChildNode ));
	}
	
	@:extern public inline function isString() : Bool {

		return ( Std.is( this, String ));
	}
}