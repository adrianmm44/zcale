package zcale.view.html.nodes;

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

@:forward

abstract HtmlElement( HtmlNode<HtmlElement> ) to HtmlNodeType {
	
	@:extern public inline function new( name : String ) {
		
		this = new HtmlNode( name );
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract Document( HtmlDoc ) to ElderNodeType {
	
	@:extern public var lang( get, never ) : Attribute<Document>;
	
	@:extern public inline function new( ?title : String ) {		
		this = new HtmlDoc( title );
	}
	@:extern private inline function get_lang() : Attribute<Document> {		
		return this.get("lang");
	}
}

class HtmlDoc extends ElderNode<Document> {
	
	public var head : Head;
	public var body : Body;
	
	public function new( ?title : String ) {
		
		super("html");
		this.get("lang").set("en");				
		head = new Head();
		body = new Body();
		addChild( head );
		addChild( body );
						
		if( title != null ){
			head.title.set( title );
		}		
	}
		
	public override function toString() : String {
		
		return "<!DOCTYPE html>" + nodeToString();
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

class Head extends ElderNode<Head> {

	public var title   : StringChain<Head>;
	public var metas   : NodeChildren<Head>;
	public var links   : NodeChildren<Head>;
	public var scripts : NodeChildren<Head>;
	
	private var titleNode : PCData;
	
	public function new() {		
		super("head", false );
		title	  = new StringChain(  self, "" );
		metas 	  = new NodeChildren( self );
		links	  = new NodeChildren( self );
		scripts   = new NodeChildren( self );
		titleNode = new PCData();
			
		links.add( titleNode );
		metas.add( new Meta().charset.set("utf-8") );
	}
	
	private override function get_children() : ArrayType<ChildNodeType> {
		
		return metas.combine( links ).combine( scripts ).combine( childNodes );
	}
		
	public override function toString() : String {
		
		titleNode.value = getIndenting() + "\t" + "<title>" + title + "</title>" + "\n";
		return nodeToString();
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( get, parent, toString )

abstract Meta( ElderNode<Meta> ) to ChildNodeType {
		
	@:extern public var charset(   get, never ) : Attribute<Meta>;
	@:extern public var name( 	   get, never ) : Attribute<Meta>;
	@:extern public var content(   get, never ) : Attribute<Meta>;
	@:extern public var httpEquiv( get, never ) : Attribute<Meta>;
	
	@:extern public inline function new() {		
		this = new ElderNode("meta");
	}	
	@:extern private inline function get_charset() : Attribute<Meta> {
		return this.get("charset");
	}	
	@:extern private inline function get_name() : Attribute<Meta> {		
		return this.get("name");
	}	
	@:extern private inline function get_content() : Attribute<Meta> {		
		return this.get("content");
	}	
	@:extern private inline function get_httpEquiv() : Attribute<Meta> {		
		return this.get("httpEquiv");
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( get, parent, toString )

abstract Link( ElderNode<Link> ) to ChildNodeType {
	
	@:extern public var href( get, never ) : Attribute<Link>;
	@:extern public var type( get, never ) : Attribute<Link>;
	@:extern public var rel(  get, never ) : Attribute<Link>;
	
	@:extern public inline function new( ?href : String ) {		
		this = new LinkBase( href );
	}	
	@:extern private inline function get_href() : Attribute<Link> {
		return this.get("href");
	}	
	@:extern private inline function get_type() : Attribute<Link> {
		return this.get("type");
	}	
	@:extern private inline function get_rel()  : Attribute<Link> {
		return this.get("rel");
	}
}

class LinkBase extends ElderNode<Link> {
	
	public function new( ?href : String ) {
		super("link");
		this.get("type").set("text/css");
		this.get("rel" ).set("stylesheet");
		this.get("href").set( href );
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract Style( ElderNode<Style> ) to ElderNodeType {
	
	@:extern public var type( get, never ) : Attribute<Style>;
	
	@:extern public inline function new() {
		this = new ElderNode("style");
	}
	@:extern private inline function get_type() : Attribute<Style> {
		return this.get("type");
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( get, parent, toString )
@:access( zcale.xml.node.ChildNode )

abstract Script( ElderNode<Script> ) to ElderNodeType {
	
	@:extern public var src( get, never )  : Attribute<Script>;
	@:extern public var type( get, never ) : Attribute<Script>;
	@:extern public var script( get, set ) : String;
	
	@:extern public inline function new( src : String ) {
		this = new ScriptBase( src );
	}
	@:extern private inline function get_src()  : Attribute<Script> {
		return this.get("src");
	}
	@:extern private inline function get_type() : Attribute<Script> {
		return this.get("type");
	}	
	@:extern private inline function get_script() : String {
		return this.content.value;
	}	
	@:extern private inline function set_script( v : String ) : String {
		return this.content.value = v;
	}	
	@:extern public inline function set( script : String ) : Script {
		return this.content.set( script );
	}
}

class ScriptBase extends ElderNode<Script> {
		
	public function new( ?src : String ) {
		super("script", false );
		this.get("type").set("text/javascript");
		this.get("src" ).set( src );
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

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
	/*/
	public function addBgImageCover() : HtmlElement {
		
		var div = H.div().cls.set( BasicStyles.BG_IMAGE_COVER );
		this.addChild( div );
		return div;
	}
	/*/
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract Td( HtmlNode<Td> ) to HtmlNodeType {
	
	@:extern public var span( get, never ) : Attribute<Td>;
	
	@:extern public inline function new() {
		this = new HtmlNode("td");
	}
	@:extern private inline function get_span() : Attribute<Td> {
		return this.get("span");
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( id, cls, style, title, get, ng, parent, toString )

abstract Img( HtmlNode<Img> ) to HtmlNodeType {
	
	@:extern public var src( 	get, never ) : Attribute<Img>;
	@:extern public var alt( 	get, never ) : Attribute<Img>;
	@:extern public var width( 	get, never ) : Attribute<Img>;
	@:extern public var height( get, never ) : Attribute<Img>;
	
	@:extern public inline function new() {
		this = new HtmlNode("img", true );
	}
	@:extern private inline function get_src() : Attribute<Img> {
		return this.get("src");
	}
	@:extern private inline function get_alt() : Attribute<Img> {
		return this.get("alt");
	}
	@:extern private inline function get_width() : Attribute<Img> {
		return this.get("width");
	}
	@:extern private inline function get_height() : Attribute<Img> {
		return this.get("height");
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract Svg( Img ) {
	
	@:extern public inline function new() {
		this = new Img();
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract A( HtmlNode<A> ) to HtmlNodeType {
		
	@:extern public var href( 	get, never ) : Attribute<A>;
	@:extern public var target( get, never ) : Attribute<A>;
	
	@:extern public inline function new() {
		this = new HtmlNode("a");
	}
	@:extern private inline function get_href() : Attribute<A> {
		return this.get("href");
	}
	@:extern private inline function get_target() : Attribute<A> {
		return this.get("target");
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
/*
class Form extends ElderNode<Form>
{
    public function new( post : Bool = true, ?action : String )
	{
		super( this, "form");
				
		if( action != null ){
			this.action( action );
		}
		if( post ){
			this.method("post");
		}
		else{
			this.method("get");
		}
	}
	
	public function action( v : String ) : Form
    {
    	this.attrs.set("action", v );
		return this;
    }

	public function method( v : String ) : Form
    {
    	this.attrs.set("method", v );
		return this;
    }
}
*/
/////////////////////////////////////////////////////////////////////////////////////////////////////

class Condition extends ElderNode<Condition> {
	
	private var condition : String;
	
	public function new( condition : String ) {		
		super();
		this.condition = condition;
	}
		
	public override function toString() : String {
				
		var str = getIndenting() + "<!--[" + condition + "]";
		str += childrenToString();
		return str + getIndenting() + "<![endif]-->";
	}
}
