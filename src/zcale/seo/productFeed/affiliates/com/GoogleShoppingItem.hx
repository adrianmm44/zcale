package zcale.seo.productFeed.affiliates.com;

import zcale.patterns.Event;
import zcale.seo.productFeed.fields.*;
import zcale.seo.productFeed.ProductItem;

class GoogleShoppingItem extends ProductItem<GoogleShoppingItem>
{	
	public function new()
	{
		super( this, "item" );
		
		listeners.add( Event.TO_XML, onXmlOut );		
		fields = [
		id
			.label("g:id")
			.limit( 50 )
			.required(),
		title
			.label("title")
			.limit( 150 )
			.required(),
		description
			.label("description")
			.limit( 5000 ),
		googleProductCategory
			.label("g:google_product_category")
			.recommended(),
		productCategory
			.label("g:product_type")
			.limit( 750 )
			.recommended(),
		productLink
			.label("link")
			.limit( 2000 )
			.required(),
		mobileLink
			.label("g:mobile_link")
			.limit( 2000 )
			.recommended(),
		imageLink
			.label("g:image_link")
			.limit( 2000 )
			.recommended(),
		imageLink2
			.label("g:additional_image_link")
			.limit( 2000 )
			.recommended(),
		condition
			.label("g:condition")
			.required()
			.listeners.add( Event.TO_XML, onConditionOut ),
		availability
			.label("g:availability")
			.required()
			.listeners.add( Event.TO_XML, onAvailabilityOut ),
		availabilityDate
			.label("g:availability_date")
			.recommended(),
		price
			.label("g:price")
			.required()
			.listeners.add( Event.TO_XML, onPriceOut ),
		salePrice
			.label("g:sale_price")
			.recommended()
			.listeners.add( Event.TO_XML, onSalePriceOut ),
		/*/
		salePriceEffectiveDate
			.label("g:sale_price_effective_date")
			.limit( 50 )
			.recommended();
		/*/
		currency
			.required(),
		brand
			.label("g:brand")
			.limit( 70 )
			.recommended(),
		gtin
			.label("g:gtin")
			.limit( 50 )
			.recommended(),
		mpn
			.label("g:mpn")
			.limit( 70 )
			.recommended(),
		identifierExists
			.label("g:identifier_exists")
			.required()
		];
		
		/*/
		gender 	  			  	= new Field();
		ageGroup   			  	= new Field();
		sizeType   			  	= new Field();
		sizeSystem 			  	= new Field();
		
		color 				  	= new Field();
		size  				  	= new Field();
        
		material    			= new Field();
		pattern 	   			= new Field();
		itemGroupId 			= new Field();
        
		shipping 	  		  	= new Field();
		shippingWeight 		  	= new Field();
		shippingLabel  		  	= new Field();
        
		multipack 			  	= new Field();
		isBundle  			  	= new Field();
        
		adult 				  	= new Field();
        
		adwordsGrouping 		= new Field();
		adwordsLabels   		= new Field();
		adwordsRedirect 		= new Field();
        
		unitPricingMeasure 	  	= new Field();
		unitPricingBaseMeasure 	= new Field();
        
		energyEfficiencyClass  	= new Field();
        
		label0 				  	= new Field();
		label1 				  	= new Field();
		label2 				  	= new Field();
		label3 				  	= new Field();
		label4 				  	= new Field();
        
		excludedDestination 	= new Field();
		expirationDate 	   	  	= new Field();
		/*/
	}
	
	private function onXmlOut( item : GoogleShoppingItem ) : Void
	{
		var identifiers : Int = 0;
				
		if( brand.isset() ){
			identifiers++;
		}
		if( gtin.isset() ){
			identifiers++;
		}
		if( mpn.isset() ){
			identifiers++;
		}
		if( identifiers > 1 ){
			identifierExists.set( true );
		}
		else{
			identifierExists.set( false );
		}
	}
	
	private function onConditionOut( field : Dynamic ) : Void
	{
		switch( condition.get() )
		{
			case Condition.NEW:
				 condition.nodeValue = "new";
			case Condition.USED:
				 condition.nodeValue = "used";
			case Condition.REFURBISHED:
				 condition.nodeValue = "refurbished";
		}
	}
	
	private function onAvailabilityOut( field : Dynamic ) : Void
	{
		switch( availability.get() )
		{
			case Availability.IN_STOCK:
				 availability.nodeValue = "in stock";
			case Availability.OUT_OF_STOCK:
				 availability.nodeValue = "out of stock";
			case Availability.PREORDER:
				 availability.nodeValue = "preorder";
		}
	}
	
	private function onPriceOut( field : Dynamic ) : Void
	{
		price.nodeValue += " " + currency.get();
	}
	
	private function onSalePriceOut( e : Dynamic ) : Void
	{
		salePrice.nodeValue += " " + currency.get();
	}
}