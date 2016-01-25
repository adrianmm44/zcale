package zcale.build.projects;

import zcale.settings.MainSettings;
import zcale.build.project.options.ProjectOptions;
import zcale.patterns.interfaces.IStringable;

class MacroProject implements IStringable
{
	public var options : ProjectOptions<MacroProject>;
	
	public function new( classPath : String )
	{
		options = new ProjectOptions( classPath );
		options.macros.add( classPath + ".main()" );
	}
	
	public function toString() : String
	{
		var str = "";
		if( options.compile ){
			str += options.getHeader( MainSettings.macroTargetName );
			str += options.getFooter();
		}
		return str;
	}
}