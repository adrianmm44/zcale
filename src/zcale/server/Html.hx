package zcale.server;

import haxe.Json;

import zcale.settings.MainSettings;
import zcale.settings.CoreSettings;
import zcale.server.html.Head;
import zcale.server.html.Body;
import zcale.types.ArrayType;

using zcale.tools.PathTools;

typedef JsScript = {
	var path : String;
	var code : String;
}

typedef SwfObject = {
	var path   	  : String;
	var id	   	  : String;
	var width  	  : String;
	var height 	  : String;
	var flashvars : String;
}

class Html 
{
	public var head : Head;
	public var body : Body;
	
	private var scripts    : ArrayType<JsScript>;
	private var swfobjects : ArrayType<SwfObject>;
			
	public function new( ?title : String )
	{
		head 	   = new Head( title );
		body 	   = new Body();
		scripts    = new Array();
		swfobjects = new Array();
	}
		
	public function addScript( path : String, code : String = "" ) : Html
	{
		scripts.add({ path : path.removeFrontDelimiter(), code : code });
		return this;
	}
	
	public function addSwfObject( path 		 : String,
								  id 		 : String, 
								  width 	 : Dynamic, 
								  height 	 : Dynamic, 
								  ?flashvars : Dynamic ) : Html
	{
		swfobjects.add({ 
			path      : path, 
			id 	   	  : id, 
			width     : Std.string( width  ), 
			height    : Std.string( height ), 
			flashvars : flashvars 
		});
		return this;
	}
		
	public function toString() : String
	{
		var html : String = CoreSettings.htmlDoctype;
				
		html += "\n" + '<html lang="' + CoreSettings.htmlLang + '">';
		html += head.toString();
		
		for( script in scripts )
		{
			if( script.path != null ){
				body.add( '<script type="text/javascript" src="' + script.path + '"></script>' );
			}
			else {
				body.add( '<script type="text/javascript">' + script.code + '</script>' );
			}
		}
		
		if( swfobjects.length > 0 )
		{
			body.add( '<script type="text/javascript" src="' + MainSettings.jsOutputPath + 'swfobject.js"></script>' );
			body.add( '<script type="text/javascript">' );
			
			for( swfobject in swfobjects )
			{
				body.add( "\t" + 'swfobject.embedSWF("' + swfobject.path   + '", "' + 
										 				  swfobject.id 	   + '", "' + 
										 				  swfobject.width  + '", "' + 
										 				  swfobject.height + '", "' + 
										 				  MainSettings.flashVersion + '", "' + 
										 				  MainSettings.flashOutputPath + 'expressInstall.swf", ' +
														  Json.stringify( swfobject.flashvars ) + ' );' );
			}
			body.add("</script>");
		}
		html += body.toString();
		html += "\n" + "</html>";	
		return html;
	}
}