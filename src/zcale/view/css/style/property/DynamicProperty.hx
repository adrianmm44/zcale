package zcale.view.css.style.property;

import zcale.view.css.style.Property;

@:forward

abstract DynamicProperty( Property<Dynamic> ) from Property<Dynamic> to Dynamic {
	
	@:extern public inline function new( style : Style, name : String, ?units : String )  {
		
		this = new Property<Dynamic>( style, name, units );
	}
}