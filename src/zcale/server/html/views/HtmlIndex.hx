package zcale.server.html.views;

import haxe.Json;
import zcale.Path;
import zcale.core.boot.ITracer;
import zcale.server.Html;
import zcale.server.html.views.Iframes;
import zcale.settings.MainSettings;
import zcale.settings.CoreSettings;
import zcale.tools.PathTools;

class HtmlIndex implements ITracer
{	
	@:extern public static inline var fileName 	  : String = "index.html";
	@:extern public static inline var jsTarget 	  : Int = 1;
	@:extern public static inline var flashTarget : Int = 2;
	@:extern public static inline var webTargets  : Int = 3;
		
	public var title( default, set ) : String;
	public var target : Int = 0;
	public var mainFilePath : String;
	
	private var html   : Html;
	private var traces : String = "";
		
	public function new()
	{
		html = new Html();
	}
		
	private function set_title( value : String ) : String
	{
		return title = html.head.title = value;
	}
		
	private function setHtmlIndex() : Void
	{		
		html.body.addFirst( getTraces() );
	}
		
	private function setJsIndex() : Void
	{
		html.body.addFirst( getTraces() );
		html.addScript( mainFilePath );
	}
		
	private function setFlashIndex() : Void
	{
		html.head.addStyle('html, body { margin: 0px auto; padding: 0px; height: 100%; }') ;
		html.addSwfObject( mainFilePath, "flashContent", "100%", "100%" );
		html.body.add('<div id="flashContent"></div>');
	}
		
	private function setIframesIndex() : Void
	{
		var iframes = new Iframes();
		var params  = Path.PARAMS; 
		params.remove( CoreSettings.varRunTarget );
		
		var phpUrl 	 : String = Path.ROOT_URL + Path.RELATIVE + '?' + PathTools.paramsToString( params );
		var jsUrl 	 : String = Path.ROOT_URL + '?run=' + CoreSettings.runJsTarget 	  + '&/#!' + Path.RELATIVE + '?' + PathTools.paramsToString( params );
		var flashUrl : String = Path.ROOT_URL + '?run=' + CoreSettings.runFlashTarget + '&/#!' + Path.RELATIVE + '?' + PathTools.paramsToString( params );
		
		iframes
			.addIframe( phpUrl )
			.addIframe( jsUrl  )
			.addIframe( flashUrl );
					
		html.head.addStyle('html, body { height: 100%; }');
		html.body.add( iframes.toString() );
	}
		
	private function getTraces() : String
	{
		return '<xmp id="' + CoreSettings.idTraces + '">' + traces + '</xmp>' + "\n";
	}
		
	public function trace( str : Dynamic ) : Void
	{
		traces += "\n" + Std.string( str );
	}
	
	public function toString() : String
	{		
		html.head.title = title;
				
		if( target == jsTarget && mainFilePath != null )
		{
			setJsIndex();
		}
		else if( target == flashTarget && mainFilePath != null )
		{
			setFlashIndex();
		}
		else if( target == webTargets )
		{
			setIframesIndex();
		}
		else {
			setHtmlIndex();
		}				
		return html.toString();
	}
}