package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;
import zcale.types.mixed.FloatOrString;

@:forward

abstract VerticalAlign( Property<FloatOrString> ) from DynamicProperty {
	
	@:extern public inline function baseline() 	 : Style return this.set("baseline");
	@:extern public inline function sub() 		 : Style return this.set("sub");
	@:extern public inline function super() 	 : Style return this.set("super");
	@:extern public inline function top() 	 	 : Style return this.set("top");
	@:extern public inline function textTop() 	 : Style return this.set("text-top");
	@:extern public inline function middle() 	 : Style return this.set("middle");
	@:extern public inline function bottom() 	 : Style return this.set("bottom");
	@:extern public inline function textBottom() : Style return this.set("text-bottom");
}