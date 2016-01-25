/////////////////////////////////////////////////////////////////////////////////////////////////////////
//  _______ _______ _______      _______        _______ _______ _______
//  |_____| |  |  | |  |  |      |       |      |_____| |______ |______     SwfView 1.0
//  |     | |  |  | |  |  |      |_____  |_____ |     | ______| ______|     Adrian Martinez Martinez
//                                                                          Sun Jan  6 01:21:23 CET 2013
/////////////////////////////////////////////////////////////////////////////////////////////////////////

package views;

import registry.Registry;
import models.portfolio.ProjectModel;
import views.HtmlView;
import views.ViewInterface;

class SwfView extends HtmlView, implements ViewInterface
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var assetsUrl : String;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( registry : Registry )
	{
		super( registry );
		
		assetsUrl = registry.rootUrl + registry.assetsPath;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function render( swf : ProjectModel ) : Void
	{
		var id = 'flashContent';		
		html   = new String('');
		html  += head( swf.title );
		html  += include( registry.rootUrl + 'js/swfobject.js');
		html  += openJS();
		html  += swfObjectJS( id );
		html  += closeJS();
		html  += openBody();
		html  += swfObjectHtml( id, assetsUrl + swf.path + swf.source, swf.width, swf.height );
		html  += closeBody();
		
		dispatchComplete();
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function swfObjectJS( id : String, version : Int = 9 ) : String
	{
		return "\n" + tabs.toString() + 'swfobject.registerObject("' + id + '", "' + version + '.0.0", "js/expressInstall.swf");';
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function swfObjectHtml( id : String, src : String, width : String, height : String ) : String
	{
		var object = "\n" + tabs.toString() + '<div>';
		tabs.tabLevel++;
		object += "\n" + tabs.toString() + '<object id="' + id + '" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" style="outline: 0;" width="' + width + '" height="' + height + '">';
		tabs.tabLevel++;
		object += "\n" + tabs.toString() + '<param name="movie" value="' + src + '" />';
		object += "\n" + tabs.toString() + '<param name="flashVars" value="clickTag=" />';
		object += "\n" + tabs.toString() + '<!--[if !IE]>-->';
		object += "\n" + tabs.toString() + '<object type="application/x-shockwave-flash" style="outline: 0;" data="' + src + '" width="' + width + '" height="' + height + '">';
		object += "\n" + tabs.toString() + '<param name="flashVars" value="clickTag=" />';
		object += "\n" + tabs.toString() +  '<!--<![endif]-->';
		object += "\n" + tabs.toString() +  '<div><p><a href="http://www.adobe.com/go/getflashplayer" target="_blank"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" /></a></p></div>';
		object += "\n" + tabs.toString() +  '<!--[if !IE]>-->';
		object += "\n" + tabs.toString() +  '</object>';
		object += "\n" + tabs.toString() +  '<!--<![endif]-->';
		tabs.tabLevel--;
		object += "\n" + tabs.toString() +  '</object>';
		tabs.tabLevel--;
		object += "\n" + tabs.toString() + '</div>';
		
		return object;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////