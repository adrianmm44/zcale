package zcale.build.projects;

import zcale.settings.MainSettings;
import zcale.settings.BuildSettings;
import zcale.build.tools.BuildTools;
import zcale.build.project.options.ProjectOptions;
import zcale.build.project.interfaces.IPlatformProject;

using StringTools;
using zcale.tools.CaseTools;
using zcale.tools.PathTools;

class TplProject implements IPlatformProject<TplProject>
{	
	public var createIndex  : Bool = false;
	public var createAssets : Bool = false;
	public var options 		: ProjectOptions<TplProject>;
	
	public function new( classPath : String, ?outputPath : String )
	{
		if( outputPath == null ){
			outputPath = BuildSettings.webOutputPath;
		}		
		options = new ProjectOptions( classPath, outputPath, "", ".tpl" );
		options.macros.add( classPath + '.export("' + options.outputPath + options.relativePath + "/"+ options.fileName.toSpinalCase() + '")' );
		options.useMainFunction = false;
	}
	
	private function setOptions() : Void
	{
		if( createAssets == true ){
			Builder.getInstance().macros.add( BuildTools.getMacroCall().createAssets( options.outputPath ) );
		}
		Builder.getInstance().directories.add( options.outputPath + options.relativePath );
	}
	
	public function toString() : String
	{
		var str = "";
		if( options.compile ){
			setOptions();
			str += options.getHeader("tpl");
			str += options.getFooter();
		}
		return str;
	}
}