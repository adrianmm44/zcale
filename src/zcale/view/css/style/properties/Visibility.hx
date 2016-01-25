package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

@:forward( value )

abstract Visibility( Property<String> ) from DynamicProperty {
	
	@:extern public inline function visible()  : Style return this.set("visible");
	@:extern public inline function hidden()   : Style return this.set("hidden");
	@:extern public inline function collapse() : Style return this.set("collapse");
}