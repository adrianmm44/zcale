package zcale.view.css.style;

import zcale.view.css.Style;
import zcale.types.ChainType;
import zcale.types.mixed.FloatOrString;

class Property<T:zcale.types.mixed.FloatOrString> extends ChainType<Style,T> {
		
	private var name   	  : String;	
	private var units  	  : String; // em, ex, %, px, cm, mm, in, pt, pc
	private var prefixes  : Array<String>;
		
	public function new( style : Style, name : String, ?units : String ) {
		
		super( style );
		this.name  = name;
		this.units = units;
	}
	
	private function prefix( prefixes : Array<String> ) : Property<T> {
			
		this.prefixes = prefixes;
		return this;
	}
	
	private function toString( indenting : String = "" ) : String {
		
		var s : String = "";
		var v : String = Property.valueToString( value, units );
		
		if( prefixes != null ) {
			for ( prefix in prefixes ) {
				s += indenting + "-" + prefix + "-" + name + ": " + v + ";";
			}
		}
		return s + indenting + name + ": " + v + ";";
	}
	
	public static function valueToString( v : FloatOrString, ?units : String ) : String {
		
		if( Std.is( v, Float )) {
			
			return ( units != null ) ? Std.string( v ) + units : Std.string( v );
		}
		else {
			return Std.string( v );
		}
	}
}