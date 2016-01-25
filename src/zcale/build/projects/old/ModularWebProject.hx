package zcale.builder.projects.modular;

import zcale.builder.projects.WebProject;
import zcale.builder.projects.modular.base.ModularProject;

class ModularWebProject extends ModularProject<WebProject>
{	
	public function new( pathData : Array<String> )
	{
		super( this, pathData );
	}
	
	private override function createModuleProject( classPath : String ) : WebProject
	{
		return new WebProject( classPath );
	}
}