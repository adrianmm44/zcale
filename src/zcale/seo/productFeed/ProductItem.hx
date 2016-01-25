package zcale.seo.productFeed;

import zcale.patterns.Event;
import zcale.patterns.EventListeners;
import zcale.seo.productFeed.fields.*;
import zcale.seo.productFeed.fields.ProductFields;
import zcale.seo.productFeed.ProductField;
import zcale.seo.productFeed.interfaces.IProductField;

using zcale.macros.StringExtender;

class ProductItem<T>
{
	// General attributes
	
	public var id  	 	   			  : Id<T>;
	
	public var title 	   			  : StringField<T>;
	public var description 			  : StringField<T>;
	
	public var googleProductCategory  : StringField<T>;
	public var productCategory 		  : StringField<T>;
	
	public var productLink 	  		  : Link<T>;
	public var mobileLink 			  : Link<T>;
	public var imageLink 		      : Link<T>;
	public var imageLink2 			  : Link<T>;
	public var imageLink3 			  : Link<T>;
	public var imageLink4 			  : Link<T>;
	
	public var condition 			  : Condition<T>;
	
	// Prices and Availability
	
	public var availability 		  : Availability<T>;
	public var availabilityDate 	  : StringField<T>;
	
	// Please remember that our policies state you should provide the price which is displayed on your website at all times. 
	// If you have products which go on sale, you may consider using the 'sale price attribute' to accurately provide price data about your products. 
	// It is required to include tax or VAT in the total price.
	
	public var price 				  : Price<T>;
	public var salePrice 			  : Price<T>;
	public var salePricePercentage 	  : Percentage<T>;
	public var salePriceStartDate 	  : StringField<T>;
	public var salePriceEndDate 	  : StringField<T>;
	//public var salePriceEffectiveDate : Field<String>;
	public var currency 			  : Currency<T>;
	
	// Unique Product Identifiers
	
	public var brand 				  : StringField<T>;
	public var gtin  				  : Gtin<T>;
	public var mpn 	 				  : StringField<T>;
	public var identifierExists 	  : BoolField<T>;
	
	// Apparel Products
	
	public var gender 	  			  : StringField<T>;
	public var ageGroup   			  : StringField<T>;
	public var sizeType   			  : StringField<T>;
	public var sizeSystem 			  : StringField<T>;
	
	// Shared by Apparel and Variants
	
	public var color 				  : StringField<T>;
	public var size  				  : StringField<T>;
	
	// Variant Products
	// Please remember that our policies disallow duplicate items. 
	// If you want to submit product variants in your data feed, 
	// you must use these variant attributes as per the method described in this article.
	
	public var material    			  : StringField<T>;
	public var pattern 	   			  : StringField<T>;
	public var itemGroupId 			  : StringField<T>;
	
	// Shipping
	public var shipping 	  		  : StringField<T>; // It is recommended to provide shipping information for all items either by specifying default shipping values in your Google Merchant Center account settings, or by providing this attribute.
	public var shippingCost 		  : Price<T>;
	public var shippingWeight 		  : StringField<T>; // It is required to provide this attribute if you have specified a global shipping method in Settings that is dependent on shipping weight.
	public var shippingLabel  		  : StringField<T>; // This attribute can be used to group products in account-level shipping rules by assigning label values of your choosing to specific products.
	public var deliveryTime 		  : DeliveryTime<T>;
	public var pickupCost 			  : Price<T>;
	
	// Product Combinations
	
	public var multipack 			  : StringField<T>; // Required if applicable to submit merchant-defined multipacks.
	public var isBundle  			  : BoolField<T>;   // Required if applicable to submit merchant-defined bundles.
	
	// Adult Products
	
	public var adult 				  : StringField<T>; // Recommended if you are submitting items that are considered “adult” or non-family safe and would like to label them at the item level 
	
	// AdWords attributes
	
	public var adwordsGrouping 		  : StringField<T>; // Required if you want to bid differently on different subsets of products. It can only hold one value.
	public var adwordsLabels   		  : StringField<T>; // Very similar to 'adwords_grouping', but it will only work on CPC. It can hold multiple values, allowing a product to be tagged with multiple labels.
	public var adwordsRedirect 		  : StringField<T>; // Allows you to specify a separate URL that can be used to track traffic coming from Google Shopping. If this attribute is provided, you must make sure that the URL provided will redirect to the same website as given in the 'link' attribute.
	
	// Unit Prices
	
	public var unitPricingMeasure 	  : StringField<T>; // Recommended if applicable to submit unit prices.
	public var unitPricingBaseMeasure : StringField<T>; // Recommended if applicable to submit unit prices.
	
	// Energy Labels
	
	public var energyEfficiencyClass  : StringField<T>; // Recommended if applicable to submit energy labels.
	
	// Custom labels for Shopping campaigns
	// These attributes can be used to group the items included in a Shopping campaign by values of your choosing. 
	
	public var label0 				  : StringField<T>;
	public var label1 				  : StringField<T>;
	public var label2 				  : StringField<T>;
	public var label3 				  : StringField<T>;
	public var label4 				  : StringField<T>;
	
	// Additional attributes
	
	public var excludedDestination 	  : StringField<T>; // If you are using Google Shopping and you would like to exclude the item from this destination.
	public var expirationDate 	   	  : StringField<T>; // Include if you would like an item to expire earlier than 30 days from the upload date of the feed.
		
	// kelkoo
	
	public var ecotax 				 : FloatField<T>; // environmental tax // Offer is not affected by the environmental tax, indicate '0'
	public var warranty 			 : StringField<T>;
	public var kelkooProductCategory : IntField<T>;
	public var sku 					 : StringField<T>;
	public var unitPrice 			 : FloatField<T>;
	public var merchantInfo 		 : StringField<T>;
	
	public var listeners 			 : EventListeners<T>;
	
	private var nodeName 			 : String;
	private var fields 	 			 : Array<IProductField>;
	private var outputEmptyFields 	 : Bool;
	
	public function new( self : T, nodeName : String, outputEmptyFields : Bool = false )
	{	
		this.nodeName  			= nodeName;	
		this.outputEmptyFields  = outputEmptyFields;
		this.listeners 			= new EventListeners( self );		
		
		id  	 	   			= new Id( 		   	self );
		title 	   			  	= new StringField( 	self );
		description 			= new StringField( 	self );

		googleProductCategory  	= new StringField( 	self );
		productCategory 		= new StringField( 	self );

		productLink 	  		= new Link( self );
		mobileLink 			  	= new Link( self );
		imageLink 		      	= new Link( self );
		imageLink2 			 	= new Link( self );
		imageLink3 			 	= new Link( self );
		imageLink4 			 	= new Link( self );
		
		condition 			  	= new Condition(    self );
		
		availability 		  	= new Availability( self );
		availabilityDate 	  	= new StringField(  self );

		price 				  	= new Price( 	   	self );
		salePrice 			  	= new Price( 	   	self );
		salePricePercentage 	= new Percentage(  	self );
		salePriceStartDate 	 	= new StringField( 	self );
		salePriceEndDate 	 	= new StringField( 	self );
		//public var salePriceEffectiveDate : Field<String>;
		currency 			 	= new Currency( 	self );
		
		brand 				  	= new StringField( 	self );
		gtin  				  	= new Gtin( 	   	self );
		mpn 	 			  	= new StringField( 	self );
		identifierExists 	  	= new BoolField(   	self );

		gender 	  			  	= new StringField( 	self );
		ageGroup   			  	= new StringField( 	self );
		sizeType   			  	= new StringField( 	self );
		sizeSystem 			  	= new StringField( 	self );

		color 				  	= new StringField( 	self );
		size  				  	= new StringField( 	self );
		
		material    			= new StringField( 	self );
		pattern 	   			= new StringField( 	self );
		itemGroupId 			= new StringField( 	self );

		shipping 	  		  	= new StringField( 	self );
		shippingCost			= new Price( 	   	self );
		shippingWeight 		  	= new StringField( 	self );
		shippingLabel  		  	= new StringField( 	self );
		deliveryTime			= new DeliveryTime( self );
		pickupCost				= new Price( 	   	self );
		
		multipack 			  	= new StringField( 	self );
		isBundle  			  	= new BoolField(   	self );

		adult 				  	= new StringField( 	self );

		adwordsGrouping 		= new StringField( 	self );
		adwordsLabels   		= new StringField( 	self );
		adwordsRedirect 		= new StringField( 	self );

		unitPricingMeasure 		= new StringField( 	self );
		unitPricingBaseMeasure 	= new StringField( 	self );

		energyEfficiencyClass  	= new StringField( 	self );
		
		label0 				  	= new StringField( 	self );
		label1 				  	= new StringField( 	self );
		label2 				  	= new StringField( 	self );
		label3 				  	= new StringField( 	self );
		label4 				  	= new StringField( 	self );

		excludedDestination 	= new StringField( 	self );
		expirationDate 	   	  	= new StringField( 	self );
		
		ecotax 				 	= new FloatField(  	self );
		warranty 			 	= new StringField( 	self );
		kelkooProductCategory 	= new IntField(    	self );
		sku 					= new StringField( 	self );
		unitPrice 			 	= new FloatField(  	self );
		merchantInfo 		 	= new StringField( 	self );
	}
	
	public function validate() : Bool
	{
		return true;
	}
	
	public function toXml() : Xml
	{
		listeners.dispatch( Event.TO_XML );
		
		var product = Xml.createElement( nodeName );
		
		for( field in this.fields )
		{
			if( field.exists() && ( field.isset() || outputEmptyFields ))
			{
				product.addChild( field.toXml() );
			}
		}
		return product;
	}
}