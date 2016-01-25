package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;
import zcale.view.css.style.properties.color.ColorLibrary;
import zcale.types.mixed.IntOrString;

@:forward( value )

abstract Color( Property<String> ) from DynamicProperty {
	
	@:extern public var lib( get, never ) : ColorLibrary;
	
	@:extern private inline function get_lib() : ColorLibrary {
		
		return new ColorLibrary( this );
	}
	@:extern public inline function set( hex : String ) : Style {
		
		return this.set( hex );
	}	
	@:extern public inline function rgb( r : IntOrString, g : IntOrString, b : IntOrString ) : Style {
		
		return this.set("rgb( " + r + ", " + g + ", " + b + " )");
	}
	#if (( ie >= 9 ) && ( safari >= 3.1 ) && ( opera >= 10 ) || build )
		
		@:extern public inline function hsl( h : Int, s : IntOrString, l : IntOrString ) : Style {
			
			return this.set("hsl( " + h + ", " + s + ", " + l + " )");
		}
		#if (( firefox >= 3 ) || build )
			
			@:extern public inline function rgba( r : IntOrString, g : IntOrString, b : IntOrString, a : Float ) : Style {
				
				return this.set("rgba( " + r + ", " + g + ", " + b + ", " + a + " )");
			}
			@:extern public inline function hsla( h : Int, s : IntOrString, l : IntOrString, a : Float ) : Style {
				
				return this.set("hsla( " + h + ", " + s + ", " + l + ", " + a + " )");
			}
			@:extern public inline function transparent() : Style {
				
				return this.set("transparent");
			}
		#end
	#end
	#if (( ie >= 9 ) && ( firefox >= 1.5 ) && ( safari >= 4 ) && ( opera >= 9.5 ) || build )
		
		@:extern public inline function currentColor() : Style {
			
			return this.set("currentColor");
		}
	#end
}