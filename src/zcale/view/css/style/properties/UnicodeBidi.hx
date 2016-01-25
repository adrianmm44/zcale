package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

@:forward( value )

abstract UnicodeBidi( Property<String> ) from DynamicProperty {
	
	@:extern public inline function normal() : Style return this.set("normal");
	@:extern public inline function embed()  : Style return this.set("embed");
	@:extern public inline function bidiOverride()  : Style return this.set("bidi-override");
}