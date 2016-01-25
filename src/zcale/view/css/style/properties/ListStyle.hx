package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;
import zcale.view.css.style.property.SelectedProperty;
import zcale.view.css.style.properties.shared.Image;
import zcale.view.css.style.properties.shared.InsideOutside;
import zcale.types.mixed.FloatOrString;

@:forward( set, value )

abstract ListStyle( SelectedProperty<FloatOrString> ) from SelectedProperty<FloatOrString> {
	
	@:extern public var image( 	  get, never ) : Image;
	@:extern public var position( get, never ) : InsideOutside;
	@:extern public var type( 	  get, never ) : ListStyleType;
	
	@:extern public inline function set( type : String, position : String = ""  ) : Style {
		
		return this.set( type + " " + position );
	}
	@:extern public inline function url( v : String, position : String = ""  ) : Style {
		
		return this.set("url(" + v + ") " + position );
	}
	@:extern private inline function get_image() 	: Image 		return this.get("image");
	@:extern private inline function get_position() : InsideOutside return this.get("position");
	@:extern private inline function get_type() 	: ListStyleType return this.get("type");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract ListStyleType( Property<String> ) from DynamicProperty {
	
	@:extern public inline function none() 		  		 : Style return this.set("none");
	@:extern public inline function disc() 		  		 : Style return this.set("disc");
	@:extern public inline function circle() 	  		 : Style return this.set("circle");
	@:extern public inline function square() 	  		 : Style return this.set("square");
	@:extern public inline function decimal() 	  		 : Style return this.set("decimal");
	@:extern public inline function lowerAalpha() 		 : Style return this.set("lower-alpha");
	@:extern public inline function upperAlpha()  		 : Style return this.set("upper-alpha");
	@:extern public inline function lowerRoman()  		 : Style return this.set("lower-roman");
	@:extern public inline function upperRoman()  		 : Style return this.set("upper-roman");
	
	// ie8	
	@:extern public inline function lowerLatin() 		 : Style return this.set("lower-latin");
	@:extern public inline function upperLatin() 		 : Style return this.set("upper-latin");
	@:extern public inline function lowerGreek() 		 : Style return this.set("lower-greek");
	@:extern public inline function armenian() 		  	 : Style return this.set("armenian");
	@:extern public inline function georgian() 		  	 : Style return this.set("georgian");
	@:extern public inline function decimalLeadingZero() : Style return this.set("lower-latin");
}