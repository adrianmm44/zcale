package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;
import zcale.view.css.style.property.SelectedProperty;
import zcale.view.css.style.properties.shared.LengthOrAuto;
import zcale.types.mixed.FloatOrString;

@:forward( set, value )

abstract Flex( SelectedProperty<FloatOrString> ) from SelectedProperty<FloatOrString> {
	
	@:extern public var basis( 	   get, never ) : LengthOrAuto;
	@:extern public var direction( get, never ) : FlexDirection;
	@:extern public var flow( 	   get, never ) : FlexFlow;
	@:extern public var grow( 	   get, never ) : Property<Int>;
	@:extern public var shrink(    get, never ) : Property<Int>;
	@:extern public var wrap(      get, never ) : FlexWrap;
		
	public inline function all( grow : Int, shrink : Int, basis : FloatOrString = "auto" ) : Style {
		
		return this.set( Std.string( grow ) + " " + Std.string( shrink ) + " " + Property.valueToString( basis, Style.UNITS ));
	}
	@:extern private inline function get_basis() 	 : LengthOrAuto  	return this.get("basis", Style.UNITS );
	@:extern private inline function get_direction() : FlexDirection 	return this.get("direction");
	@:extern private inline function get_flow() 	 : FlexFlow 		return this.get("flow");
	@:extern private inline function get_grow() 	 : Property<Int> 	return this.get("grow");
	@:extern private inline function get_shrink() 	 : Property<Int> 	return this.get("shrink");
	@:extern private inline function get_wrap() 	 : FlexWrap 	 	return this.get("wrap");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract FlexFlow( Property<String> ) from DynamicProperty {
	
	@:extern public inline function set( direction : String, wrap : String ) : Style {
		
		return this.set( direction + " " + wrap );
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract FlexDirection( Property<String> ) from DynamicProperty {
	
	@:extern public inline function row() 			: Style return this.set("row");
	@:extern public inline function rowReverse() 	: Style return this.set("row-reverse");
	@:extern public inline function column() 	 	: Style return this.set("column");
	@:extern public inline function columnReverse() : Style return this.set("column-reverse");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract FlexWrap( Property<String> ) from DynamicProperty {
	
	@:extern public inline function no() 	  : Style return this.set("nowrap");
	@:extern public inline function yes() 	  : Style return this.set("wrap");
	@:extern public inline function reverse() : Style return this.set("wrap-reverse");
}