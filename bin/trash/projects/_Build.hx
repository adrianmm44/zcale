/////////////////////////////////////////////////////////////////////////////////////////////////////////

package ;

import ezign.controllers.*;
import hxf.core.Registry;
import hxf.core.tools.PathTools;
import hxf.core.events.EventDispatcher;
import hxflib.CodeCrawler;
import zcale.builder.projects.types.WebProject;

class Build extends EventDispatcher
{	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var registry : Registry;
	private var builder  : UBuilder;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function main() : Void
	{
		new Build();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new()
	{
		super( this );
		
		registry = new Registry();
		
		buildRemotingTest();
		// buildTest();
		// buildEZignWebsite();
		// buildMainframe();
		// buildPortfolio();
		// buildMailer();
		// buildMailBuilder();
		// buildCodeCrawler();
		
		builder.addEventListener( builder.eventType().complete, onBuildComplete );
		builder.addEventListener( builder.eventType().error, 	onBuildError );
		builder.build("/Applications/MAMP/htdocs/HaxeFusion/");
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onBuildComplete( builder : UBuilder ) : Void
	{		
		Sys.print( builder.eventData().html );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onBuildError( builder : UBuilder ) : Void
	{
		Sys.print( builder.eventData().error.toString() );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function buildRemotingTest() : Void
	{
		var outputPath : String = "bin/mainframe/";
		
		builder = new UBuilder( registry, Build, outputPath );
		
		var project   = builder.create.webProject( RemotingTest, outputPath + "remoting/", "Main", true );
		project.debug = true;
		//
		//project.createIndex  = true;
		//project.genIndexFile = true;
		//project.genHtAccess  = true;		
		//project.genModules	 = true;
		//project.genHxClasses = true;
		project.createAssets = true;
		//				
		builder.addProject( project );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	private function buildTest() : Void
	{
		var projectPath : String = "bin/mainframe/";
		
		builder = new ProjectBuilder( registry, Builder, projectPath );
		
		var projects : Array<WebProject> = new Array();
		
		var tester = builder.create.webProject( ModuleTester, projectPath + "test/", "index", false );
		tester.addSource("src/mods/");
				
		var a = builder.create.webProject( ModA, projectPath + "test/", "ModA" );						
		var b = builder.create.webProject( ModB, projectPath + "test/", "ModB" );				
		
		a.addSource("src/mods/");
		b.addSource("src/mods/");
		
		projects.push( b );
		projects.push( a );
		projects.push( tester );
		//					
		for( project in projects )
		{
			project.debug 	   = true;
			project.useJQuery  = true;
			project.useModules = true;
			project.genModules = true;
			
			builder.addProject( project );
		}
	}
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function buildEZignWebsite() : Void
	{
		var projectPath : String = "bin/mainframe/";
		
		builder = new UBuilder( registry, Build, projectPath );
		
		var projects : Array<WebProject> = new Array();		
		
		projects.push( builder.create.webProject( EZign, projectPath + "ezign/", "index", false ) );		
		
		var home = builder.create.webProject( ezign.controllers.Home, projectPath + "ezign/", "Home" );
		
		projects.push( home );
		
		for(project in projects ){
			project.useJQuery = true;
			builder.addProject( project );
		}
		
		builder.debug = true;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function buildMainframe() : Void
	{
		var projectPath : String = "bin/mainframe/";
		
		builder = new UBuilder( registry, Build, projectPath );
		
		var mainframe = builder.create.webProject( Mainframe, projectPath + "web/", "index", false );
		
		mainframe.useJQuery = true;
		
		builder.addProject( mainframe );				
		builder.debug = true;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	private function buildMailer() : Void
	{
		var projectPath : String = "bin/mainframe/";
		
		builder = new ProjectBuilder( registry, Builder, projectPath );
		
		var mailer = builder.create.webProject( Mailer, projectPath + "mailer/");
		
		mailer.useWebDir = false;
		
		builder.addProject( mailer );
		builder.debug = true;
	}
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	private function buildMailBuilder() : Void
	{
		var projectPath : String = "bin/mainframe/";
		
		builder = new ProjectBuilder( registry, Builder, projectPath );
		
		projectPath += "mail-builder/";
		
		// Libraries
		//builder.addProject( builder.create.hxfLibrary("hxflib.HtmlMail", "HtmlMail", projectPath ));
		
		var mailBuilder = builder.create.webProject( MailBuilder, projectPath );
		
		mailBuilder.useWebDir = false;
				
		builder.addProject( mailBuilder );		
		builder.debug = true;
	}
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	//
	
	private function buildPortfolio() : Void
	{
		var projectPath : String = "bin/mainframe/";
		
		builder = new UBuilder( registry, Build, projectPath );
		
		var portfolio = builder.create.phpProject( Portfolio, projectPath + "portfolio/" );
		
		// webProject("MainframeCrawler", "index", projectPath + "code/", false );
		 
				
		builder.addProject( portfolio );
				
		builder.debug = true;
	}
	//
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	//
	private function buildCodeCrawler() : Void
	{
		var projectPath : String = "bin/mainframe/";
		
		builder = new UBuilder( registry, Build, projectPath );
		
		var crawler = builder.create.phpProject( CodeCrawlerMain, projectPath + "code/" );
		
		// webProject("MainframeCrawler", "index", projectPath + "code/", false );
				
		builder.addProject( crawler );
				
		builder.debug = true;
	}
	//	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////