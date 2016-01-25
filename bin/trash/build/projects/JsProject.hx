package zcale.build.projects;

import zcale.build.Builder;
import zcale.build.tools.BuildTools;
import zcale.build.project.options.ProjectOptions;
import zcale.build.project.interfaces.IPlatformProject;
import zcale.settings.MainSettings;
import zcale.settings.BuildSettings;
import zcale.types.zcale.tools.PathTools;

using zcale.macros.StringExtender;

private typedef Self = JsProject;

class JsProject implements IPlatformProject<JsProject>
{	
	public var embedJS 		: zcale.tools.PathTools<Self>; // if true allows inclusion of JQuery and/or swfobject
	public var useJQuery 	: zcale.tools.PathTools<Self>; // determines if jquery is used inside the project or not
	public var createIndex 	: zcale.tools.PathTools<Self>;
	public var createAssets : zcale.tools.PathTools<Self>;
	public var options 		: ProjectOptions<Self>;
	
	public function new( classPath : String, ?outputPath : String )
	{
		if( outputPath == null ){
			outputPath = BuildSettings.outputPath;
		}
		options = new ProjectOptions( classPath, outputPath, "js", ".js");
		
		embedJS 	 = new zcale.tools.PathTools( this, true  );
		useJQuery	 = new zcale.tools.PathTools( this, true  );
		createIndex	 = new zcale.tools.PathTools( this, false );
		createAssets = new zcale.tools.PathTools( this, false );
	}
	
	private function setOptions() : Void
	{
		if( embedJS == false ){
			options.flags.add('noEmbedJS');
		}		
		if( useJQuery == true ){
			options.flags.add('jquery');
		}				
		if( options.isModule == true ){
			options.flags.add('modular');
			if( options.codeElimination == true ){
				options.codeElimination =  null;
			}
		}				
		if( options.excludedSources.length > 0 ){
			options.macros.add( BuildTools.getMacroCall().excludeSources( options.excludedSources ) );
			options.macros.add( BuildTools.getMacroCall().exposeToWindow( options.excludedSources ) );
		}
		if( createIndex == true ){
			options.macros.add( BuildTools.getMacroCall().createJsIndex( options.outputPath, options.relativePath + '/' + options.fileName ) );
		}
		if( createAssets == true ){
			Builder.getInstance().macros.add( BuildTools.getMacroCall().createAssets( options.outputPath ) );
		}
		Builder.getInstance().directories.add( options.outputPath + options.relativePath );
	}
	
	private function getTargetName() : String
	{
		if( useJQuery == true ){
			return "jquery";
		}
		else {
			return MainSettings.jsTargetName;
		}
	}
	
	public function toString() : String
	{		
		var str = '';
		if( options.compile == true ){
			setOptions();
			var filePath : String = options.outputPath + options.relativePath + '/' + options.fileName;
			str += options.getHeader( getTargetName() );
			str += "\n" + "-js "  + filePath;
			str += options.getFooter();
		}
		return str;
	}
}