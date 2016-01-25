package zcale.view.css.style.properties.shared;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

@:forward( value )

abstract TopBottom( Property<String> ) from DynamicProperty {

	@:extern public inline function top() 	 : Style return this.set("top");
	@:extern public inline function bottom() : Style return this.set("bottom");
}