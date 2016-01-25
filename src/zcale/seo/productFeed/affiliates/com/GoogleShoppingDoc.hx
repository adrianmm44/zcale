package zcale.seo.productFeed.affiliates.com;

class GoogleShoppingDoc extends ProductDoc<GoogleShoppingDoc>
{
	public function new()
	{
		super( this, "rss" );
	}
	
	public override function toXml() : Xml
	{
		var doc = Xml.createDocument();
		var rss = Xml.createElement("rss");
		var channel = Xml.createElement("channel");
		rss.set("version","2.0");
		rss.set("xmlns:g","http://base.google.com/ns/1.0");
		
		if( props.title != null ){
			var node = Xml.createElement("title");
			node.addChild( Xml.createCData( props.title ));
			channel.addChild( node );
		}		
		if( props.feedLink != null ){
			var node = Xml.createElement("link");
			node.addChild( Xml.createCData( props.feedLink )); 
			channel.addChild( node );
		}		
		if( props.description != null ){
			var node = Xml.createElement("description");
			node.addChild( Xml.createCData( props.description ));
			channel.addChild( node );
		}
		for( product in this.products ){
			 channel.addChild( product );
		}
		rss.addChild( channel );
		doc.addChild( rss );
		return doc;
	}
}