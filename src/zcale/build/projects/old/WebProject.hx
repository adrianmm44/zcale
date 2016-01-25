package zcale.build.projects;

import zcale.settings.MainSettings;
import zcale.settings.BuildSettings;
import zcale.build.project.options.PlatformProjectOptions;
import zcale.build.project.interfaces.IPlatformProject;
import zcale.build.projects.FlashProject;
import zcale.build.projects.JsProject;
import zcale.build.projects.PhpProject;

using zcale.macros.ArrayExtender;

class WebProject implements IPlatformProject
{
	public var flashProject   : FlashProject;
	public var jsProject 	  : JsProject;
	public var phpProject 	  : PhpProject;
	
	public var createIndex 	  : Bool = true;
	public var createAssets   : Bool = true;
	public var createHtAccess : Bool = false;
	public var useJQuery 	  : Bool = false;
	public var options 		  : PlatformProjectOptions;
	
	public function new( classPath : String )
	{
		flashProject = new FlashProject( classPath );
		jsProject 	 = new JsProject( 	 classPath );
		phpProject 	 = new PhpProject(   classPath );
		options 	 = new PlatformProjectOptions( classPath, BuildSettings.webOutputPath );
	}
	
	private function setOptions() : Void
	{
		flashProject.options.overwrite( options );
		jsProject.options.overwrite( 	options );
		phpProject.options.overwrite(   options );
		
		flashProject.options.flags.add('client');
		jsProject.options.flags.add(   'client');
		phpProject.options.flags.add(  'server');
		
		flashProject.createIndex = false;
		jsProject.createIndex 	 = false;		
		phpProject.createIndex 	 = false;
			
		if( createIndex == true ){
			phpProject.createIndex = true;
		}		
		if( createAssets == false ){
			flashProject.createAssets = false;
			jsProject.createAssets 	  = false;
			phpProject.createAssets   = false;
		}		
		if( createHtAccess == true ){
			phpProject.createHtAccess = true;
		}				
		if( useJQuery == true ){
			jsProject.useJQuery = true;
		}
	}
	
	public function toString() : String
	{		
		var str = '';
		if( options.compile == true ){
			setOptions();			
			var projects = new Array<String>();
						
			if( flashProject.options.compile == true ){
				projects.push( flashProject.toString() );
			}
			if( jsProject.options.compile == true ){
				projects.push( jsProject.toString() );
			}
			if( phpProject.options.compile == true ){
				var phpBuild : String = phpProject.toString();
				if( phpBuild.length > 0 ){
					projects.push( phpBuild );
				}
			}
			str = '\n\n' + Builder.view.longComment + projects.join("\n\n--next");
		}
		return str;
	}
}