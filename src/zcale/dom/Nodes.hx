/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.dom;

import zcale.settings.CoreSettings;
import zcale.dom.Css;
import zcale.dom.css.Style;
import zcale.dom.node.ChildNode;
import zcale.dom.node.ElderNode;
import zcale.dom.node.interfaces.IElderNode;
import zcale.dom.node.interfaces.IGlobalAttrs;
import zcale.dom.node.interfaces.ITextNode;
import zcale.dom.node.interfaces.IStyledNode;

import StringTools;

/////////////////////////////////////////////////////////////////////////////////////////////////////////

class Document extends ElderNode<Document>
{
	public var doctype( default, set ) : String;
	public var lang(    default, set ) : String;		
	public var head   : Head;
	public var body   : Body;	
	public var tracer : Xmp;
	
	public function new( ids : Array<Int> )
	{
		super( ids, this, "html" );
		
		dom.css.style( name );
		doctype = CoreSettings.htmlDoctype;
		lang 	= CoreSettings.htmlLang;
		head 	= new Head( ids );
		body 	= new Body( ids );
		tracer  = new Xmp(  ids );
		tracer.id = CoreSettings.idTraces;
		tracer.style = new Style().margin.set("0px");
		rendering.increaseIndent = false;
		
		addChild( head );
		addChild( body );
		body.addChild( tracer );
	}
	
	private function set_doctype( v : String ) : String
	{
		return doctype = v;
	}
			
	private function set_lang( v : String ) : String
	{
		attrs.set("lang", v );
		return lang = v;
	}
			
	//#if ( neko || php )
	public override function render() : String
	{
		return doctype + rendering.renderElderNode( this );
	}
	//#end
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////

class Head extends ElderNode<Head> implements IElderNode
{
	public var css : Css;
	public var charset( default, set ) : String;
	public var title( 	default, set ) : String;
	
	private var charsetNode : Charset;
	private var titleNode 	: Title;
	private var styleNode 	: StyleNode;
	
	public function new( ids : Array<Int> )
	{
		super( ids, this, "head" );
		
		css 		= dom.css;
		charsetNode = new Charset( ids );
		titleNode 	= new Title( ids );
		styleNode	= new StyleNode( ids );		
		
		addChild( charsetNode );
		addChild( titleNode );
		addChild( styleNode );
	}
	
	private function set_title( v : String ) : String
	{
		titleNode.children = new Array();
		titleNode.text.add( v );
		return title = v;
	}
	
	private function set_charset( v : String ) : String
	{
		charsetNode.encoding = v;
		return charset = v;
	}
	
	public override function render() : String
	{
		styleNode.children = new Array();
		styleNode.text.add( css.render() );
		return rendering.renderElderNode( this );
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////

class Title extends ElderNode<Title> implements ITextNode
{	
	public function new( ids : Array<Int> )
	{
		super( ids, this, "title" );
				
		textHatch.useIndenting   = false;
		rendering.indentCloseTag = false;
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////
/*/
class Meta extends ChildNode<Meta>
{	
	public var charset( default, set ) : String;
	
	public function new( ids : Array<Int> )
	{
		super( ids, this, "meta" );
	}
	
	private function set_charset( v : String ) : String
	{
		attrs.set("charset", v );
		return charset = v;
	}
}
/*/
/////////////////////////////////////////////////////////////////////////////////////////////////////////

class Charset extends ChildNode<Charset>
{
	public var encoding( default, set ) : String;
	
	public function new( ids : Array<Int> )
	{
		super( ids, this, "meta" );
		encoding = CoreSettings.htmlCharset;
	}
	
	private function set_encoding( v : String ) : String
	{
		attrs.set("charset", v );
		return encoding = v;
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

class StyleNode extends ElderNode<StyleNode> implements ITextNode
{
	@:extern public static inline var css : String = "text/css";
	
	public var type( default, set ) : String;
	
	public function new( ids : Array<Int> )
	{
		super( ids, this, "style" );
		type = css;
		text.useIndenting = false;
	}
	
	private function set_type( v : String ) : String
	{
		attrs.set("type", v );
		return type = v;
	}
	/*/
	public override function render() : String
	{
		var str = "";		
		if( children.length > 0 ){
			str = rendering.renderElderNode( this );
		}
		return str;
	}
	/*/
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////

class Body extends ElderNode<Body> implements IGlobalAttrs implements ITextNode implements IStyledNode
{
	public function new( ids : Array<Int> )
	{
		super( ids, this, "body" );
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////

class Div extends ElderNode<Div> implements IGlobalAttrs implements ITextNode implements IStyledNode
{	
	public function new( ids : Array<Int> )
	{
		super( ids, this, "div" );
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

class A extends ElderNode<A> implements IGlobalAttrs implements ITextNode implements IStyledNode
{
	public var href(   default, set ) : String;
	public var target( default, set ) : String;
	
	public function new( ids : Array<Int> )
	{
		super( ids, this, "a" );
	}
	
	private function set_href( v : String ) : String
	{
		attrs.set("href", v );
		return href = v;
	}
	
	private function set_target( v : String ) : String
	{
		attrs.set("target", v );
		return target = v;
	}
	
	public function setEmail( to : String, subject : String, ?body : String ) : String
	{
		var address = "mailto:" + to + "?subject=" + StringTools.replace( subject," ","%20");
		if( body != null ){
			body = StringTools.replace( body," ", "%20");
			body = StringTools.replace( body,"\n","%0A");
			address += "&body=" + body;
		}		
		return href = address;
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

class P extends ElderNode<P> implements IGlobalAttrs implements ITextNode implements IStyledNode
{
	public function new( ids : Array<Int> )
	{
		super( ids, this, "p" );
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

class B extends ElderNode<B> implements IGlobalAttrs implements ITextNode implements IStyledNode
{
	public function new( ids : Array<Int> )
	{
		super( ids, this, "strong" );
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

class I extends ElderNode<I> implements IGlobalAttrs implements ITextNode implements IStyledNode
{
	public function new( ids : Array<Int> )
	{
		super( ids, this, "em" );
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

class H extends ElderNode<H> implements IGlobalAttrs implements ITextNode implements IStyledNode
{
	public var rank : Int;
	
	public function new( ids : Array<Int>, rank : Int )
	{
		super( ids, this, "h" + Std.string( rank ) );
		this.rank = rank;
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////

class Img extends ChildNode<Img> implements IGlobalAttrs implements IStyledNode
{	
	public var src(    default, set ) : String;
	public var alt(    default, set ) : String;
	public var width(  default, set ) : Int;
	public var height( default, set ) : Int;			
		
	public function new( ids : Array<Int> )
	{
		super( ids, this, "img" );
	}
	
	private function set_src( v : String ) : String
	{
		attrs.set("src", v );
		return src = v;
	}
	
	private function set_alt( v : String ) : String
	{
		attrs.set("alt", v );
		return alt = v;
	}
	
	private function set_width(  v : Int ) : Int
	{
		attrs.set("width", Std.string( v ) );
		return width = v;
	}
	
	private function set_height( v : Int ) : Int
	{
		attrs.set("height", Std.string( v ) );
		return height = v;
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////

class Xmp extends ElderNode<Xmp> implements IGlobalAttrs implements ITextNode implements IStyledNode
{	
	public function new( ids : Array<Int> )
	{
		super( ids, this, "xmp" );
		textHatch.useIndenting   = false;
		rendering.indentCloseTag = false;
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////