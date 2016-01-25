package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;
import zcale.view.css.style.Property;
import zcale.types.mixed.FloatOrString;

abstract Height( BaseStyle ) from BaseStyle {
	
	@:extern public var value( get, set   ) : FloatOrString;
	@:extern public var max(   get, never ) : Property<FloatOrString>;
	@:extern public var min(   get, never ) : Property<FloatOrString>;
	
	@:extern public inline function set( v : FloatOrString ) : Style {
		
		return this.get("height", Style.UNITS ).set( v );
	}
	@:extern public inline function auto() : Style {
		
		return this.get("height", Style.UNITS ).set("auto");
	}
	@:extern private inline function set_value( v : FloatOrString ) : FloatOrString {
		
		return this.get("height", Style.UNITS ).value = v;
	}
	@:extern private inline function get_value() : FloatOrString {
		
		return this.get("height", Style.UNITS ).value;
	}	
	@:extern private inline function get_max() : Property<FloatOrString> {
		
		return this.get("max-height", Style.UNITS );
	}
	@:extern private inline function get_min() : Property<FloatOrString> {
		
		return this.get("min-height", Style.UNITS );
	}
}