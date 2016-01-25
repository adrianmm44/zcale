package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

@:forward( value )

abstract Clear( Property<String> ) from DynamicProperty {
	
	@:extern public inline function none()  : Style return this.set("none");
	@:extern public inline function left()  : Style return this.set("left");
	@:extern public inline function right() : Style return this.set("right");
	@:extern public inline function both()  : Style return this.set("both");
}