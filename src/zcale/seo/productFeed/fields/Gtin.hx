package zcale.seo.productFeed.fields;

import zcale.seo.productFeed.fields.ProductFields;

class Gtin<T> extends ProductField<Gtin<T>,T,Int>
{
	public static inline var EAN  : Int = 1; // EAN (in Europe): 13-digit number such as 3001234567892
	public static inline var UPC  : Int = 2; // UPC (in North America): 12-digit number such as 323456789012
	public static inline var JAN  : Int = 3; // JAN (in Japan): 8 or 13-digit number such as 49123456 or 4901234567894
	public static inline var ISBN : Int = 4; // ISBN (for books): 10 or 13-digit number such as 0451524233. If you have both, only include 13-digit number.
	
	public var ean(  get, never ) : Gtin<T>;
	public var upc(  get, never ) : Gtin<T>;
	public var jan(  get, never ) : Gtin<T>;
	public var isbn( get, never ) : Gtin<T>;
		
	private var gtin : Int;
	
	public function new( product : T )
	{
		super( this, product );
	}
	
	private function get_ean() : Gtin<T>
	{
		gtin = EAN;
		return this;
	}
	
	private function get_upc() : Gtin<T>
	{
		gtin = UPC;
		return this;
	}
	
	private function get_jan() : Gtin<T>
	{
		gtin = JAN;
		return this;
	}
	
	private function get_isbn() : Gtin<T>
	{
		gtin = ISBN;
		return this;
	}
}