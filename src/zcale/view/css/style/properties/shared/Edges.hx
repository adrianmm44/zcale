package zcale.view.css.style.properties.shared;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.SelectedProperty;
import zcale.types.mixed.FloatOrString;

@:forward( set, value )

abstract Edges( SelectedProperty<FloatOrString> ) from SelectedProperty<FloatOrString> {
	
	@:extern public var top(    get, never ) : Property<FloatOrString>; // percentage does not work
	@:extern public var right(  get, never ) : Property<FloatOrString>;
	@:extern public var bottom( get, never ) : Property<FloatOrString>; // percentage does not work
	@:extern public var left(   get, never ) : Property<FloatOrString>;
		
	@:extern private inline function get_top() 	  : Property<FloatOrString> return this.get("top", 	 Style.UNITS );
	@:extern private inline function get_right()  : Property<FloatOrString> return this.get("right",  Style.UNITS );	
	@:extern private inline function get_bottom() : Property<FloatOrString> return this.get("bottom", Style.UNITS );
	@:extern private inline function get_left()   : Property<FloatOrString> return this.get("left", 	 Style.UNITS );
	
	@:extern public inline function all( top : FloatOrString, right : FloatOrString, bottom : FloatOrString, left : FloatOrString ) : Style {
		
		return this.set(
			Property.valueToString( top, 	Style.UNITS ) + " " + 
			Property.valueToString( right, 	Style.UNITS ) + " " + 
			Property.valueToString( bottom, Style.UNITS ) + " " + 
			Property.valueToString( left, 	Style.UNITS )
		);
	}
	@:extern public inline function xy( x : FloatOrString, y : FloatOrString ) : Style {
		
		return this.set( Property.valueToString( y, Style.UNITS )  + " " + Property.valueToString( x, Style.UNITS ));
	}
}
/*/
@:extern public inline function auto() : Style return this.set("auto");
/*/