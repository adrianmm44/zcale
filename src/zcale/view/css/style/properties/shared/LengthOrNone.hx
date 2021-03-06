package zcale.view.css.style.properties.shared;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;
import zcale.types.mixed.FloatOrString;

@:forward

abstract LengthOrNone( Property<FloatOrString> ) from DynamicProperty {

	@:extern public inline function none() : Style return this.set("none");
}