package zcale.builder.projects.modular;

import zcale.builder.projects.PhpProject;
import zcale.builder.projects.modular.base.ModularProject;

class ModularPhpProject extends ModularProject<PhpProject>
{			
	public function new( moduleSequence : Array<String> )
	{
		super( this, moduleSequence );
	}
		
	private override function createModuleProject( classPath : String ) : PhpProject
	{
		return new PhpProject( classPath );
	}
}