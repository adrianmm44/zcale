package zcale.xml.node;

import haxe.ds.StringMap;
import zcale.types.ArrayType;
import zcale.xml.node.Attribute;
import zcale.xml.node.ChildNode;
import zcale.xml.node.ChildNodeType;
import zcale.xml.node.MixedNodeType;

@:access( zcale.xml.node.Attribute )

class ElderNode<T> extends ChildNode<T> {
	
	private var nodeName   : String;
	private var autoClose  : Bool;
	private var attrs      : StringMap<Attribute<T>>;
	private var attrsOrder : ArrayType<Attribute<T>>;
	private var params 	   : ArrayType<String>;	
	private var childNodes : ArrayType<ChildNodeType>;
	
	public var children( get, never ) : ArrayType<ChildNodeType>;
	
	public function new( ?nodeName : String, autoClose : Bool = true ) {
	
		super();
		this.nodeName  	= nodeName;
		this.autoClose  = autoClose;
		this.attrs 	   	= new StringMap();
		this.attrsOrder = [];
		this.params    	= [];
		this.childNodes = [];
	}
	
	public function get( attr : String ) : Attribute<T> {
		
		if( ! attrs.exists( attr )) {
			var obj = new Attribute<T>( self, attr );
			attrs.set( attr, obj );
			attrsOrder.add(  obj );
			return obj;
		}
		else {
			return attrs.get( attr );
		}
	}	
	
	public function add( nodes : Array<MixedNodeType> ) : T {
	
		for ( node in nodes ) {
			addChild( node );
		}
		return self;
	}
	
	public function addChild( node : MixedNodeType ) : T {
		
		var child : ChildNodeType;
		if( node.isNode() ) {
			child = node;
		}
		else {
			child = new ChildNode( node );
			child.indenting = this.indenting;
		}
		child.parent = this;
		childNodes.add( child );
		return self;
	}
	
	public function addParam( param : String ) : T {
		
		params.add( param );
		return self;
	}
		
	private function get_children() : ArrayType<ChildNodeType> {
		
		return childNodes;
	}
	
	private function childrenToString() : String {
		
		var str = "";
		for ( child in children ) {
			child.indenting = this.indenting + 1; 
			str += child.toString();
		}		
		return str;
	}
	
	private function nodeToString() : String {
		
		var str = "\n" + indenting.toString() + "<" + nodeName;
		for ( attr in attrsOrder ) {
			if( attr.value != null ) {
				str += " " + attr.toString();
			}
		}
		for ( param in params ) {
			str += " " + param;
		}
		if( children.length > 0 ) {
			str += ">" + childrenToString() + getIndenting() + "</" + nodeName + ">";
		}
		else if( content.value != null ) {
			str += ">" + content.value + "</" + nodeName + ">";
		}
		else if( ! autoClose ) {
			str += "></" + nodeName + ">";
		}
		else {
			str += "/>";
		}
		return str;
	}
	
	public override function toString() : String {
		
		return nodeToString();
	}
}