package zcale.view.css.style.properties.border;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;
import zcale.types.mixed.FloatOrString;

@:forward

abstract BorderWidth( Property<FloatOrString> ) from DynamicProperty {
	
	@:extern public inline function medium() : Style return this.set("medium");
	@:extern public inline function thin()   : Style return this.set("thin");
	@:extern public inline function thick()  : Style return this.set("thick");
}