/////////////////////////////////////////////////////////////////////////////////////////////////////////
//  _______ _______ _______      _______        _______ _______ _______
//  |_____| |  |  | |  |  |      |       |      |_____| |______ |______     HtmlView 1.0
//  |     | |  |  | |  |  |      |_____  |_____ |     | ______| ______|     Adrian Martinez Martinez
//                                                                          Tue Jan  8 16:14:43 CET 2013
/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxf.mvc.views;

//import amm.string.Path;
//import registry.Registry;
//import registry.TabsRegistry;
import ez.core.TabsRegistry;
import ez.events.dispatchers.EventDispatcher;
import ez.events.dispatchers.interfaces.IEventDispatcher;

class HtmlView extends EventDispatcher
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var tabs : TabsRegistry;
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////

	public function new( eventTarget : IEventDispatcher )
	{
		super( eventTarget );
		
		tabs = new TabsRegistry();						
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function head( title : String, type : String = 'html5' ) : String
	{
		var head = new String('');
				
		if( type == 'html5' )
		{
			head += '<!DOCTYPE html>' + "\n";
			head += '<html>' + "\n";
			head += '<head>';
		}
		else {
			head += '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" ';
			head += '"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">' + "\n";
			head += '<html xmlns="http://www.w3.org/1999/xhtml">';
			head += '<head>' + "\n";
			head += '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />';
		}
		
		head += "\n" + "\t" + '<title>' + title + '</title>' + "\n";
		tabs.tabLevel++;
		
		return head;
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	private function include( source : String ) : String
	{
		var include = new String('');
				
		switch( Path.getFileExtension( source ))
		{
			case 'css': include += "\n" + tabs.toString() + '<link type="text/css" rel="stylesheet" href="' + source + '"/>';
			case 'js' : include += "\n" + tabs.toString() + '<script type="text/javascript" src="' + source + '"></script>';
		}
				
		return include;
	}
	/*/	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function openJS() : String
	{
		var openTag = "\n" + tabs.toString() + '<script type="text/javascript">' + "\n";
		tabs.tabLevel++;
		return openTag;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function closeJS() : String
	{
		tabs.tabLevel--;		
		return "\n\n" + tabs.toString() + '</script>';
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function openBody() : String
	{
		var openTag = "\n" + '</head>';
		openTag += "\n" + '<body>' + "\n";
		return openTag;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function closeBody() : String
	{
		var closeTag = "\n\n" + '</body>';
		closeTag += "\n" + '</html>';
		return closeTag;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function link( label : String, url : String = null, blank : Bool = false ) : String
	{
		if( url == null )
		{
			url = label + '/';
		}
		
		var link = '<a href="' + url + '" target="';
		
		if( blank == true )
		{
			link += '_blank';
		}
		else
		{
			link += '_self';
		}
		
		link += '">' + label + '</a>';
		
		return link;
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////