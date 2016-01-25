package zcale.seo.productFeed;

import zcale.patterns.Event;
import zcale.patterns.EventListeners;
import zcale.seo.productFeed.interfaces.IProductField;

using StringTools;

@:allow( zcale.seo.productFeed.ProductItem )

class ProductField<T1,T2,T3> implements  IProductField
{	
	private var self 		 : T1;
	private var product 	 : T2;
	private var value  	 	 : T3;
	private var nodeValue  	 : String;
	private var listeners 	 : EventListeners<T1>;
	private var isText 		 : Bool;
	private var props 		 : {
				?label		 : String,
				?limit		 : Int,
				?required 	 : Bool, 
				?recommended : Bool
	};
	
	public function new( self : T1, product : T2 )
	{
		this.props	   = { limit : 0 };
		this.self	   = self;
		this.product   = product;
		this.nodeValue = "";
		this.listeners = new EventListeners( self );		
		this.listeners.add( Event.TO_XML, onXmlOut );
	}
	
	public function get() : T3
	{
		return value;
	}
	
	public function set( v : T3 ) : T2
	{
		value = v;
		return product;
	}
	
	public function exists() : Bool
	{
		return ( props.label != null );
	}
	
	public function isset() : Bool
	{
		return ( value != null );
	}
	
	private function label( name : String ) : T1
	{
		props.label = name;
		return self;
	}
	
	private function limit( length : Int ) : T1
	{
		props.limit = length;
		return self;
	}
	
	private function required( v : Bool = true ) : T1
	{
		props.required = v;
		return self;
	}
	
	private function recommended( v : Bool = true ) : T1
	{
		props.recommended = v;
		return self;
	}
	
	public function toXml() : Xml
	{
		listeners.dispatch( Event.TO_XML );
				
		var field = Xml.createElement( props.label );
		if( isText ){
			field.addChild( Xml.createCData( nodeValue ));
		}
		else{
			field.addChild( Xml.createPCData( nodeValue ));
		}
		return field;
	}
	
	private function onXmlOut( field : T1 ) : Void
	{
		if( value != null ){
			nodeValue = Std.string( value );
		}		
		if( isText && props.limit > 0 && nodeValue.length > props.limit )
		{
			nodeValue = nodeValue.substr( 0, props.limit - 4 ) + "...";
		}
	}
}