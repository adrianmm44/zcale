package zcale.seo.productFeed.fields;

import zcale.seo.productFeed.ProductField;

class Condition<T> extends ProductField<Condition<T>,T,Int>
{
	public static inline var NEW 		 : Int = 0;
	public static inline var USED 		 : Int = 1;
	public static inline var REFURBISHED : Int = 2;
	public static inline var OPEN_BOX 	 : Int = 3;
	public static inline var RETURNED 	 : Int = 4;
	public static inline var DAMAGED 	 : Int = 5;
	public static inline var OVERSTOCK   : Int = 6;
	public static inline var LIQUIDATION : Int = 7;
	public static inline var UNKNOWN 	 : Int = 8;
	public static inline var DOWNLOAD 	 : Int = 9;
	public static inline var OFFERS_FOR_PROFESSIONAL : Int = 10;
	
	public function new( product : T )
	{
		super( this, product );
	}
}