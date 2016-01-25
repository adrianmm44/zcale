package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;
import zcale.types.mixed.FloatOrString;

abstract Word( BaseStyle ) from BaseStyle {
	
	@:extern public var breaking( get, never ) : WordBreak;
	@:extern public var spacing(  get, never ) : WordSpacing;
	@:extern public var wrap( 	  get, never ) : WordWrap;
	
	@:extern private inline function get_breaking() : WordBreak   return this.get("word-break");
	@:extern private inline function get_spacing() 	: WordSpacing return this.get("word-spacing");
	@:extern private inline function get_wrap() 	: WordWrap    return this.get("word-wrap");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract WordBreak( Property<String> ) from DynamicProperty {
	
	@:extern public inline function normal()   : Style return this.set("normal");
	@:extern public inline function breakAll() : Style return this.set("break-all");
	@:extern public inline function keepAll()  : Style return this.set("keep-all");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract WordSpacing( Property<FloatOrString> ) from DynamicProperty {
	
	@:extern public inline function normal() : Style return this.set("normal");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract WordWrap( Property<String> ) from DynamicProperty {
	
	@:extern public inline function normal() 	: Style return this.set("normal");
	@:extern public inline function breakWord() : Style return this.set("break-word");
}