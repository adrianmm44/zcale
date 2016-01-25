package zcale.seo.productFeed.fields;

import zcale.seo.productFeed.ProductField;

class Currency<T> extends ProductField<Currency<T>,T,String>
{
	public static inline var EUR : String = "EUR"; // Euro
	public static inline var USD : String = "USD"; // United States dollar
	public static inline var AUD : String = "AUD"; // Australian dollar
	public static inline var GBP : String = "GBP"; // Pound sterling
	public static inline var CNY : String = "CNY"; // Chinese yuan
	public static inline var JPY : String = "JPY"; // Japanese yen
		
	public function new( product : T )
	{
		super( this, product );
		value  = EUR;
	}
}