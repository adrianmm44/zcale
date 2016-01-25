package zcale.tools;

class MathTools
{
	public static function toFixedFloat( v : Float, length : Int = 2 ) : Float
	{
		return Math.round( v * Math.pow( 10, length )) / Math.pow( 10, length );
	}
}