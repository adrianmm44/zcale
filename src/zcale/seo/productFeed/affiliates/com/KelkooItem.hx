package zcale.seo.productFeed.affiliates.com;

import zcale.patterns.Event;
import zcale.seo.productFeed.ProductItem;

class KelkooItem extends ProductItem<KelkooItem>
{	
	public function new()
	{
		super( this, "product");		
		listeners.add( Event.TO_XML, onXmlOut );
		fields = [
		title
			.label("title")
			.limit( 80 )
			.required(),
		productLink
			.label("product-url")
			.required(),
		salePrice
			.label("price"),
		brand
			.label("brand")
			.recommended(),
		description
			.label("description")
			.limit( 300 )
			.recommended(),
		imageLink // Maximum size of 6.6 million pixels
			.label("image-url")
			.recommended(),
		gtin
			.label("ean"),
		productCategory
			.label("merchant-category")
			.required(),
		availability
			.label("availability")
			.recommended(),
		//this.deliveryCost			= new Field("delivery-cost").recommended();
		//this.deliveryTime			= new Field("delivery-time").recommended();
		condition
			.label("condition"),
		ecotax
			.label("ecotax"),
		warranty
			.label("warranty"),
		mobileLink
			.label("mobile-url"),
		kelkooProductCategory
			.label("kelkoo-category-id"),
		mpn
			.label("mpn"),
		sku
			.label("sku"),
		color
			.label("color"),
		unitPrice
			.label("unit-price"),
		isBundle
			.label("offer-type"),
		merchantInfo
			.label("merchant-info"),
		currency
			.label("currency"),
		imageLink2
			.label("image-url-2"),
		imageLink3
			.label("image-url-3"),
		imageLink4
			.label("image-url-4"),
		price
			.label("price-no-rebate")
			.required(),
		salePricePercentage
			.label("percentage-promo")
		];
	}
	
	private function onXmlOut( item : KelkooItem ) : Void
	{
		if( salePrice.isset() == false ){
			salePrice.set( price.get() );
			price.set( null );
		}
		else{
			salePricePercentage.set( 100 - ( salePrice.get() / ( price.get() / 100 )) );
		}
	}
}