package zcale.view.css.style.properties.shared;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

@:forward( value )

abstract Image( Property<String> ) from DynamicProperty {

	@:extern public inline function url( v : String ) : Style return this.set("url(" + v + ")");
	
	@:extern public inline function none() : Style return this.set("none");
}