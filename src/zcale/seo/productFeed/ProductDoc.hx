package zcale.seo.productFeed;

using StringTools;

class ProductDoc<T>
{	
	private var self 	   	 : T;	
	private var nodeName 	 : String;
	private var products     : Array<Xml>;	
	private var props 	   	 : {
				?title	   	 : String,
				?feedLink 	 : String,
				?description : String
	};	
	public function new( self : T, nodeName : String )
	{
		this.self 	  = self;
		this.nodeName = nodeName;
		this.products = new Array();
		this.props	  = {};
	}
	
	public function title( v : String ) : T
	{
		props.title = v;
		return self;
	}
	
	public function feedLink( v : String ) : T
	{
		props.feedLink = v;
		return self;
	}
	
	public function description( v : String ) : T
	{
		props.description = v;
		return self;
	}
		
	public function addProduct( x : Xml ) : T
	{
		products.push( x );
		return self;
	}
		
	public function toXml() : Xml
	{
		var doc   = Xml.createDocument();
		var items = Xml.createElement( nodeName );
		for( product in this.products ){
			 items.addChild( product );
		}
		doc.addChild( items );
		return doc;
	}
	
	public function toString() : String
	{
		//return '<?xml version="1.0" encoding="utf-8"?>' + toXml().toString();
		return '<?xml version="1.0" encoding="utf-8"?>' + "\n" + haxe.xml.Printer.print( toXml() );		
	}
}