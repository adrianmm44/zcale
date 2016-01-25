package zcale.seo.productFeed.affiliates.nl;

import zcale.patterns.Event;
import zcale.seo.productFeed.ProductItem;

using StringTools;

class BeslistItem extends ProductItem<BeslistItem>
{	
	public function new()
	{
		super( this, "product", true );
		
		listeners.add( Event.TO_XML, onXmlOut );
		fields = [
		id
			.label("Winkelproductcode")
			.required(),
		title
			.label("Titel")
			.required(),
		description
			.label("Omschrijving")
			.limit( 1024 ),
		productLink
			.label("Deeplink")
			.required()
			.listeners.add( Event.TO_XML, onDeeplinkOut ),
		imageLink
			.label("Image")
			.required(),
		productCategory
			.label("Categorie")
			.required(),
		salePrice
			.label("Prijs")
			.required()
			.listeners.add( Event.TO_XML, onPriceOut ),
		shippingCost
			.label("Portokosten")
			.required()
			.listeners.add( Event.TO_XML, onShippingCostOut ),
		deliveryTime
			.label("Levertijd")
			.required()
			.listeners.add( Event.TO_XML, onDeliveryOut ),
		brand
			.label("Merk")
			.recommended(),
		gtin
			.label("EAN")
			.recommended(),
		sku
			.label("Artikelcodefabrikant")
			.required()		
		];
	}
	
	private function onXmlOut( item : BeslistItem ) : Void
	{
		if( shippingCost.isset() == false ){
			shippingCost.set( 0 );
		}
	}
	
	private function onDeeplinkOut( field : Dynamic ) : Void
	{
		productLink.nodeValue += "?utm_source=beslistslimmershoppen&utm_medium=cpc&utm_campaign=beslist";
	}
	
	private function onPriceOut( field : Dynamic ) : Void
	{
		salePrice.nodeValue = salePrice.nodeValue.replace(".",",");
	}
		
	private function onShippingCostOut( field : Dynamic ) : Void
	{
		shippingCost.nodeValue = shippingCost.nodeValue.replace(".",",");
	}
		
	private function onDeliveryOut( field : Dynamic ) : Void
	{
		if( deliveryTime.day1 > 0 ){
			deliveryTime.nodeValue = Std.string( deliveryTime.day1 );
			
			if( deliveryTime.day2 > deliveryTime.day1 ){
				deliveryTime.nodeValue +=  " tot " + Std.string( deliveryTime.day2 ) + " werkdagen";
			}
			else{
				deliveryTime.nodeValue += " werkdag";
			}
		}
	}
}