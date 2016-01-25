package zcale.view.css.style.properties.border;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

@:forward( value )

abstract BorderStyle( Property<String> ) from DynamicProperty {
	
	@:extern public inline function none() 	 : Style return this.set("none");   // Default value. Specifies no border
	@:extern public inline function hidden() : Style return this.set("hidden"); // The same as "none", except in border conflict resolution for table elements		
	@:extern public inline function dotted() : Style return this.set("dotted"); // Specifies a dotted border	
	@:extern public inline function dashed() : Style return this.set("dashed"); // Specifies a dashed border
	@:extern public inline function solid()  : Style return this.set("solid");  // Specifies a solid border
	@:extern public inline function double() : Style return this.set("double"); // Specifies a double border
	@:extern public inline function groove() : Style return this.set("groove"); // Specifies a 3D grooved border. The effect depends on the border-color value
	@:extern public inline function ridge()  : Style return this.set("ridge");  // Specifies a 3D ridged border. The effect depends on the border-color value
	@:extern public inline function inset()  : Style return this.set("inset");  // Specifies a 3D inset border. The effect depends on the border-color value
	@:extern public inline function outset() : Style return this.set("outset"); // Specifies a 3D outset border. The effect depends on the border-color value
}