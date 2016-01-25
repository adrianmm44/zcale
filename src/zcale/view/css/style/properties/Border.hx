package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;
import zcale.view.css.style.property.SelectedProperty;
import zcale.view.css.style.properties.shared.Image;
import zcale.view.css.style.properties.border.BorderEdge;
import zcale.view.css.style.properties.border.BorderStyle;
import zcale.view.css.style.properties.border.BorderWidth;
import zcale.types.mixed.FloatOrString;

@:forward( set, value )

abstract Border( SelectedProperty<String> ) from SelectedProperty<String> {
	
	@:extern public var bottom(   get, never ) : BorderEdgeY;
	@:extern public var collapse( get, never ) : BorderCollapse;
	@:extern public var color(    get, never ) : BorderColor;
	@:extern public var image( 	  get, never ) : BorderImage;	
	@:extern public var left( 	  get, never ) : BorderEdgeX;
	@:extern public var radius(   get, never ) : BorderRadius;
	@:extern public var right( 	  get, never ) : BorderEdgeX;
	@:extern public var spacing(  get, never ) : BorderSpacing;
	@:extern public var style(    get, never ) : BorderStyle;
	@:extern public var top(  	  get, never ) : BorderEdgeY;
	@:extern public var width(    get, never ) : AllBordersWidth;
	
	@:extern public inline function set( color : String, width : FloatOrString = "thin", style : String = "solid"  ) : Style {
		
		return this.set( Property.valueToString( width, Style.UNITS ) + " " + style + " " + color );
	}
	@:extern private inline function get_bottom() 	: BorderEdgeY     return this.select("bottom");
	@:extern private inline function get_collapse() : BorderCollapse  return this.get("collapse");
	@:extern private inline function get_color() 	: BorderColor 	  return this.get("color");
	@:extern private inline function get_image() 	: BorderImage 	  return this;
	@:extern private inline function get_left() 	: BorderEdgeX     return this.select("left");
	@:extern private inline function get_radius() 	: BorderRadius 	  return this.get("radius", Style.UNITS );
	@:extern private inline function get_right() 	: BorderEdgeX     return this.select("right");	
	@:extern private inline function get_spacing()  : BorderSpacing   return this.get("spacing", Style.UNITS );
	@:extern private inline function get_style() 	: BorderStyle 	  return this.get("style");
	@:extern private inline function get_top() 		: BorderEdgeY     return this.select("top");	
	@:extern private inline function get_width() 	: AllBordersWidth return this.get("width",  Style.UNITS );
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( set, value, color, style, width )

abstract BorderEdgeX( BorderEdge ) from BorderEdge {
	
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( set, value, color, style, width )

abstract BorderEdgeY( BorderEdge ) from BorderEdge {
	
	@:extern public var leftRadius(  get, never ) : Property<FloatOrString>;
	@:extern public var rightRadius( get, never ) : Property<FloatOrString>;
	
	@:extern private inline function get_leftRadius()  : Property<FloatOrString> return this.get("left-radius");
	@:extern private inline function get_rightRadius() : Property<FloatOrString> return this.get("right-radius");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract BorderCollapse( Property<String> ) from DynamicProperty {
			
	@:extern public inline function yes() : Style return this.set("collapse"); // Borders are collapsed into a single border when possible (border-spacing and empty-cells properties will be ignored)
	@:extern public inline function no()  : Style return this.set("separate"); // Borders are detached (border-spacing and empty-cells properties will not be ignored). This is default
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract BorderColor( Color ) from DynamicProperty {
	
	@:extern public inline function all( top : String, right : String, bottom : String, left : String ) : Style {
		
		return this.set( top + " " + right + " " + bottom + " " + left  );
	}	
	@:extern public inline function xy( xColor : String, yColor : String ) : Style {
		
		return this.set( yColor  + " " + xColor );
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:access( zcale.view.css.style.Property )

abstract BorderImage( SelectedProperty<String> ) from SelectedProperty<String> {
	
	@:extern public var value(  get, set   ) : String;
	@:extern public var outset( get, never ) : BorderImageOutset;
	@:extern public var repeat( get, never ) : BorderImageRepeat;
	@:extern public var slice(  get, never ) : BorderImageSlice;
	@:extern public var source( get, never ) : Image;
	@:extern public var width(  get, never ) : BorderImageWidth;
	
	@:extern public inline function url( v : String, settings : String = "" ) : Style {
		
		return this.get("border-image").prefix(["webkit","moz","o"]).set("url(" + v + ") " + settings );
	}
	@:extern public inline function all( 
		url    : String, 
		slice  : FloatOrString = "", 
		width  : FloatOrString = "", 
		outset : FloatOrString = "",
		repeat : String = "" ) : Style {
		
		return this.get("border-image").prefix(["webkit","moz","o"]).set(
			StringTools.rtrim(
				"url(" + url + ") " + Std.string( slice )     + " " +
				Property.valueToString( width,  Style.UNITS ) + " " +
				Property.valueToString( outset, Style.UNITS ) + " " + 
				repeat
			)
		);
	}
	@:extern private inline function set_value( v : String ) : String {
		
		return this.get("border-image").prefix(["webkit","moz","o"]).value = v;
	}
	@:extern private inline function get_value() : String {
		
		return this.get("border-image").value;
	}
	@:extern private inline function get_outset() : BorderImageOutset return this.get("border-image-outset", Style.UNITS );
	@:extern private inline function get_repeat() : BorderImageRepeat return this.get("border-image-repeat");
	@:extern private inline function get_slice()  : BorderImageSlice  return this.get("border-image-slice");
	@:extern private inline function get_source() : Image 			  return this.get("border-image-source");
	@:extern private inline function get_width()  : BorderImageWidth  return this.get("border-image-width", Style.UNITS);
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract BorderImageOutset( Property<FloatOrString> ) from DynamicProperty {
	
	@:extern public inline function all( top : FloatOrString, right : FloatOrString, bottom : FloatOrString, left : FloatOrString ) : Style {
		
		return this.set(
			Property.valueToString( top, 	Style.UNITS ) + " " + 
			Property.valueToString( right, 	Style.UNITS ) + " " + 
			Property.valueToString( bottom, Style.UNITS ) + " " + 
			Property.valueToString( left, 	Style.UNITS )
		);
	}	
	@:extern public inline function xy( xOutset : FloatOrString, yOutset : FloatOrString ) : Style {
		
		return this.set( Property.valueToString( xOutset, Style.UNITS )  + " " + Property.valueToString( yOutset, Style.UNITS ));
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract BorderImageRepeat( Property<String> ) from DynamicProperty {
	
	@:extern public inline function stretch() : Style return this.set("stretch");
	@:extern public inline function repeat()  : Style return this.set("repeat");
	@:extern public inline function round()   : Style return this.set("round");
	@:extern public inline function space()   : Style return this.set("space");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract BorderImageSlice( Property<FloatOrString> ) from DynamicProperty {
	
	@:extern public inline function all( top : FloatOrString, right : FloatOrString, bottom : FloatOrString, left : FloatOrString ) : Style {
		
		return this.set(
			Property.valueToString( top    ) + " " + 
			Property.valueToString( right  ) + " " + 
			Property.valueToString( bottom ) + " " + 
			Property.valueToString( left )
		);
	}	
	@:extern public inline function xy( xSlice : FloatOrString, ySlice : FloatOrString ) : Style {
		
		return this.set( Property.valueToString( xSlice )  + " " + Property.valueToString( ySlice ));
	}
	@:extern public inline function fill() : Style return this.set("fill");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract BorderImageWidth( Property<FloatOrString> ) from DynamicProperty {
	
	@:extern public inline function all( top : FloatOrString, right : FloatOrString, bottom : FloatOrString, left : FloatOrString ) : Style {
		
		return this.set(
			Property.valueToString( top, 	Style.UNITS ) + " " + 
			Property.valueToString( right, 	Style.UNITS ) + " " + 
			Property.valueToString( bottom, Style.UNITS ) + " " + 
			Property.valueToString( left, 	Style.UNITS )
		);
	}	
	@:extern public inline function xy( xWidth : FloatOrString, yWidth : FloatOrString ) : Style {
		
		return this.set( Property.valueToString( yWidth, Style.UNITS )  + " " + Property.valueToString( xWidth, Style.UNITS ));
	}	
	@:extern public inline function auto() : Style return this.set("auto");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract BorderRadius( Property<FloatOrString> ) from DynamicProperty {
	
	@:extern public inline function set( v : FloatOrString ) : Style {
		
		return this.set( v );
	}
	@:extern public inline function all( topLeft : FloatOrString, topRight : FloatOrString, bottomRight : FloatOrString, bottomLeft : FloatOrString ) : Style {
		
		return this.set(
			Property.valueToString( topLeft, 	 Style.UNITS ) + " " + 
			Property.valueToString( topRight, 	 Style.UNITS ) + " " + 
			Property.valueToString( bottomRight, Style.UNITS ) + " " + 
			Property.valueToString( bottomLeft,  Style.UNITS )
		);
	}	
	@:extern public inline function diagonal( left : FloatOrString, right : FloatOrString ) : Style {
		
		return this.set( Property.valueToString( left, Style.UNITS ) + " " + Property.valueToString( right, Style.UNITS )
		);
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward( value )

abstract BorderSpacing( Property<FloatOrString> ) from DynamicProperty {
	
	@:extern public inline function set( v : FloatOrString ) : Style {
		
		return this.set( v );
	}
	@:extern public inline function xy( xSpacing : FloatOrString, ySpacing : FloatOrString ) : Style {
		
		return this.set( Property.valueToString( xSpacing, Style.UNITS ) + " " + Property.valueToString( ySpacing, Style.UNITS ));
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

@:forward

abstract AllBordersWidth( BorderWidth ) from DynamicProperty {
	
	@:extern public inline function all( top : FloatOrString, right : FloatOrString, bottom : FloatOrString, left : FloatOrString ) : Style {
		
		return this.set(
			Property.valueToString( top, 	Style.UNITS ) + " " + 
			Property.valueToString( right, 	Style.UNITS ) + " " + 
			Property.valueToString( bottom, Style.UNITS ) + " " + 
			Property.valueToString( left,   Style.UNITS )
		);
	}
	@:extern public inline function xy( xWidth : FloatOrString, yWidth : FloatOrString ) : Style {
		
		return this.set( Property.valueToString( yWidth, Style.UNITS )  + " " + Property.valueToString( xWidth, Style.UNITS ));
	}
}