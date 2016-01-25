package zcale.view.html.nodes.form	;

import zcale.types.ArrayType;
import zcale.types.chains.StringChain;
import zcale.xml.nodes.PCData;
import zcale.xml.node.Attribute;
import zcale.xml.node.ElderNode;
import zcale.xml.node.ElderNodeType;
import zcale.xml.node.ChildNodeType;
import zcale.xml.node.NodeChildren;
import zcale.view.html.H;
import zcale.view.html.node.HtmlNode;
import zcale.view.html.node.HtmlNodeType;
import zcale.view.css.BasicStyles;

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract Form( HtmlNode<Form> ) to HtmlNodeType {
	
	@:extern public var name( get, never ) : Attribute<Form>;
	
	@:extern public inline function new() {
		this = new HtmlNode("form");
	}	
	@:extern public function novalidate() : Form {
		
		return this.addParam("novalidate");
	}
	@:extern private inline function get_name() : Attribute<Form> {
		return this.get("name");
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( id, cls, style, title, get, ng, parent, toString )

abstract Input( InputBase ) to HtmlNodeType {
	
	@:extern public static inline var TEXT     : String = "text";
    @:extern public static inline var PASSWORD : String = "password";
    @:extern public static inline var RADIO    : String = "radio";
    @:extern public static inline var CHECKBOX : String = "checkbox";
    @:extern public static inline var TEL      : String = "tel";	
	/*/
    @:extern public static inline var url      : String = "url";
    @:extern public static inline var email    : String = "email";
    @:extern public static inline var color    : String = "color";
    @:extern public static inline var range    : String = "range";
    @:extern public static inline var time     : String = "time";
    @:extern public static inline var date     : String = "date";
    @:extern public static inline var datetime : String = "datetime";
    @:extern public static inline var month    : String = "month";
    @:extern public static inline var week     : String = "week";
    @:extern public static inline var file     : String = "file";
    @:extern public static inline var search   : String = "search";
    /*/
	@:extern public static inline var SUBMIT   : String = "submit";
	@:extern public static inline var HIDDEN   : String = "hidden";
	
	@:extern public var name(  		  get, never ) : Attribute<Input>;
	@:extern public var type(  		  get, never ) : Attribute<Input>;
	@:extern public var value( 		  get, never ) : Attribute<Input>;
	@:extern public var placeHolder(  get, never ) : Attribute<Input>;
	@:extern public var autoComplete( get, never ) : Attribute<Input>;
	
	@:extern public inline function new( ?type : String ) {
		this = new InputBase( type );
	}
	@:extern private inline function get_name() : Attribute<Input> {
		return this.get("name");
	}
	@:extern private inline function get_type() : Attribute<Input> {
		return this.get("type");
	}
	@:extern private inline function get_value() : Attribute<Input> {
		return this.get("value");
	}
	@:extern private inline function get_placeHolder() : Attribute<Input> {
		return this.get("placeHolder");
	}
	@:extern private inline function get_autoComplete() : Attribute<Input> {
		return this.get("autocomplete");
	}	
	@:extern public function required() : Input {
		
		return this.addParam("required");
	}
}

class InputBase extends HtmlNode<Input> {

	public function new( type : String = "text" ) {		
		super("input", true );
		this.get("type").set( type );
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract Button( HtmlNode<Button> ) to HtmlNodeType {
	
	@:extern public var type( get, never ) : Attribute<Button>;
	
	@:extern public inline function new() {
		this = new HtmlNode("button");
	}
	@:extern private inline function get_type() : Attribute<Button> {
		return this.get("type");
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

/*/
@:forward

abstract Body( BodyBase ) to ElderNodeType {
	
	@:extern public var onload( get, never ) : Attribute<Body>;
	
	@:extern public inline function new() {		
		this = new BodyBase();
	}	
	@:extern private inline function get_onload() : Attribute<Body> {		
		
		return this.get("onload");
	}
}

class BodyBase extends ElderNode<Body> {

	public var scripts : NodeChildren<Body>;
	
	public function new() {		
		super("body", false );
		scripts = new NodeChildren( self );
	}
	
	private override function get_children() : ArrayType<ChildNodeType> {
		
		return childNodes.combine( scripts );
	}
}
/*/

