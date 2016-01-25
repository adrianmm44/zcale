package zcale.view.css.style.properties;

import zcale.view.css.style.Property;
import zcale.view.css.style.property.SelectedProperty;
import zcale.view.css.style.properties.Color;
import zcale.view.css.style.properties.border.BorderStyle;
import zcale.view.css.style.properties.border.BorderWidth;
import zcale.types.mixed.FloatOrString;

@:forward( value )

abstract Outline( SelectedProperty<String> ) from SelectedProperty<String> {
	
	@:extern public var color( get, never ) : Color;
	@:extern public var style( get, never ) : BorderStyle;
	@:extern public var width( get, never ) : BorderWidth;
	
	@:extern public inline function set( color : String, width : FloatOrString = "thin", style : String = "solid"  ) : Style {
		
		return this.set( Property.valueToString( width, Style.UNITS ) + " " + style + " " + color );
	}
	@:extern private inline function get_color() : Color 	   return this.get("color");	
	@:extern private inline function get_style() : BorderStyle return this.get("style");
	@:extern private inline function get_width() : BorderWidth return this.get("width", Style.UNITS );
}
