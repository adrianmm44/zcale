package zcale.view;

class Tpl
{
	public static function include( path : String ) : String
	{
		return "{include file='" + path + "'}";
	}
}