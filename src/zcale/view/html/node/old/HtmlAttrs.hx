package zcale.view.html.node;

import haxe.ds.StringMap;

class HtmlAttrs
{
	public static function setClass( attrs : StringMap<String>, value : Dynamic ) : Void
	{
		if( Std.is( value, String ))
		{
			attrs.set("class", value );
		}
		else if( Std.is( value, Array ))
		{
			attrs.set("class", cast( value, Array<Dynamic> ).join(" "));
		}
	}
}