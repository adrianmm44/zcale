package zcale.view.css.style.properties.shared;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

@:forward( value )

abstract ShowHide( Property<String> ) from DynamicProperty {

	@:extern public inline function show() : Style return this.set("show");
	@:extern public inline function hide() : Style return this.set("hide");
}