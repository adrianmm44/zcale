package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;
import zcale.view.css.style.property.SelectedProperty;
import zcale.view.css.style.properties.Color;
import zcale.view.css.style.properties.border.BorderEdge;
import zcale.types.mixed.FloatOrString;
import zcale.types.mixed.IntOrString;

abstract Column( BaseStyle ) from BaseStyle {
	
	@:extern public var value( get, set   ) : String;
	@:extern public var count( get, never ) : ColumnCount;
	@:extern public var gap(   get, never ) : ColumnGap;
	@:extern public var rule(  get, never ) : ColumnRule;
	@:extern public var span(  get, never ) : ColumnSpan;
	@:extern public var width( get, never ) : ColumnWidth;
	
	@:extern public inline function set( width : FloatOrString, count : IntOrString = "auto" ) : Style {
		
		return this.get("columns").set( Property.valueToString( width, Style.UNITS ) + " " + Property.valueToString( count ));
	}
	@:extern private inline function get_value() : String {
		
		return this.get("columns").value;
	}
	@:extern private inline function set_value( v : String ) : String {
		
		return this.get("columns").value = v;
	}	
	@:extern private inline function get_count() : ColumnCount return this.get("column-count");
	@:extern private inline function get_gap() 	 : ColumnGap   return this.get("column-gap", Style.UNITS );
	@:extern private inline function get_rule()  : ColumnRule  return this.select("column-rule");
	@:extern private inline function get_span()  : ColumnSpan  return this.get("column-span");
	@:extern private inline function get_width() : ColumnWidth return this.get("column-width", Style.UNITS );
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract ColumnCount( Property<FloatOrString> ) from DynamicProperty {
	
	@:extern public inline function auto() : Style return this.set("auto");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract ColumnGap( Property<FloatOrString> ) from DynamicProperty {
	
	@:extern public inline function normal() : Style return this.set("normal");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( set, value, color, style, width )

abstract ColumnRule( BorderEdge ) from BorderEdge {
	
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract ColumnSpan( Property<String> ) from DynamicProperty {
	
	@:extern public inline function one()  : Style return this.set("one");
	@:extern public inline function all()  : Style return this.set("all");
	@:extern public inline function none() : Style return this.set("none");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract ColumnWidth( Property<FloatOrString> ) from DynamicProperty {
	
    @:extern public inline function auto() : Style return this.set("auto");
}