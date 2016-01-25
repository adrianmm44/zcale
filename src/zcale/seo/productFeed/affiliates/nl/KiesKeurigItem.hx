package zcale.seo.productFeed.affiliates;

import zcale.patterns.Event;
import zcale.seo.productFeed.ProductItem;

class KiesKeurigItem extends ProductItem<KiesKeurigItem>
{	
	public function new()
	{
		super( this, "product", true );
		
		listeners.add( Event.TO_XML, onXmlOut );
		fields = [
		id
			.label("id")
			.required(),
		productCategory
			.label("productgroep")
			.required(),
		brand
			.label("merk")
			.recommended(),
		title
			.label("type")
			.required(),
		// toevoeging-type // optioneel
		description
			.label("productomschrijving")
			.required(),
		// extra-productbeschrijving // optioneel
		mpn
			.label("partnumber")
			.recommended(),
		gtin
			.label("ean-code")
			.recommended(),
		price
			.label("prijs")
			.required(),
		salePrice
			.required(),
		shippingCost
			.label("verzendkosten")
			.required(),
		pickupCost
			.label("afhaalkosten")
			.required()
			.listeners.add( Event.TO_XML, onPickupCostOut ),
		deliveryTime
			.label("levertijd")
			.required()
			.listeners.add( Event.TO_XML, onDeliveryOut ),
		productLink
			.label("deeplink")
			.required(),
		imageLink
			.label("imagelink")
			.required(),
		availability
			.label("voorraad")
			.recommended()
		];
	}
	
	private function onXmlOut( item : KiesKeurigItem ) : Void
	{
		if( salePrice.isset() ){
			price.set( salePrice.get() );
		}		
		if( availability.isset() && availability.get() != 1 ){
			availability.set( 0 );
		}
	}
	
	private function onPickupCostOut( field : Dynamic ) : Void
	{
		if( pickupCost.get() == 0 ){
			pickupCost.nodeValue = "0";
		}
	}
	
	private function onDeliveryOut( field : Dynamic ) : Void
	{
		if( deliveryTime.day1 > 0 ){
			var days : Int = deliveryTime.day1;
			if( deliveryTime.day2 > 0 ){
				days = deliveryTime.day2;
			}			
			switch( days ){
				case 1:  deliveryTime.nodeValue = "24 uur";
				case 2:  deliveryTime.nodeValue = "1-2 dagen";
				case 3:  deliveryTime.nodeValue = "1-3 dagen";
				case 4:  deliveryTime.nodeValue = "3-4 dagen";
				case 5:  deliveryTime.nodeValue = "t/m 5 dagen";
				default: deliveryTime.nodeValue = "5+ dagen";
			}			
		}
		else{
			deliveryTime.nodeValue = "Onbekend";
		}
	}
}