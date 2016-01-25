package zcale.view.css.style.properties.box;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

@:forward( value)

abstract BoxSizing( Property<String> ) from DynamicProperty {
	
	//#if (( ie >= 9 ) && ( firefox >= 4 ) && ( chrome >= 4 ) && ( safari >= 3 ) && ( opera >= 10.5 ) && ( android >= 4.1 ) || build )
		
		@:extern public inline function borderBox()  : Style return this.set("border-box");
		@:extern public inline function paddingBox() : Style return this.set("padding-box");
		@:extern public inline function contentBox() : Style return this.set("content-box");		
		
	//#end
}