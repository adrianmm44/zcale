/////////////////////////////////////////////////////////////////////////////////////////////////////////

package ;

import hxf.Core;
import hxf.core.Dom;
import hxf.core.Boot;
import hxf.core.Registry;
import hxf.core.system.dir.DirCrawler;
import hxf.core.system.dir.DirElement;
import hxf.core.tools.PathTools;

import portfolio.Website;
import portfolio.Banner;
import portfolio.Video;
import portfolio.Nieuwsbrief;
import portfolio.Opdracht;

class Portfolio 
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function main() : Void
	{
		new Portfolio();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var core 		 : Core;
	private var websites 	 : Array<Website>;
	private var banners 	 : Array<Banner>;
	private var videos 		 : Array<Video>;
	private var niewsbrieven : Array<Nieuwsbrief>;
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new()
	{
		websites	 = new Array();
		banners		 = new Array();
		videos		 = new Array();
		niewsbrieven = new Array();
				
		core = new Core();
		core.addEventListener( core.eventType().complete, onBootComplete );
		core.addEventListener( core.eventType().complete, onError );
		core.boot();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onBootComplete( core : Core ) : Void
	{		
		Dom.doc.head.title  = "Portfolio";
		
		var dirCrawler = new DirCrawler( core.registry );
		dirCrawler.addEventListener( dirCrawler.eventType().complete, onCrawlingComplete );
		dirCrawler.addEventListener( dirCrawler.eventType().error, 	  onError );
		dirCrawler.crawl( core.registry.location.rootPath + Opdracht.dirName );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onCrawlingComplete( crawler : DirCrawler ) : Void
	{
		var currentDirName : String;
		
		for( currentElement in crawler.eventData().dirElements )
		{
			if( currentElement.isDir == true && currentElement.levelDepth == 2 )
			{
				currentDirName = PathTools.firstDirectory( currentElement.relativePath );
				
				if( currentDirName == Nieuwsbrief.dirName )
				{
					niewsbrieven.push( new Nieuwsbrief({ name : currentElement.name, 
														 url  : core.registry.location.rootUrl + Opdracht.dirName + currentElement.relativePath 
													   	 }));
				}
				else if( currentDirName == Banner.dirName )
				{
					banners.push( new Banner({ name : currentElement.name, 
											   url  : core.registry.location.rootUrl + Opdracht.dirName + currentElement.relativePath 
											   }));
				}
				else if( currentDirName == Website.dirName )
				{
					websites.push( new Website({ name : currentElement.name, 
												 url  : core.registry.location.rootUrl + Opdracht.dirName + currentElement.relativePath 
											   	 }));
				}
				else if( currentDirName == Video.dirName )
				{
					videos.push( new Video({ name : currentElement.name, 
											 url  : core.registry.location.rootUrl + Opdracht.dirName + currentElement.relativePath 
											 }));
				}
			}
		}
		
		renderHtml();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onError( cls : Dynamic ) : Void
	{
		Core.trace( cls.eventData().error.toString() );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function renderHtml() : Void
	{
		var html : String = "";
		
		html += "\n" + "<br/>" + "<h2>Websites</h2>";
		
		for( website in websites ){
			html += "\n" + '<a href="' + website.url + '" target="_blank">' + website.name + "</a><br/>";
		}
		
		html += "\n" + "<br/>" + "<h2>Banners</h2>";
		
		for( banner in banners ){
			html += "\n" + '<a href="' + banner.url + '" target="_blank">' + banner.name + "</a><br/>";
		}
		
		html += "\n" + "<br/>" + "<h2>Videos</h2>";
		
		for( video in videos ){
			html += "\n" + '<a href="' + video.url + '" target="_blank">' + video.name + "</a><br/>";
		}
		
		html += "\n" + "<br/>" + "<h2>Nieuwsbrieven</h2>";
		
		for( niewsbrief in niewsbrieven ){
			html += "\n" + '<a href="' + niewsbrief.url + '" target="_blank">' + niewsbrief.name + "</a><br/>";
		}
		
		// html += "\n" + "<br/>" + niewsbrieven.length;
				
		Dom.doc.body.append( String( html ) );
		
		// Boot.trace( "complete" );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////