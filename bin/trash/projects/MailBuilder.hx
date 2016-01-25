/////////////////////////////////////////////////////////////////////////////////////////////////////////

package ;

import hxf.core.Dom;
import hxf.core.Boot;
import hxf.core.Registry;
import hxf.core.loaders.HtmlLoader;
import hxflib.HtmlMail;

class MailBuilder 
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function main() : Void
	{
		new MailBuilder();
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var registry : Registry;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new()
	{
		registry = new Registry();
					
		var booting = new Boot( registry );
		booting.addEventListener( booting.eventType().complete, onBootComplete );
		booting.addEventListener( booting.eventType().error, 	onError );
		booting.boot();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onBootComplete( booting : Boot ) : Void
	{
		Dom.doc.head.title = "MailerBuilder";
		
		var params : Map<String,String> = registry.location.params;
				
		if( params.exists("src")   == true )
		{
			var loader = new HtmlLoader( registry );
			loader.addEventListener( loader.eventType().complete, onSourceLoadComplete );
			loader.addEventListener( loader.eventType().error, 	  onError );
			loader.load( params.get("src") );
		}
		else {
			Boot.trace("src param not defined");
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onSourceLoadComplete( loader : HtmlLoader ) : Void
	{
		var htmlMail = new HtmlMail();
		htmlMail.addEventListener( htmlMail.eventType().complete, onParseComplete );
		htmlMail.addEventListener( htmlMail.eventType().error, 	  onError );
		htmlMail.parse( loader.eventData().html );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onParseComplete( htmlMail : HtmlMail ) : Void
	{		
		/*/
		#if php
		Sys.print( htmlMail.eventData().html );	
		#else
		/*/
		Boot.trace( htmlMail.eventData().html );
		//#end
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onError( cls : Dynamic ) : Void
	{
		//cls.eventData().error.addCrumb( this, "method" );
		
		Boot.trace( cls.eventData().error.toString() );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////