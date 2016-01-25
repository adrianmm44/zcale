package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;
import zcale.view.css.style.property.SelectedProperty;
import zcale.view.css.style.properties.Color;
import zcale.view.css.style.properties.box.BoxSizing;
import zcale.view.css.style.properties.shared.Image;
import zcale.types.mixed.FloatOrString;

@:forward( set, value )
@:access( zcale.view.css.style.Property )

abstract Background( SelectedProperty<String> ) from SelectedProperty<String> {
	
	@:extern public var attachment(  get, never ) : BgAttachment;
	@:extern public var clip( 		 get, never ) : BoxSizing;
	@:extern public var color( 		 get, never ) : Color;	
	@:extern public var image( 	  	 get, never ) : Image;
	@:extern public var origin( 	 get, never ) : BoxSizing;
	@:extern public var position( 	 get, never ) : BgPosition;
	@:extern public var repeat( 	 get, never ) : BgRepeat;
	
	@:extern public inline function url( v : String, settings : String = "" ) : Style {
		
		return this.set("url(" + v + ") " + settings );
	}
	@:extern private inline function get_attachment()  : BgAttachment return this.get("attachment");
	@:extern private inline function get_clip() 	   : BoxSizing	  return this.get("clip");
	@:extern private inline function get_color() 	   : Color 		  return this.get("color");
	@:extern private inline function get_image() 	   : Image 	 	  return this.get("image");
	@:extern private inline function get_origin() 	   : BoxSizing 	  return this.get("origin");
	@:extern private inline function get_position()    : BgPosition   return this.get("position");
	@:extern private inline function get_repeat()      : BgRepeat 	  return this.get("repeat");
		
	#if (( ie >= 9 ) && ( firefox >= 3.6 ) && ( safari >= 3 ) && ( opera >= 10 ) && ( android >= 2.3 ) || build )
	
		@:extern public var size( get, never ) : BgSize;
		
		@:extern private inline function get_size() : BgSize {
			
			return this.get("size", Style.UNITS )
			
			#if (( firefox < 4 ) || ( chrome < 4 ) || ( safari < 4.1 ) || ( opera < 10.5 ))
			
				.prefix(["webkit","moz","o"])
			#end
			;
		}
	#end
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract BgAttachment( Property<String> ) from DynamicProperty {

	@:extern public inline function scroll() : Style return this.set("scroll");
	@:extern public inline function fixed()  : Style return this.set("fixed");
	
	#if (( ie >= 9 ) && ( firefox >= 25 ) && ( chrome >= 4 ) && ( safari >= 5 ) && ( opera >= 10.5 ) || build )
	
		@:extern public inline function local()  : Style return this.set("local");
	#end
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract BgPosition( Property<String> ) from DynamicProperty {
	
	@:extern public inline function set( x : FloatOrString, y : FloatOrString ) : Style {
		
		return this.set( Property.valueToString( x, Style.UNITS ) + " " + Property.valueToString( y, Style.UNITS ));
	}	
	@:extern public inline function leftTop() 	   : Style return this.set("left top");
	@:extern public inline function leftCenter()   : Style return this.set("left center");	
	@:extern public inline function leftBottom()   : Style return this.set("left bottom");	
	@:extern public inline function rightTop() 	   : Style return this.set("right top");	
	@:extern public inline function rightCenter()  : Style return this.set("right center");		
	@:extern public inline function rightBottom()  : Style return this.set("right bottom");	
	@:extern public inline function centerTop()    : Style return this.set("center top");	
	@:extern public inline function center() 	   : Style return this.set("center center");	
	@:extern public inline function centerBottom() : Style return this.set("center bottom");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract BgRepeat( Property<String> ) from DynamicProperty {
		
	@:extern public inline function xy() : Style return this.set("repeat");
	@:extern public inline function x()  : Style return this.set("repeat-x");
	@:extern public inline function y()  : Style return this.set("repeat-y");
	@:extern public inline function no() : Style return this.set("no-repeat");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward
@:access( zcale.view.css.style.Property )

abstract BgSize( Property<String> ) from DynamicProperty {
	
	@:extern public inline function set( width : FloatOrString = "auto", height : FloatOrString = "auto" ) : Style {
		
		return this.set( Property.valueToString( width, Style.UNITS ) + " " + Property.valueToString( height, Style.UNITS ));
	}	
	@:extern public inline function auto() 	  : Style return this.set("auto");		
	@:extern public inline function cover()   : Style return this.set("cover");		
	@:extern public inline function contain() : Style return this.set("contain");
}