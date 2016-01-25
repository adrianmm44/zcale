package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;
import zcale.types.mixed.FloatOrString;

@:forward( value )

abstract Clip( Property<String> ) from DynamicProperty {
	
	@:extern public inline function rect( 
		top    : FloatOrString, 
		right  : FloatOrString,
		bottom : FloatOrString,
		left   : FloatOrString )  : Style {
					
		return this.set( 
			Property.valueToString( top,    Style.UNITS ) + " " +
			Property.valueToString( right,  Style.UNITS ) + " " +
			Property.valueToString( bottom, Style.UNITS ) + " " +
			Property.valueToString( left,   Style.UNITS )
		);
	}
	@:extern public inline function auto() : Style return this.set("auto");
}