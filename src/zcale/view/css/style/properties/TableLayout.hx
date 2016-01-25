package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

@:forward( value )

abstract TableLayout( Property<String> ) from DynamicProperty {
	
	@:extern public inline function auto() 	: Style return this.set("auto");
	@:extern public inline function fixed() : Style return this.set("fixed");
}