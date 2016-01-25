package zcale.view.css;

import haxe.ds.StringMap;
import zcale.types.enums.FloatString;
import zcale.patterns.Event;
import zcale.patterns.EventListeners;
import zcale.view.css.C;
import zcale.view.css.Property;
import zcale.view.css.Properties;
import zcale.view.css.properties.*;

using Lambda;

class Style
{
	@:isVar
	private var root( get, set ) : C;	
	private var parent 	  	 : Style;
	private var listeners 	 : EventListeners<Style>;
	private var children  	 : Array<Style>;
	private var mediaQueries : Array<Style>;
	
	private var properties 	 : Properties;
	private var basicProps 	 : BasicProperties;
	
	public var font( 	   	  get, never ) : Font;
	public var text(	   	  get, never ) : Text;
	public var margin( 	   	  get, never ) : Margin;
	public var padding(    	  get, never ) : Padding;
	public var verticalAlign( get, never ) : VerticalAlign;
	public var float(	   	  get, never ) : FloatProperty;
	public var position(   	  get, never ) : Position;
	public var display(    	  get, never ) : Display;	
	public var border( 	   	  get, never ) : Border;
	public var background( 	  get, never ) : Background;
	public var boxShadow( 	  get, never ) : BoxShadow;
	public var listStyle(  	  get, never ) : ListStyle;
	
	private var selector  	 : String;	
	private var query 		 : String;
	private var isChild   	 : Bool;
	private var isClass   	 : Bool;
	private var isMediaQuery : Bool;
	
	public function new( ?selector )
	{
		this.selector = selector;
		basicProps 	  = new BasicProperties( this );
		properties	  = new Properties();
		listeners  	  = new EventListeners(  this );
		listeners.add( Event.TO_STRING, onStringify );
	}
	
	private function onStringify( style : Style ) : Void
	{
		
		//for( mediaQuery in mediaQueries )
		//{
		//	 root.addMediaQuery(  , [ this ] ) // styles
		//}
		
		if( isMediaQuery ){
			this.selector = parent.selector;
			root.addMediaQuery( query, [ this ] );
		}
	}
	 
	public function toString() : String
	{
		listeners.dispatch( Event.TO_STRING );
		
		var str = basicProps.toString() + properties.toString();
		
		if( str.length > 0 ){
			str = "\n" + selector + " {" + str + "\n" + "}";
		}
		if( children != null ){
			for( style in children )
			{
				if( style.isChild ){
					style.selector = this.selector + " " + style.selector;
				}
				else if( style.isClass ){
					style.selector = this.selector + style.selector;
				}
				str += style.toString();
			}
		}
		if( mediaQueries != null ){
			for( query in mediaQueries ){
				 query.toString();
			}
		}
		return str;
	}
		
	public function hasChild( style : Style ) : Style
	{
		if( children == null ){
			children = new Array();
		}
		style.parent  = this;
		style.isChild = true;
		children.push( style );
		return this;
	}
	
	public function addClass( styles : Array<Style> ) : Style
	{
		if( children == null ){
			children = new Array();
		}
		for( style in styles ){
			 style.parent  = this;
			 style.isClass = true;
			 children.push( style );
		}
		return this;
	}
	
	public function mediaQuery( mediaQuery : Style ) : Style
	{
		if( mediaQueries == null ){
			mediaQueries = new Array();
		}
		mediaQuery.parent = this;
		mediaQuery.isMediaQuery = true;
		mediaQueries.push( mediaQuery );
		return this;
	}
	
	private function get_root() : C
	{	
		if( root == null ){
			var current : Style;
			if( this.parent != null ){
				current = this.parent;				
				while( current.parent != null ){
					current = current.parent;
				}
				root = current.root;
			}
		}
		return root;
	}
	
	private function set_root( v : C ) : C
	{
		return root = v;
	}
	
	private function get_font() : Font
	{
		if( properties.font == null ){
			properties.font = new Font( this );
		}
		return properties.font;
	}
	
	private function get_text() : Text
	{
		if( properties.text == null ){
			properties.text = new Text( this );
		}
		return properties.text;
	}
	
	private function get_margin() : Margin
	{
		if( properties.margin == null ){
			properties.margin = new Margin( this );
		}
		return properties.margin;
	}
	
	private function get_padding() : Padding
	{
		if( properties.padding == null ){
			properties.padding = new Padding( this );
		}
		return properties.padding;
	}
	
	private function get_verticalAlign() : VerticalAlign
	{
		if( properties.verticalAlign == null ){
			properties.verticalAlign = new VerticalAlign( this );
		}
		return properties.verticalAlign;
	}
	
	private function get_float() : FloatProperty // Specifies whether or not a box should float 1
	{
		if( properties.float == null ){
			properties.float = new FloatProperty( this );
		}
		return properties.float;
	}
	
	private function get_position() : Position // Specifies whether or not a box should float 1
	{
		if( properties.position == null ){
			properties.position = new Position( this );
		}
		return properties.position;
	}
	
	private function get_display() : Display
	{
		if( properties.display == null ){
			properties.display = new Display( this );
		}
		return properties.display;
	}
	
	private function get_visibility( v : String ) : Visibility // Specifies whether or not an element is visible 2
	{
		if( properties.visibility == null ){
			properties.visibility = new Visibility( this );
		}
		return properties.visibility;
	}
		
	/*/
	public function zIndex( v : String ) : Style // Sets the stack order of a positioned element 2
	{
		return this;
	}
	/*/
	private function get_border() : Border
	{
		if( properties.border == null ){
			properties.border = new Border( this );
		}
		return properties.border;
	}
	
	private function get_background() : Background
	{
		if( properties.background == null ){
			properties.background = new Background( this );
		}
		return properties.background;
	}
	
	private function get_boxShadow() : BoxShadow
	{
		if( properties.boxShadow == null ){
			properties.boxShadow = new BoxShadow( this );
		}
		return properties.boxShadow;
	}
	
	private function get_listStyle() : ListStyle
	{
		if( properties.listStyle == null ){
			properties.listStyle = new ListStyle( this );
		}
		return properties.listStyle;
	}
	
}