package zcale.build.projects;

import zcale.build.Builder;
import zcale.build.tools.BuildTools;
import zcale.build.project.options.ProjectOptions;
import zcale.build.project.interfaces.IPlatformProject;
import zcale.settings.MainSettings;
import zcale.settings.BuildSettings;

class FlashProject implements IPlatformProject<FlashProject>
{	
	public var flashVersion : String = MainSettings.flashVersion;
	public var createIndex 	: Bool = true;
	public var createAssets : Bool = true;
	public var options	   	: ProjectOptions<FlashProject>;
	
	public function new( classPath : String )
	{
		options = new ProjectOptions( this, classPath, BuildSettings.outputPath, ".swf" );
	}
	
	private function setOptions() : Void
	{
		if( options.isModule == true ){
			options.flags.add('modular');
			if( options.codeElimination == true ){
				options.codeElimination =  null;
			}
		}
		if( options.excludedSources.length > 0 ){
			options.macros.add( BuildTools.getMacroCall().excludeSources( options.excludedSources ) );
		}
		if( createIndex == true ){
			options.macros.add( BuildTools.getMacroCall().createFlashIndex( options.outputPath, options.relativePath + '/' + options.fileName ) );
		}
		if( createAssets == true ){
			Builder.getInstance().macros.add( BuildTools.getMacroCall().createAssets( options.outputPath ) );
		}
		Builder.getInstance().directories.add( options.outputPath + options.relativePath );
	}
		
	public function toString() : String
	{
		var str = '';
		if( options.compile == true ){
			setOptions();
			var filePath : String = options.outputPath + options.relativePath + '/' + options.fileName;
			str += options.getHeader( MainSettings.flashTargetName );		
			str += '\n' + '-swf ' + filePath;
			str += '\n' + '-swf-version ' + flashVersion;
			str += options.getFooter();
		}
		return str;
	}
}