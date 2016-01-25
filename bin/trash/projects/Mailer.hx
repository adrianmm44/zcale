/////////////////////////////////////////////////////////////////////////////////////////////////////////

package ;

import hxf.core.Dom;
import hxf.core.Boot;
import hxf.core.Registry;
import hxf.core.loaders.HtmlLoader;
import hxf.core.system.Mail;
import hxf.core.tools.TextTools;

class Mailer 
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function main() : Void
	{
		new Mailer();
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var mailTo 	 : String;
	private var mailFrom : String;
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
		Dom.doc.head.title = "Mailer";
		
		Boot.trace("Booting complete");
		
		//var str : String = "The quick brown fox jump over the lazy dog.";
		//var str : String = "Thequickbrownfoxjumpoverthelazydog.";
		//var str : String = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17";		
		//Boot.trace( "\n" + TextTools.wordWrap( str, 9, "\n", false ) );
		//Boot.trace( "\n" + "Done" );
		
		var params : Map<String,String> = registry.location.params;
				
		if( params.exists("to")   == true &&
		 	params.exists("from") == true &&
			params.exists("url")  == true )
		{
			mailTo 	 = params.get("to");
			mailFrom = params.get("from");
			
			var loader = new HtmlLoader( registry );
			loader.addEventListener( loader.eventType().complete, onHtmlLoadComplete );
			loader.addEventListener( loader.eventType().error, 	  onError );
			loader.load( params.get("url") );
		}
		else {
			Boot.trace("URL params not defined");
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onHtmlLoadComplete( loader : HtmlLoader ) : Void
	{
		var message : String = loader.eventData().html;		
		var subject : String = TextTools.unWrap( message, "<title>", "</title>" );
		
		var mail = new Mail( registry );
		mail.addEventListener( mail.eventType().complete, onMailComplete );
		mail.addEventListener( mail.eventType().error,	  onError );
		mail.send({ to 		: [ mailTo ], 
					from 	: mailFrom, 
					subject : subject, 
					htmlMsg : message });
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onMailComplete( mail : Mail ) : Void
	{
		//Boot.trace( mail.eventData().remoteData );
		//
		if( mail.eventData().remoteData == true )
		{
			Boot.trace("Send mail complete");
		}
		else {
			Boot.trace("Send mail error");
		}
		//
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onError( errorClass : Dynamic ) : Void
	{
		Boot.trace( errorClass.eventData().error.toString() );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////