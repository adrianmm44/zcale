
package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;
import zcale.view.css.style.property.SelectedProperty;
import zcale.types.mixed.FloatOrString;

@:forward( set, value )

abstract Perspective( SelectedProperty<FloatOrString> ) from SelectedProperty<FloatOrString> {
	
	@:extern public var origin( get, never ) : PerspectiveOrigin;
	
	@:extern private inline function get_origin() : PerspectiveOrigin return this.get("origin");
	
	@:extern public inline function auto() : Style return this.set("auto");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract PerspectiveOrigin( Property<String> ) from DynamicProperty {
	
	@:extern public inline function xy( x : String, y : String ) : Style {
		
		return this.set( x + " " + y );
	}
	@:extern public inline function left()   : Style return this.set("left");
	@:extern public inline function center() : Style return this.set("center");
	@:extern public inline function right()  : Style return this.set("right");
}