package zcale.builder.projects.modular;

import zcale.builder.projects.JsProject;
import zcale.builder.projects.modular.base.ModularProject;

class ModularJsProject extends ModularProject<JsProject>
{	
	public function new( moduleSequence : Array<String> )
	{
		super( this, moduleSequence );
	}
		
	private override function createModuleProject( classPath : String ) : JsProject
	{
		return new JsProject( classPath );
	}
}