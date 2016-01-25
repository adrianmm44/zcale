package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

@:forward( value )

abstract Content( Property<String> ) from DynamicProperty {
	
	@:extern public inline function set( v : String ) : Style {
		
		return this.set('"' + v + '"');
	}	
	@:extern public inline function counter( v : String ) : Style {
		
		return this.set("counter(" + v + ")");
	}
	@:extern public inline function attr( v : String ) : Style {
		
		return this.set("attr(" + v + ")");
	}
	@:extern public inline function url( v : String ) : Style {
		
		return this.set("url(" + v + ")");
	}
	@:extern public inline function none() 		   : Style return this.set("none");
	@:extern public inline function normal() 	   : Style return this.set("normal");
	@:extern public inline function openQuote()    : Style return this.set("open-quote");
	@:extern public inline function closeQuote()   : Style return this.set("close-quote");
	@:extern public inline function noOpenQuote()  : Style return this.set("no-open-quote");
	@:extern public inline function noCloseQuote() : Style return this.set("no-close-quote");	
}