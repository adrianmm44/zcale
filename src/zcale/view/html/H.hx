package zcale.view.html;

import zcale.view.html.nodes.HtmlNodes;
import zcale.view.html.nodes.form.FormNodes;
import zcale.xml.nodes.Comment;
//import zcale.view.html.nodes.form.FormNodes;
//import zcale.view.html.nodes.form.input.InputNodes;

class H {
	
	//public static var input : InputNodes = new InputNodes();
	
	@:extern public static inline function doc( ?title : String ) : Document {
		
		return new Document( title );
	}	
	@:extern public static inline function meta() : Meta {
		
		return new Meta();
	}	
	@:extern public static inline function link( ?href : String ) : Link {
		
		return new Link( href );
	}	
	@:extern public static inline function style() : Style {
		
		return new Style();
	}	
	@:extern public static inline function script( ?src : String ) : Script {
		
		return new Script( src );
	}	
	@:extern public static inline function div() : HtmlElement {
		
		return new HtmlElement("div");
	}	
	@:extern public static inline function span() : HtmlElement {
		
		return new HtmlElement("span");
	}	
	@:extern public static inline function header() : HtmlElement {
		
		return new HtmlElement("header");
	}		
	@:extern public static inline function nav() : HtmlElement {
		
		return new HtmlElement("nav");
	}	
	@:extern public static inline function section() : HtmlElement {
		
		return new HtmlElement("section");
	}	
	@:extern public static inline function article() : HtmlElement {
		
		return new HtmlElement("article");
	}	
	@:extern public static inline function aside() : HtmlElement {
		
		return new HtmlElement("aside");
	}	
	@:extern public static inline function footer() : HtmlElement {
		
		return new HtmlElement("footer");
	}		
	@:extern public static inline function table() : HtmlElement {
		
		return new HtmlElement("table");
	}	
	@:extern public static inline function tr() : HtmlElement {
		
		return new HtmlElement("tr");
	}	
	@:extern public static inline function td() : Td {
		
		return new Td();
	}	
	@:extern public static inline function ol() : HtmlElement {
		
		return new HtmlElement("ol");
	}
	@:extern public static inline function ul() : HtmlElement {
		
		return new HtmlElement("ul");
	}	
	@:extern public static inline function li() : HtmlElement {
		
		return new HtmlElement("li");
	}	
	@:extern public static inline function img() : Img {
		
		return new Img();
	}	
	@:extern public static inline function svg() : Svg {
		
		return new Svg();
	}	
	@:extern public static inline function p() : HtmlElement {
		
		return new HtmlElement("p");
	}
	@:extern public static inline function h( rank : Int ) : HtmlElement {
		
		return new HtmlElement("h" + Std.string( rank ));
	}	
	@:extern public static inline function a() : A {
		
		return new A();
	}
	@:extern public static inline function strong() : HtmlElement {
		
		return new HtmlElement("strong");
	}	
	@:extern public static function form() : Form {
		
		return new Form();
	}
	@:extern public static inline function input( ?type : String ) : Input {
		
		return new Input( type );
	}
	@:extern public static inline function button() : Button {
		
		return new Button();
	}
	@:extern public static inline function hr() : String {
		
		return "<hr/>";
	}	
	@:extern public static inline function comment( ?str : String ) : Comment {
		
		return new Comment( str );
	}	
	public static var condition( get, never ) : Conditions;
	
	@:extern private static inline function get_condition() : Conditions {
		
		return new Conditions();
	}
}
 
abstract Conditions( Condition ) {
	
	@:extern public inline function new() {
		this = null;
	}	
	@:extern public inline function ifLessThanIE9() : Condition {
		
		return new Condition("if lt IE 9");
	}
}
/*
private class InputNodes
{
	public function new(){}
	
	public function text( name : String ) : InputText {
	
		return new InputText( name );
	}	
	public function password( name : String ) : InputPassword {
	
		return new InputPassword( name );
	}	
	public function radio( name : String ) : InputRadio {
	
		return new InputRadio( name );
	}	
	public function checkbox( name : String ) : InputCheckbox {
	
		return new InputCheckbox( name );
	}	
	public function tel( name : String ) : InputTel {
	
		return new InputTel( name );
	}	
	public function submit( name : String ) : InputSubmit {
	
		return new InputSubmit( name );
	}	
	public function hidden( name : String ) : Input {
	
		return new Input( name, Input.HIDDEN );
	}
}
*/