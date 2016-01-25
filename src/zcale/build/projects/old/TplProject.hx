package zcale.build.projects;

import zcale.build.tools.BuildTools;
import zcale.build.project.PlatformProject;
import zcale.patterns.interfaces.IStringable;
import zcale.patterns.Event;

using StringTools;
using zcale.tools.CaseTools;
using zcale.tools.PathTools;

class TplProject extends PlatformProject<TplProject> implements IStringable
{	
	public function new( classPath : String, ?outputPath : String )
	{
		super( classPath, outputPath, ".tpl" );
		
		macros.add( classPath + '.export("' + outputPath + relativePath + "/"+ fileName.value.toSpinalCase() + '")');
		useMainFunction.value = false;		
		listeners.add( Event.TO_STRING, setOptions );
	}
	
	private function setOptions( obj : TplProject ) : Void
	{
		if( createAssets == true ){
			Builder.getInstance().macros.add( BuildTools.getMacroCall().createAssets( outputPath ));
		}
		Builder.getInstance().directories.add( "" + outputPath + relativePath );
	}
	
	public function toString() : String
	{
		var str = "";
		if( doCompile ){
			listeners.dispatch( Event.TO_STRING );
			str += getHeader("tpl");
			str += getFooter();
		}
		return str;
	}
}