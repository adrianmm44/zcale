package zcale.view.css;

import haxe.ds.StringMap;
import zcale.patterns.Event;
import zcale.patterns.EventListeners;
import zcale.types.enums.FloatString;
//import zcale.types.StringType.IntString;
import zcale.view.css.Style;

@:allow( zcale.view.css.Style )
@:allow( zcale.view.css.Properties )

class Property
{
	private var style 	   : Style;
	private var name 	   : String;
	private var units 	   : String = "px";	
	private var properties : StringMap<String>;
	private var listeners  : EventListeners<Property>;
	
	public function new( style : Style, name : String )
	{
		this.style = style;
		this.name  = name;
		properties = new StringMap();
		listeners  = new EventListeners( this );
	}		
	/*/
	public function initial() : Style // Sets this property to its default value.
	{
		properties.set( name, "initial");
		return style;
	}	
		
	public function inherit() : Style // Inherits this property from its parent element.
	{
		properties.set( name, "inherit");
		return style;
	}
	/*/
	private function fromFloat( v : Float ) : String
	{
		return Std.string( v ) + units;
	}
	
	private function fromFloatString( v : FloatString ) : String
	{
		var str : String;
		switch( v ) {
            case TFloat( f ):
                str = Std.string( f ) + units;
            case TString( s ):
                str = s;
        }
		return str;
	}
	/*/
	private function fromIntString( v : IntString ) : String
	{
		var str : String;
		switch( v ) {
            case Int( i ):
                str = Std.string( i ) + units;
            case String( s ):
                str = s;
        }
		return str;
	}
	/*/
	private function propertiesToString() : String
	{
		var str = "";
		for( key in properties.keys() ){
			var value = properties.get( key );		
			if( value != null ){
				str += "\n\t" + key + ": " + value + ";";
			}
		}
		return str;
	}
	
	private function toString() : String
	{
		listeners.dispatch( Event.TO_STRING );
			
		return propertiesToString();
	}
	
	
}