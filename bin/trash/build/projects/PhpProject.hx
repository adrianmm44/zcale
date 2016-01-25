package zcale.build.projects;

import zcale.build.Builder;
import zcale.build.tools.BuildTools;
import zcale.build.project.options.ProjectOptions;
import zcale.build.project.interfaces.IPlatformProject;
import zcale.settings.MainSettings;
import zcale.settings.BuildSettings;

using zcale.macros.StringExtender;

class PhpProject implements IPlatformProject<PhpProject>
{	
	public var libName 		  : String;
	public var createIndex 	  : Bool = true;
	public var createAssets   : Bool = false;
	public var createHtAccess : Bool = false;
	public var options 		  : ProjectOptions<PhpProject>;
	
	public function new( classPath : String, ?outputPath : String )
	{
		if( outputPath == null ){
			outputPath = BuildSettings.webOutputPath;
		}
		options = new ProjectOptions( classPath, outputPath, "", ".php" );
		options.relativePath = "";
	}
	
	private function setOptions() : Void
	{
		if( options.isModule == true && 
			options.codeElimination == true ){
			options.codeElimination =  null;
		}
		if( createAssets == true ){
			Builder.getInstance().macros.add( BuildTools.getMacroCall().createAssets( options.outputPath ) );
		}
		if( createHtAccess == true ){
			options.macros.add( BuildTools.getMacroCall().createHtAccess( options.outputPath ) );
		}
		Builder.getInstance().directories.add( options.outputPath + options.relativePath );
	}
	
	public function toString() : String
	{		
		var str = '';
		if( options.isModule == false || options.isMainModule == true )
		{
			if( options.compile == true ){
				setOptions();
				var fileDir : String = options.outputPath + options.relativePath;
				str += options.getHeader( MainSettings.phpTargetName );	
				str += '\n' + '-php ' + fileDir;
								
				if( libName != null ){
					str += '\n' + '--php-lib ' + libName;
				}
				if( createIndex == false ){
					str += '\n' + '--php-front ' + options.fileName;
				}
				str += options.getFooter();
			}
		}
		return str;	
	}
}