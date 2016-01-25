
package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.SelectedProperty;

@:forward( set, value )

abstract Transform( SelectedProperty<String> ) from SelectedProperty<String> {
	
	@:extern public var origin( get, never ) : Property<String>;
	@:extern public var style( 	get, never ) : Property<String>;
	
	@:extern private inline function get_origin() : Property<String> return this.get("origin");
	@:extern private inline function get_style()  : Property<String> return this.get("style");	
}