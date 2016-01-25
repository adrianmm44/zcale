package zcale.build.projects;

import zcale.build.project.ProjectBase;

class MacroProject extends ProjectBase<MacroProject> 
{	
	public function new( classPath : String )
	{
		super("macro", classPath );
		
		useMainClass.value = false;
		macros.add( classPath + ".main()" );
	}
}