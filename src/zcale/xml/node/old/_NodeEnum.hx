package zcale.xml.node;

import zcale.xml.node.ChildNode;

abstract NodeEnum( NodeTypes ) from NodeTypes to NodeTypes
{
	@:from 
	@:extern
	public static inline function fromString( v : String ) : NodeEnum
	{
		return TString( v );
	}	
	@:from 
	@:extern
	static inline function fromNode(  v : NodeType ) : NodeEnum
	{
		return TNode( v );
	}
}

enum NodeTypes
{
	TString( v : String );
	TNode( v : NodeType );
}