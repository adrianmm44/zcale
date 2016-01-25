package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

@:forward( value )

abstract Quotes( Property<String> ) from DynamicProperty {
	
	@:extern public inline function set( a1 : String, a2 : String, ?b1 : String, ?b2 : String ) : Style {
		
		return this.set( QuotesTools.setQuotes( a1, a2, b1, b2 ) );
	}	
	@:extern public inline function none() : Style return this.set("none");
}

class QuotesTools {
	
	public static function setQuotes( a1 : String, a2 : String, ?b1 : String, ?b2 : String ) : String {
		
		var s : String = '"' + a1 + '" "' + a2 + '"';
		
		if( b1 != null && b2 != null ) {
			
			s += ' "' + b1 + '" "' + b2 + '"';
		}		
		return s;
	}
}