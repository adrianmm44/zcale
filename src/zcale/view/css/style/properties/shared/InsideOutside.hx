package zcale.view.css.style.properties.shared;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

@:forward( value )

abstract InsideOutside( Property<String> ) from DynamicProperty {

	@:extern public inline function inside()  : Style return this.set("inside");
	@:extern public inline function outside() : Style return this.set("outside");
}