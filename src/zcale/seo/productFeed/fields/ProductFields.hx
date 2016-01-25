package zcale.seo.productFeed.fields;

import zcale.seo.productFeed.ProductField;

using StringTools;
using zcale.MathTools;
using zcale.macros.StringExtender;

class Id<T> extends ProductField<Id<T>,T,Int>
{
	public function new( product : T )
	{
		super( this, product );
	}
}

class Link<T> extends ProductField<Link<T>,T,String>
{
	public function new( product : T )
	{
		super( this, product );
		isText = true;
	}
}

class Price<T> extends ProductField<Price<T>,T,Float>
{
	public function new( product : T )
	{
		super( this, product );
	}
	
	private override function onXmlOut( field : Price<T> ) : Void
	{
		var v = Std.string( value.fixedFloat( 2 ));
		if( v.contains(".") == false ){
			v += ".00";
		}
		else if( v.substr( v.indexOf(".")).length == 2 ){
			v += "0";
		}
		nodeValue = v;
	}
}

class Percentage<T> extends ProductField<Percentage<T>,T,Float>
{
	public function new( product : T )
	{
		super( this, product );
	}
	
	private override function onXmlOut( field : Percentage<T> ) : Void
	{
		nodeValue = Std.string( value.fixedFloat( 1 ));
	}
}

class DeliveryTime<T> extends ProductField<DeliveryTime<T>,T,String>
{
	public var hour1 : Int;
	public var hour2 : Int;
	public var day1  : Int;
	public var day2  : Int;
	
	public function new( product : T )
	{
		super( this, product );
		isText = true;
	}
	
	public function setHours( h1 : Int, h2 : Int = 0 ) : T
	{		
		hour1 = h1;
		hour2 = h2;
		value = Std.string( h1 );
		if( h2 > h1 ){
			value += "-" + Std.string( h2 );
		}
		value += " hours";		
		return product;
	}
	
	public function setDays( d1 : Int, d2 : Int  = 0 ) : T
	{
		day1 = d1;
		day2 = d2;
		value = Std.string( d1 );
		if( d2 > d1 ){
			value += "-" + Std.string( d2 );
		}
		value += " days";
		return product;
	}
}

class StringField<T> extends ProductField<StringField<T>,T,String>
{
	public function new( product : T )
	{
		super( this, product );
		isText = true;
	}
}

class FloatField<T> extends ProductField<FloatField<T>,T,Float>
{
	public function new( product : T )
	{
		super( this, product );
	}
}

class IntField<T> extends ProductField<IntField<T>,T,Int>
{
	public function new( product : T )
	{
		super( this, product );
	}
}

class BoolField<T> extends ProductField<BoolField<T>,T,Bool>
{
	public function new( product : T )
	{
		super( this, product );
	}
	
	private override function onXmlOut( field : BoolField<T> ) : Void
	{
		nodeValue = Std.string( value ).toUpperCase();
	}
}