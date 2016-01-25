package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

abstract PageBreak( BaseStyle ) from BaseStyle {
	
	@:extern public var after(  get, never ) : PageBreakState;
	@:extern public var before( get, never ) : PageBreakState;
	@:extern public var inside( get, never ) : PageBreakInside;
	
	@:extern private inline function get_after()  : PageBreakState  return this.get("page-break-after");
	@:extern private inline function get_before() : PageBreakState  return this.get("page-break-before");
	@:extern private inline function get_inside() : PageBreakInside return this.get("page-break-inside");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract PageBreakState( Property<String> ) from DynamicProperty {
	
	@:extern public inline function auto()   : Style return this.set("auto"); 	// Automatic page breaks
	@:extern public inline function avoid()  : Style return this.set("avoid"); 	// Avoid page break after the element (if possible)
	@:extern public inline function always() : Style return this.set("always"); // Always insert a page break after the element
	@:extern public inline function left()   : Style return this.set("left"); 	// Insert page breaks after the element so that the next page is formatted as a left page
	@:extern public inline function right()  : Style return this.set("right"); 	// Insert page breaks after the element so that the next page is formatted as a right page
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract PageBreakInside( Property<String> ) from DynamicProperty {
	
	@:extern public inline function auto()   : Style return this.set("auto"); 	// Automatic page breaks
	@:extern public inline function avoid()  : Style return this.set("avoid"); 	// Avoid page break after the element (if possible)
}