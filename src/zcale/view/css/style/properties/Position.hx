package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

@:forward( value )

abstract Position( Property<String> ) from DynamicProperty {
	
	@:extern public inline function statical() : Style return this.set("static");
	@:extern public inline function absolute() : Style return this.set("absolute");
	@:extern public inline function relative() : Style return this.set("relative");
	@:extern public inline function fixed()    : Style return this.set("fixed");
}