
package zcale.build.project;

import zcale.build.Builder;
//import zcale.build.project.ProjectOptions;
import zcale.build.project.fields.Options;
import zcale.build.project.fields.Variables;
import zcale.events.Event;
import zcale.events.EventListeners;
import zcale.settings.BuildSettings;
import zcale.types.chains.BoolChain;
import zcale.patterns.interfaces.IStringable;

using zcale.tools.PathTools;

class ProjectBase<T:ProjectBase<T>> implements IStringable {
	
	private var self 		   : T;
	private var targetName 	   : String;
	private var className  	   : String;
	private var classPath  	   : String;
	
	public var doCompile	   : BoolChain<T>;
	public var useMainClass    : BoolChain<T>;
	public var useMainFunction : BoolChain<T>;
	public var sources 	   	   : Options<T>;
	public var libs    	   	   : Options<T>;
	public var flags   	   	   : Options<T>;	
	public var macros  	   	   : Options<T>;	
	public var vars 		   : Variables<T>;
	public var listeners   	   : EventListeners<T>;
	
	public function new( targetName : String, classPath : String ) {
		
		this.self 		= cast this;
		this.targetName = targetName;
		this.classPath  = classPath;
		this.className  = classPath.lastElement(".");		
		doCompile		= new BoolChain( self, true );
		useMainClass	= new BoolChain( self, true );
		useMainFunction = new BoolChain( self, true );
				
		sources 		= new Options(   self, "-cp");
		libs 			= new Options(   self, "-lib");
		flags			= new Options(   self, "");
		macros			= new Options(   self, "--macro");
		vars			= new Variables( self );		
		listeners 		= new EventListeners( self );
				
		sources.add("src");
		libs.add( BuildSettings.zcaleLibName );		
		macros.add('exclude("' + BuildSettings.zcaleMacrosPath   + '")');
		macros.add('exclude("' + BuildSettings.zcaleSettingsPath + '")');
		
		listeners.add( Event.TO_STRING, setBaseOptions );
	}
	
	private function setBaseOptions( self : T ) : Void {
		
		if( useMainClass ) {
			if( useMainFunction ) {
				flags.add( "-main " + classPath );
			}
			else {
				flags.add( classPath );
			}
		}
	}
		
	public function toString() : String {
		
		var str = "";
		if( doCompile ){
			listeners.dispatch( Event.TO_STRING );
			str += "\n\n" + Builder.view.shortComment + " " + className + " >>> " + targetName;
			str += sources.toString();
			str += libs.toString();
			str += flags.toString();
			str += vars.toString();
			str += macros.toString();
		}
		return str;
	}
}