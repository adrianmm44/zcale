package zcale.view.css.properties;

import zcale.view.css.Style;
import zcale.view.css.Property;

class Clear extends Property
{
	public function new( style : Style )
	{
		super( style, "clear" );
	}
	
	public function none() : Style // Default. Allows floating elements on both sides
	{
		properties.set( name, "none");
		return style;
	}
	
	public function left() : Style // No floating elements allowed on the left side
	{
		properties.set( name, "left");
		return style;
	}
	
	public function right() : Style // No floating elements allowed on the right side
	{
		properties.set( name, "right");
		return style;
	}
	
	public function both() : Style // No floating elements allowed on either the left or the right side
	{
		properties.set( name, "both");
		return style;
	}
}