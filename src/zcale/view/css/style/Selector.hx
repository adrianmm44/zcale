package zcale.view.css.style;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;

abstract Selector( BaseStyle ) {
	
	@:extern public inline function new( style : BaseStyle ) {
		
		this = style;
	}
	@:extern public inline function style( style : Style ) : Style {
		
		return this.add( style );
	}
	@:extern public inline function child( style : Style ) : Style {
		
		return this.add( style, " > " );
	}
	@:extern public inline function sibling( style : Style ) : Style {
		
		return this.add( style, " ~ " );
	}
	@:extern public inline function firstSibling( style : Style ) : Style {
		
		return this.add( style, " + " );
	}
	@:extern public inline function descendant( style : Style ) : Style {
		
		return this.add( style, " " );
	}
	/*/
	@:extern public inline function attr( style : Style ) : Style {
		
		return this.add( style, " " );
	}
	/*/	
	@:extern public inline function mediaQuery( style : Style ) : Style {
		
		return this.add( style );
	}		
	// X, Y 	 		   	   // and( C.tag("div"))
	
	// X > Y 		   		   // add.child( C.tag("div"))
	// X ~ Y 		   		   // add.sibling( C.tag("div"))
	// X + Y 		   		   // add.firstSibling( C.tag("div"))	
	// X Y 	 		   		   // add.descendant( C.tag("div"))
							   // add.mediaQuery()
	
	// X[title] 	   		   // add.attr("href").name()
	// X[href="foo"]   		   // add.attr("href").is("foo")
	// X[href*="foo"]  		   // add.attr("href").contains("foo")
	// X[href^="http"] 		   // add.attr("href").startsWith("http")
	// X[href$=".jpg"] 		   // add.attr("href").endsWith(".jpg")
	// X[foo~="bar"]   		   // add.attr("href").inArray("foo")
	
	// X:visited 			   // is.visited()
	// X:link 	 			   // is.link()
	// X:checked 			   // is.checked()
	// X:hover 	 			   // is.hover()
	
	// X:not(selector) 		   // is.not( C.tag("div"))
	
	// X:before				   // is.before
	// X:before				   // is.after
	
	// X::first-line   		   // is.firstLine()
	// X::first-letter 		   // is.firstLetter()
	// X:nth-of-type( n )	   // is.childPos( 1 )
	// X:nth-last-of-type( n ) // is.lastChildPos( 2 )
	// X:first-of-type		   // is.firstChild()
	// X:last-of-type		   // is.lastChild()
	// X:only-of-type 		   // is.onlyChild()
	
	// X:nth-child( n ) 	   // is.childPos( 1 )
	// X:nth-last-child( n )   // is.lastChildPos( 2 )
	// X:first-child 		   // is.firstChild()
	// X:last-child  		   // is.lastChild()
	// X:only-child  		   // is.onlyChild()
}