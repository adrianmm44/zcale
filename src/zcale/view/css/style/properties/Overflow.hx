package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;
import zcale.view.css.style.property.SelectedProperty;

@:forward( value )

abstract Overflow( SelectedProperty<String> ) from SelectedProperty<String> {
	
	@:extern public var x( get, never ) : OverflowProperty;
	@:extern public var y( get, never ) : OverflowProperty;
	
	@:extern private inline function get_x()  : OverflowProperty return this.get("x");
	@:extern private inline function get_y()  : OverflowProperty return this.get("y");
	
	@:extern public inline function visible() : Style return this.set("visible");
	@:extern public inline function hidden()  : Style return this.set("hidden");
	@:extern public inline function scroll()  : Style return this.set("scroll");
	@:extern public inline function auto()    : Style return this.set("auto");
}

abstract OverflowProperty( Property<String> ) from DynamicProperty {
	
	@:extern public inline function visible() : Style return this.set("visible");
	@:extern public inline function hidden()  : Style return this.set("hidden");
	@:extern public inline function scroll()  : Style return this.set("scroll");
	@:extern public inline function auto()    : Style return this.set("auto");
}