package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;
import zcale.types.mixed.FloatOrString;

abstract Text( BaseStyle ) from BaseStyle {
	
	@:extern public var align( 		get, never ) : TextAlign;
	@:extern public var decoration( get, never ) : TextDecoration;	
	@:extern public var indent( 	get, never ) : Property<FloatOrString>;	
	@:extern public var overflow( 	get, never ) : TextOverflow;
	@:extern public var shadow( 	get, never ) : TextShadow;
	@:extern public var transform( 	get, never ) : TextTransform;
	
	@:extern private inline function get_align() 		: TextAlign 				return this.get("text-align");
	@:extern private inline function get_decoration() 	: TextDecoration			return this.get("text-decoration");
	@:extern private inline function get_indent() 		: Property<FloatOrString> 	return this.get("text-indent");	
	@:extern private inline function get_overflow() 	: TextOverflow 				return this.get("text-overflow");
	@:extern private inline function get_shadow() 		: TextShadow 				return this.get("text-shadow");
	@:extern private inline function get_transform()	: TextTransform				return this.get("text-transform");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract TextAlign( Property<String> ) from DynamicProperty {
	
	@:extern public inline function left()    : Style return this.set("left");
	@:extern public inline function right()   : Style return this.set("right");
	@:extern public inline function center()  : Style return this.set("center");
	@:extern public inline function justify() : Style return this.set("justify");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract TextDecoration( Property<String> ) from DynamicProperty {

	@:extern public inline function none()    	  : Style return this.set("none");
	@:extern public inline function underline()   : Style return this.set("underline");
	@:extern public inline function overline()    : Style return this.set("overline");
	@:extern public inline function lineThrough() : Style return this.set("line-through");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract TextOverflow( Property<String> ) from DynamicProperty {

	@:extern public inline function clip()     : Style return this.set("clip");
	@:extern public inline function ellipsis() : Style return this.set("ellipsis");
	@:extern public inline function string()   : Style return this.set("string");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract TextShadow( Property<String> ) from DynamicProperty {

	@:extern public inline function set( 
		xOffset : FloatOrString, 
		yOffset : FloatOrString, 
		?radius : FloatOrString = "",
		?color 	: String = "" ) : Style {
		
			return this.set( 
				Property.valueToString( xOffset, Style.UNITS ) + " " +
				Property.valueToString( yOffset, Style.UNITS ) + " " +
				Property.valueToString( radius,  Style.UNITS ) + " " + color );
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract TextTransform( Property<String> ) from DynamicProperty {

	@:extern public inline function none()     	 : Style return this.set("none");
	@:extern public inline function capitalize() : Style return this.set("capitalize");
	@:extern public inline function uppercase()  : Style return this.set("uppercase");
	@:extern public inline function lowercase()  : Style return this.set("lowercase");
}