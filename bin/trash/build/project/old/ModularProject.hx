package zcale.builder.projects.modular.base;

import zcale.Modules;
import zcale.CaseTools;
import zcale.macros.ClassMacros;
import zcale.builder.BuildTools;
import zcale.builder.projects.modular.base.Module;
import zcale.builder.projects.interfaces.IProject;
import zcale.builder.projects.interfaces.IPlatformProject;

using Lambda;
using zcale.PathTools;
using zcale.macros.ArrayExtender;

@:allow( zcale.builder.projects.modular.base.Module )

class ModularProject<T:IPlatformProject> implements IProject
{	
	public var main 	: Module<T>;
	
	private var project : ModularProject<T>;
	private var modules : Array<Module<T>>;
	private var current : Module<T>;	
		
	function new( project : ModularProject<T>, moduleSequence : Array<String> )
	{
		this.project = project;
		this.modules = new Array();
		this.addModule( moduleSequence );				
		main = current;
		main.module.options.isMainModule = true;
		main.module.createIndex = true;
				
		for( source1 in Modules.getCore() ){ 
		for( source2 in main.module.options.excludedSources )
		{
			if( source1 == source2 ){
				main.module.options.excludedSources.remove( source2 );
			}
		}}
	}
	
	private function createModuleProject( classPath : String ) : T // needs to be overridden
	{
		return null;
	}
	
	public function addModule( moduleSequence : Array<String> ) : ModularProject<T>
	{	
		var moduleGroups : Array<Array<String>> = [];
		
		if( moduleSequence.length == 0 )
		{
			throw "Array has no path data";
		}
		else if( hasModule( moduleSequence.first() ) == true )
		{
			throw "Module '" + moduleSequence.first() + "' already exists";
		}
		else{
			for( modulePath in moduleSequence )
			{	
				if( CaseTools.isUpperCase( modulePath.lastElement(".").firstChar() ) == true )
				{
					moduleGroups.push([ modulePath ]);
				}
				else if( moduleGroups.length > 0 )
				{	
					moduleGroups.last().push( modulePath );
				}
				else{
					throw "Array does not start with class path";
					break;
				}
			}
		}
		current = new Module<T>( project, moduleGroups );		
		return project;
	}
	
	public function hasModule( classPath : String ) : Bool
	{
		var result = false;
			
		if( classPath == Modules.getCore().first() ){
			result = true;
		}
		else{
			for( module in modules )
			{	
				if( module.classPath == classPath ){
					result = true;
					break;
				}
			}
		}
		return result;
	}
	
	public function toString() : String
	{
		var array : Array<String> = [];
		
		for( module in modules )
		{
			var str = module.toString();
			if( str.length > 0 ){
				array.push( module.toString() );
			}
		}
		return array.join("\n\n--next");
	}
}