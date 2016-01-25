package zcale.seo.productFeed.fields;

import zcale.seo.productFeed.ProductField;

class Availability<T> extends ProductField<Availability<T>,T,Int>
{
	public static inline var IN_STOCK 		 	: Int = 1;
	public static inline var STOCK_ON_ORDER 	: Int = 2;
	public static inline var UNKNOWN_CHECK_SITE : Int = 3;
	public static inline var PREORDER 			: Int = 4;
	public static inline var AVAILABLE_ON_ORDER : Int = 5;
	public static inline var OUT_OF_STOCK 		: Int = 6;
	
	public function new( product : T )
	{
		super( this, product );
	}
}