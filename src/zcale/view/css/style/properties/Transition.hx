package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.SelectedProperty;

@:forward( set, value )

abstract Transition( SelectedProperty<String> ) from SelectedProperty<String> {
	
	@:extern public var delay( 			get, never ) : Property<String>;
	@:extern public var duration( 		get, never ) : Property<String>;
	@:extern public var property( 		get, never ) : Property<String>;
	@:extern public var timingFunction( get, never ) : Property<String>;
	
	@:extern private inline function get_delay() 		  : Property<String> return this.get("delay");
	@:extern private inline function get_duration() 	  : Property<String> return this.get("duration");
	@:extern private inline function get_property() 	  : Property<String> return this.get("property");
	@:extern private inline function get_timingFunction() : Property<String> return this.get("timing-function");
}