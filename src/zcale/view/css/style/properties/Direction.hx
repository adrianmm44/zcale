package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

@:forward( value )

abstract Direction( Property<String> ) from DynamicProperty {
	
	@:extern public inline function leftToRight()  : Style return this.set("ltr");
	@:extern public inline function rightToLeft()  : Style return this.set("rtl");
}