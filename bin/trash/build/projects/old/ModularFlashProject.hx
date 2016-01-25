package zcale.builder.projects.modular;

import zcale.builder.projects.FlashProject;
import zcale.builder.projects.modular.base.ModularProject;

class ModularFlashProject extends ModularProject<FlashProject>
{	
	public function new( moduleSequence : Array<String> )
	{
		super( this, moduleSequence );
	}
		
	private override function createModuleProject( classPath : String ) : FlashProject
	{
		return new FlashProject( classPath );
	}
}