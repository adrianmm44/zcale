package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;
import zcale.types.mixed.FloatOrString;

@:forward( value )

abstract LineHeight( Property<FloatOrString> ) from DynamicProperty {
	
	@:extern public inline function set( v : FloatOrString ) : Style {
		
		return this.set( Property.valueToString( v, Style.UNITS ) );
	}
	@:extern public inline function ratio( v : Float ) : Style {
		
		return this.set( v );
	}
}