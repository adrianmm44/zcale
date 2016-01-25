package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;
import zcale.types.mixed.FloatOrString;

abstract Font( BaseStyle ) from BaseStyle {
	
	@:extern public var value(   get, set 	) : String;
	@:extern public var family(  get, never ) : FontFamily;
	@:extern public var size(    get, never ) : FontSize;
	@:extern public var style( 	 get, never ) : FontStyle;
	@:extern public var variant( get, never ) : FontVariant;
	@:extern public var weight(  get, never ) : FontWeight;
	
	@:extern public inline function set( v : String ) : Style {
		
		return this.get("font").set( v );
	}
	@:extern public inline function all( size : FloatOrString, ?lineHeight : FloatOrString, ?style : String = "" ) : Style {
		
		return this.get("font").set( FontTools.setFont( size, lineHeight ) + " " + style );
	}
	@:extern private inline function set_value( v : String ) : String {
		
		return this.get("font").value = v;
	}
	@:extern private inline function get_value() : String {
		
		return this.get("font").value;
	}
	@:extern private inline function get_family()  : FontFamily  return this.get("font-family");
	@:extern private inline function get_size()    : FontSize 	 return this.get("font-size",  Style.UNITS );
	@:extern private inline function get_style()   : FontStyle   return this.get("font-style");
	@:extern private inline function get_variant() : FontVariant return this.get("font-variant");
	@:extern private inline function get_weight()  : FontWeight  return this.get("font-weight");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

class FontTools {
	
	public static function setFont( size : FloatOrString, ?lineHeight : FloatOrString ) : String {
		
		var s : String = Property.valueToString( size, Style.UNITS );
		if( lineHeight != null ) {
			s += "/" + Property.valueToString( lineHeight, Style.UNITS );
		}
		return s;
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract FontFamily( Property<String> ) from DynamicProperty {
	
	// Serif Fonts
	
	@:extern public inline function Georgia() 		   : Style return this.set('Georgia, serif');
	@:extern public inline function PalatinoLinotype() : Style return this.set('"Palatino Linotype", "Book Antiqua", Palatino, serif');
	@:extern public inline function TimesNewRoman()    : Style return this.set('"Times New Roman", Times, serif');
	
	// Sans-Serif Fonts
	
	@:extern public inline function Arial()  		   : Style return this.set('Arial, Helvetica, sans-serif');
	@:extern public inline function ArialBlack()  	   : Style return this.set('"Arial Black", Gadget, sans-serif');
	@:extern public inline function ComicSans()  	   : Style return this.set('"Comic Sans MS", cursive, sans-serif');
	@:extern public inline function Impact()  		   : Style return this.set('Impact, Charcoal, sans-serif');
	@:extern public inline function LucidaSans() 	   : Style return this.set('"Lucida Sans Unicode", "Lucida Grande", sans-serif');
	@:extern public inline function Tahoma() 		   : Style return this.set('Tahoma, Geneva, sans-serif');
	@:extern public inline function Trebuchet() 	   : Style return this.set('"Trebuchet MS", Helvetica, sans-serif');
	@:extern public inline function Verdana() 		   : Style return this.set('Verdana, Geneva, sans-serif');
	
	// Monospace Fonts
	
	@:extern public inline function CourierNew()	   : Style return this.set('"Courier New", Courier, monospace');
	@:extern public inline function LucidaConsole()	   : Style return this.set('"Lucida Console", Monaco, monospace');
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract FontSize( Property<FloatOrString> ) from DynamicProperty {
	
	@:extern public inline function xxSmall() : Style return this.set("xx-small");
	@:extern public inline function xSmall()  : Style return this.set("x-small");
	@:extern public inline function small()   : Style return this.set("small");	
	@:extern public inline function medium()  : Style return this.set("medium");	
	@:extern public inline function large()   : Style return this.set("small");
	@:extern public inline function xLarge()  : Style return this.set("x-large");
	@:extern public inline function xxLarge() : Style return this.set("xx-large");	
	@:extern public inline function smaller() : Style return this.set("smaller");
	@:extern public inline function larger()  : Style return this.set("larger");	
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract FontStyle( Property<String> ) from DynamicProperty {
	
	@:extern public inline function normal()  : Style return this.set("normal");
	@:extern public inline function italic()  : Style return this.set("italic");
	@:extern public inline function oblique() : Style return this.set("oblique");	
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract FontVariant( Property<String> ) from DynamicProperty {
	
	@:extern public inline function normal() 	: Style return this.set("normal");
	@:extern public inline function smallCaps() : Style return this.set("small-caps");		
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract FontWeight( Property<String> ) from DynamicProperty {
	
	@:extern public inline function normal()  : Style return this.set("normal");
	@:extern public inline function bold() 	  : Style return this.set("bold");
	@:extern public inline function bolder()  : Style return this.set("bolder");
	@:extern public inline function lighter() : Style return this.set("lighter");
	@:extern public inline function v1() 	  : Style return this.set("100");
	@:extern public inline function v2() 	  : Style return this.set("200");
	@:extern public inline function v3() 	  : Style return this.set("300");
	@:extern public inline function v4() 	  : Style return this.set("400");
	@:extern public inline function v5() 	  : Style return this.set("500");
	@:extern public inline function v6() 	  : Style return this.set("600");
	@:extern public inline function v7() 	  : Style return this.set("700");
	@:extern public inline function v8() 	  : Style return this.set("800");
	@:extern public inline function v9() 	  : Style return this.set("900");
}