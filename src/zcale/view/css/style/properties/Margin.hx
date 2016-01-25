package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.property.SelectedProperty;
import zcale.view.css.style.properties.shared.Edges;
import zcale.types.mixed.FloatOrString;

@:forward

abstract Margin( Edges ) from SelectedProperty<FloatOrString> {
	
	@:extern public inline function auto() : Style return this.set("auto");
}