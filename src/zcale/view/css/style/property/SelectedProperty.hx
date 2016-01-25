package zcale.view.css.style.property;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;

@:forward( select, get, addStyle )

abstract SelectedProperty<T>( BaseStyle ) from BaseStyle {
			
	@:extern public var value( get, set ) : T;
	
	@:extern public inline function set( v : T ) : Style {
	
		return this.get().set( v );
	}	
	@:extern private inline function set_value( v : T ) : T {
		
		return this.get().value = v;
	}
	@:extern private inline function get_value() : T {
		
		return this.get().value;
	}
}