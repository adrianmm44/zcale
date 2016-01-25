package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

@:forward( value )

abstract WhiteSpace( Property<String> ) from DynamicProperty {
	
	@:extern public inline function normal()  : Style return this.set("normal");
	@:extern public inline function nowrap()  : Style return this.set("nowrap");
	@:extern public inline function pre() 	  : Style return this.set("pre");
	@:extern public inline function preLine() : Style return this.set("pre-line");
	@:extern public inline function preWrap() : Style return this.set("pre-wrap");
}