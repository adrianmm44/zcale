package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;
import zcale.view.css.style.properties.box.BoxSizing;
import zcale.types.mixed.FloatOrString;

@:forward( set, value )

abstract Box( BaseStyle ) from BaseStyle {
	
	@:extern public var shadow( get, never ) : BoxShadow;
	@:extern public var sizing( get, never ) : BoxSizing;
	
	@:extern private inline function get_shadow() : BoxShadow return this.get("box-shadow");
	@:extern private inline function get_sizing() : BoxSizing return this.get("box-sizing");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract BoxShadow( Property<String> ) from DynamicProperty {
	
	@:extern public inline function set( 
		xShadow : FloatOrString, 
		yShadow : FloatOrString, 
		blur 	: FloatOrString = "",
		color 	: String = "",
		inset	: Bool = false ) : Style {
		
		return this.set(
			Property.valueToString( xShadow, Style.UNITS ) + " " +
			Property.valueToString( yShadow, Style.UNITS ) + " " +
			Property.valueToString( blur, 	 Style.UNITS ) + " " +
			color + " " + BoxShadowTools.inset( inset )
		);
	}
	@:extern public inline function none() : Style return this.set("none");
}

class BoxShadowTools {
		
	public static function inset( v : Bool ) : String return ( v ) ? "inset" : "";
}