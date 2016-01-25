package zcale.builder.projects.modular.base;

import zcale.builder.projects.interfaces.IPlatformProject;
import zcale.builder.projects.modular.base.ModularProject;

using StringTools;
using zcale.macros.ArrayExtender;

class Module<T:IPlatformProject>
{	
	public var module 	 : T;
	public var classPath : String;
		
	public function new( project : ModularProject<T>, moduleGroups : Array<Array<String>> )
	{
		var sources : Array<String> = moduleGroups.removeFirst();	
		classPath = sources.removeFirst();
		module 	  = project.createModuleProject( classPath );		
		module.options.isModule = true;
		module.createIndex = false;
		
		setExcludedSources( moduleGroups );
		
		if( moduleGroups.length > 0 ){
			new Module( project, moduleGroups );
		}
		
		if( project.hasModule( classPath ) == false ){
			project.modules.push( this );
		}
	}
	
	private function setExcludedSources( moduleGroups : Array<Array<String>> ) : Void
	{
		module.options.excludedSources = [];
		
		for( moduleSources in moduleGroups )
		{
			for( source in moduleSources )
			{
			   	if( classPath.startsWith( source ) == false ) // this prevents this module being excluded from compilation
				{
			   		module.options.excludedSources.push( source );
			   	}
			}
		}
	}
	
	public function toString() : String
	{
		return module.toString();
	}
}