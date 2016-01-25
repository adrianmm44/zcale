package zcale.view.css.style;

import haxe.ds.StringMap;
import zcale.types.ArrayType;
import zcale.view.css.EvalProperties;
import zcale.view.css.style.property.DynamicProperty;

using StringTools;

@:access( zcale.view.css.style.Property )

class BaseStyle {
	
	public var selector    : String;
	public var selectQuery : String;
	public var mediaQuery  : String;
	public var properties  : StringMap<DynamicProperty>;
	public var propsArray  : ArrayType<DynamicProperty>;
	public var substyles   : ArrayType<BaseStyle>;
	
	private var selectedProperty : String;
	private var selectedUnits 	 : String;	 
	
	public function new( ?selector : String, ?mediaQuery : String ) {
		
		this.selector 	= selectQuery = selector;
		this.mediaQuery = mediaQuery;
		this.properties = new StringMap();
		this.propsArray = [];
		this.substyles  = [];
	}
			
	public function add( style : BaseStyle, relation : String = "" ) : BaseStyle {
		
		style.selector = ( style.selector != null ) ? relation + style.selector : relation;
		substyles.add( style );
		return this;
	}
	
	public function select( property : String, ?unitsType : String ) : BaseStyle {
		
		if( selectedProperty != null ) {
			selectedProperty += "-" + property;
		}
		else {
			selectedProperty = property;
		}
		if( unitsType != null ) {
			selectedUnits = unitsType;
		}
		return this;
	}
			
	public function get( ?property : String, ?unitsType : String ) : DynamicProperty {
		
		if( property != null ) {
			select( property, unitsType );
		}
		property  = selectedProperty;
		unitsType = selectedUnits;
		selectedProperty = null; // reset
		selectedUnits 	 = null; // reset
		
		if( properties.exists( property ) == false ) {
			var o = new DynamicProperty( this, property, unitsType );
			properties.set( property, o );
			propsArray.add( o );
			return o;
		}
		else {
			return properties.get( property );
		}
	}
		
	public function toString() : String {
		
		var s = "";
		var isInline  : Bool   = ( selectQuery == null && mediaQuery == null );
		var indenting : String = ( ! isInline ) ? "\n\t" : " ";
		
		for ( propertyName in properties.keys() ) {
			if( propertyName.startsWith("-z-")) {
				if( propertyName == "-z-sprite-sheet-image" && properties.exists("-z-sprite-sheet-width")) {
					EvalProperties.evalSpriteSheet( this );
				}
			}
		}
		for ( property in propsArray ) {
			if( property.value != null ) {
				s += property.toString( indenting );
			}
		}
		//str = s.substr( 0, -1 );
		if( ! isInline && s.length > 0 ) {
			s = "\n" + selectQuery + " {" + s + "\n" + "}";
		}
		return s;
	}
}