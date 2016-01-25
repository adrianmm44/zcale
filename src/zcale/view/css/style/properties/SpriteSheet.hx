package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;

abstract SpriteSheet( BaseStyle ) from BaseStyle { // does not work in Chrome or in Opera because of a positioning bug, but the code is perfectly fine
	
	@:extern public inline function image( url : String, width : Float ) : Style {
		
		return this.get("-z-sprite-sheet-image").set("url(" + url + ")").get("-z-sprite-sheet-width").set( width );
	}
	@:extern public inline function crop( x : Float, y : Float, width : Float, height : Float ) : Style {
		
		return this.get("-z-sprite-sheet-crop").set( Std.string( x ) + " " + Std.string( y ) + " " + Std.string( width ) + " " + Std.string( height ));
	}
	@:extern public inline function width( v : Float ) : Style {
		
		return this.get("-z-sprite-width").set( v );
	}
	@:extern public inline function height( v : Float ) : Style {
		
		return this.get("-z-sprite-height").set( v );
	}
	@:extern public inline function fitSquare( v : Float ) : Style {
		
		return this.get("-z-sprite-fit-square").set( v );
	}
}