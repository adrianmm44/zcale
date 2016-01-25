package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

@:forward( value )

abstract JustifyContent( Property<String> ) from DynamicProperty {
	
	@:extern public inline function flexStart()    : Style return this.set("flex-start");	
	@:extern public inline function flexEnd() 	   : Style return this.set("flex-end");
	@:extern public inline function center() 	   : Style return this.set("center");
	@:extern public inline function spaceBetween() : Style return this.set("space-between");
	@:extern public inline function spaceAround()  : Style return this.set("space-around");
}