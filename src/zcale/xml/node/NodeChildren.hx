package zcale.xml.node;

import zcale.types.ArrayType;
import zcale.xml.node.ChildNodeType;
import zcale.xml.node.ElderNodeType;

@:forward( add )

abstract NodeChildren<T:ElderNodeType>( NodeChildrenBase<T> ) {
	
	@:extern public var length( get, never ) : Int;
	
	public function new( parent : T ) {
		
		this = new NodeChildrenBase( parent );
	}
	
	@:extern private inline function get_length() : Int {
		
		return this.children.length;
	}
	
	@:extern public inline function combine( a : ArrayType<ChildNodeType> ) : ArrayType<ChildNodeType> {
		
		return this.children.combine( a );
	}
	
	@:extern public inline function iterator() : Iterator<ChildNodeType> {
		
		return this.children.iterator();
	}
	
	@:to
	@:extern private inline function toArray() : Array<ChildNodeType> {
		
		return this.children;
	}
}

class NodeChildrenBase<T:ElderNodeType> {
	
	public var parent 	: T;
	public var children : ArrayType<ChildNodeType>;
	
	public function new( parent : T ) {
		
		this.parent   = parent;
		this.children = [];
	}
	
	public function add( node : ChildNodeType ) : T {
		
		node.parent = parent;
		children.add( node );
		return parent;
	}
}