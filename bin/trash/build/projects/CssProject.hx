package zcale.build.projects;

import zcale.settings.MainSettings;
import zcale.settings.BuildSettings;
import zcale.build.tools.BuildTools;
import zcale.build.project.options.ProjectOptions;
import zcale.build.project.interfaces.IPlatformProject;

using StringTools;
using zcale.tools.PathTools;
using zcale.tools.CaseTools;
using zcale.macros.StringExtender;

class CssProject implements IPlatformProject<CssProject>
{	
	public var createIndex  : Bool = false;
	public var createAssets : Bool = false;
	public var options 		: ProjectOptions<CssProject>;
	
	public function new( classPath : String, ?outputPath : String )
	{
		if( outputPath == null ){
			outputPath = BuildSettings.webOutputPath;
		}
		options = new ProjectOptions( classPath, outputPath, "", ".css" );
		options.macros.add( classPath + '.export("' + options.outputPath + options.relativePath + "/"+ getFileName() + '")' );
		options.useMainFunction = false;
	}
	
	private function getFileName() : String
	{
		var fileName : String = options.fileName;
		if( fileName.contains("Css.css")){
			fileName = fileName.replace("Css.css", ".css");
		}
		return fileName.toSpinalCase();
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
			str += options.getHeader("css");
			str += options.getFooter();
		}
		return str;
	}
}