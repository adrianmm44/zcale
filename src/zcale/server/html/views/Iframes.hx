package zcale.server.html.views;

import zcale.types.ArrayType;

using StringTools;

class Iframes 
{	
	private var iframes : ArrayType<String>;
	
	public function new()
	{
		iframes = [];
	}
	
	public function addIframe( url : String ) : Iframes
	{
		iframes.add( url );
		return this;
	}
	
	public function toString() : String
	{
		var html  = "";
		var width : Float = Math.floor( 100 / iframes.length ) - 1;
		
		for( iframeUrl in iframes ){
			 html += "\n\t" + '<iframe src="' + iframeUrl + '" style="width:' + Std.string( width ) + '%; height:100%; margin:0px; padding:0px; border:1px solid;"></iframe>';
		}		
		return html.ltrim();
	}
}