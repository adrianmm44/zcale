package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

abstract Counter( BaseStyle ) from BaseStyle {
	
	@:extern public var increment( get, never ) : CounterProperty;
	@:extern public var reset( 	   get, never ) : CounterProperty;
	
	@:extern private inline function get_increment() : CounterProperty return this.get("counter-increment");
	@:extern private inline function get_reset() 	 : CounterProperty return this.get("counter-reset");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract CounterProperty( Property<String> ) from DynamicProperty {
	
	@:extern public inline function none() : Style return this.set("none");
}