package zcale.view.css;

import haxe.ds.StringMap;
import zcale.types.ArrayType;
import zcale.types.chains.StringMapChain;
import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;
import zcale.view.css.style.MediaQuery;
import zcale.view.css.FontFace;

abstract CssNode( Style ) {
	
	@:extern public inline function new() {
		this = null;
	}
	@:extern public inline function all()    : Style return new Style("*");
	@:extern public inline function html()   : Style return new Style("html");
	@:extern public inline function body()   : Style return new Style("body");
	@:extern public inline function div()    : Style return new Style("div");
	@:extern public inline function span()   : Style return new Style("span");
	@:extern public inline function strong() : Style return new Style("strong");	
	@:extern public inline function a() 	 : Style return new Style("a");
	
	@:extern public inline function h( rank : Int ) : Style {
		
		return new Style("h" + Std.string( rank ));
	}
	@:extern public inline function ul()    : Style return new Style("ul");
	@:extern public inline function li()    : Style return new Style("li");
	
	@:extern public inline function input() : Style return new Style("input");
}

@:forward( length, iterator )

abstract FontFaces<T>( StringMapChain<T,FontFace> ) {
	
	@:extern public inline function new( user : T ) {
		
		this = new StringMapChain( user );
	}
	@:extern public inline function add( name : String, url : String, svgId : String ) : T {
		
		return this.set( name, new FontFace( name, url, svgId ));
	}
}

class C {
	
	public static var lib   : CssNode = new CssNode();
	public static var media : MediaQuery = new MediaQuery();
	
	@:extern public static inline function doc() : C {
	
		return new C();
	}
	@:extern public static inline function id( v : String ) : Style {
	
		return new Style( "#" + v );
	}
	@:extern public static inline function cls( v : String ) : Style {
	
		return new Style( "." + v );
	}
	
	private var imports 	 : ArrayType<String>;
	private var styles  	 : ArrayType<BaseStyle>;
	private var mediaQueries : StringMap<String>;
	
	public var fontFaces 	 : FontFaces<C>;
		
	private function new() {
		
		imports   = [];	
		styles    = [];
		fontFaces = new FontFaces( this );
	}
	
	public function add( styles : ArrayType<Style> ) : C {
	
		for( style in styles ){
			 // style.root = this;
			 this.styles.add( style );
		}
		return this;
	}
	
	public function addStyle( style : Style ) : C {
		
		// style.root = this;
		styles.add( style );
		return this;
	}
	
	public function addImport( url : String ) : C {
		
		imports.add( url );
		return this;
	}	
	/*/
	public function addMediaQuery( query : String,  styles : Array<Style> ) : C {
		
		if( mediaQueries.exists( query )){
			mediaQueries.set( query, mediaQueries.get( query ).addArray( styles ));
		}
		else{
			mediaQueries.set( query, styles );
		}
		return this;
	}
	/*/
	
	public function toString() : String {
		
		mediaQueries = new StringMap();		
		var s = "";
		if( imports.length > 0 ) {
			for ( url in imports ) {
				s += "\n" + "@import url('" + url + "');";
			}
			s += "\n";
		}
		for ( fontFace in fontFaces ) {
			s += fontFace.toString();				
		}	
		for ( style in styles ) {
			s += style.toString();
			s += substylesToString( style );
		}
		for ( mediaQuery in mediaQueries.keys() ) {
			s += "\n" + "@media " + mediaQuery + " {" + "\n" + mediaQueries.get( mediaQuery ) + "\n" + "}";
		}
		return s;
	}
	
	private function substylesToString( style : BaseStyle ) : String {
		
		var s1 = "";
		var s2 = "";
		for ( substyle in style.substyles ) {
					
			substyle.selectQuery = style.selectQuery + substyle.selector;
						
			s1 = substyle.toString() + substylesToString( substyle );
			
			if( substyle.mediaQuery != null ) {		
				if( mediaQueries.exists( substyle.mediaQuery ) == false ) {
					mediaQueries.set( substyle.mediaQuery, s1 );
				}
				else {
					mediaQueries.set( substyle.mediaQuery, mediaQueries.get( substyle.mediaQuery ) + s1 );
				}
			}
			else {
				s2 += s1;
			}
		}
		return s2;
	}
}