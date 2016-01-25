package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

abstract Align( BaseStyle ) from BaseStyle {
	
	@:extern public var content( get, never ) : AlignProperty;
	@:extern public var items( 	 get, never ) : AlignProperty;
	@:extern public var self( 	 get, never ) : AlignSelf;
	
	@:extern private inline function get_content() : AlignProperty return this.get("align-content");
	@:extern private inline function get_items()   : AlignProperty return this.get("align-items");
	@:extern private inline function get_self()    : AlignSelf 	   return this.get("align-self");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract AlignProperty( Property<String> ) from DynamicProperty {
	
	@:extern public inline function stretch()      : Style return this.set("stretch");
	@:extern public inline function center()       : Style return this.set("center");
	@:extern public inline function flexStart()    : Style return this.set("flex-start");
	@:extern public inline function flexEnd()      : Style return this.set("flex-end");
	@:extern public inline function spaceBetween() : Style return this.set("space-between");
	@:extern public inline function spaceAround()  : Style return this.set("space-around");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract AlignSelf( Property<String> ) from DynamicProperty {
	
	@:extern public inline function auto() 		   : Style return this.set("auto");
	@:extern public inline function stretch()      : Style return this.set("stretch");
	@:extern public inline function center()       : Style return this.set("center");
	@:extern public inline function flexStart()    : Style return this.set("flex-start");
	@:extern public inline function flexEnd()      : Style return this.set("flex-end");
	@:extern public inline function baseline() 	   : Style return this.set("baseline");
}