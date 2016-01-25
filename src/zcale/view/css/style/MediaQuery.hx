package zcale.view.css.style;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;

@:forward

abstract MediaQuery( MediaQueryBase ) {
	
	@:extern public inline function new() {
		
		this = new MediaQueryBase();
	}	
	@:extern public inline function sm() : Style return new BaseStyle( "", "screen and ( min-width: 768px )" );
	@:extern public inline function md() : Style return new BaseStyle( "", "screen and ( min-width: 992px )" );		
	@:extern public inline function lg() : Style return new BaseStyle( "", "screen and ( min-width: 1200px )" );
}

class MediaQueryBase {
	
	public function new() {}
	
	public function width( minWidth : Float, maxWidth : Float ) : Style {
		
		return new BaseStyle( "", "screen and ( min-width: " + Std.string( minWidth ) + "px ) and ( max-width: " + Std.string( maxWidth -1 ) + "px )" );
	}	
	public function minWidth(  width : Float ) : Style {
		
		return new BaseStyle( "", "screen and ( min-width: " + Std.string( width ) + "px )" );
	}	
	public function maxWidth(  width : Float ) : Style {
		
		return new BaseStyle( "", "screen and ( max-width: " + Std.string( width - 1 ) + "px )" );
	}
}