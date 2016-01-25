package zcale.build;

import sys.io.File;
import zcale.Path;
import zcale.settings.BuildSettings;
import zcale.build.tools.BuildTools;
import zcale.build.projects.*;
import zcale.build.project.options.OptionsArray;
import zcale.patterns.interfaces.IStringable;

using StringTools;
using zcale.macros.ArrayExtender;

class Builder
{	
	public static var project : ProjectCreator = new ProjectCreator();
	
	public static var view = { shortComment : "########", 
							   longComment  : "############################################################################" };
	
	private static var instance : Builder;
		
	public static function getInstance() : Builder
	{
		if( instance == null ){
			instance = new Builder();
		}
		return instance;
	}
	
	private var projects 	   : Array<IStringable>;
	
	//public var project   	   : ProjectCreator;
	public var directories 	   : OptionsArray;
	public var macros 		   : OptionsArray;
	public var showHelpMetas   : Bool = false;
	public var showHelpOptions : Bool = false;
	
	private function new()
	{
		projects 	= new Array();
		//project 	= new ProjectCreator();
		directories = new OptionsArray([""]);
		macros 		= new OptionsArray(["--macro"]);
	}
	
	public function add( projects : Array<IStringable> ) : Builder
	{
		for( project in projects ){
			 this.projects.push( project );
		}
		return this;
	}
	
	public function addProject( project : IStringable ) : Builder
	{
		projects.push( project );
		return this;
	}
	
	private function setMacros() : Void
	{
		for( dir1 in directories )
		{
			var allowed : Bool = true;
			
			for( dir2 in directories )
			{
				if( dir1.length < dir2.length && dir2.startsWith( dir1 ) == true ){
					allowed = false;
					break;
				}
			}
			if( allowed == true ){
				macros.add( BuildTools.getMacroCall().createPath( dir1 ) );
			}			
		}
	}
	
	private function getMacros() : String
	{
		setMacros();
		
		var str = "";		
		if( macros.length > 0 ){			
			str = "\n\n" + view.shortComment + " Macros" + macros.toString();
		}
		return str;
	}
	
	private function getHxml() : String
	{
		var str  : String = view.longComment;
		var hxml : Array<String> = [];
		
		for( project in projects ){
			 hxml.push( project.toString() );
		}		
		str += getMacros() + hxml.join("\n\n--next");
		
		if( showHelpOptions == true ){
			str += "\n" + "--help-defines";
		}
		
		if( showHelpMetas == true ){
			str += "\n" + "--help-metas";
		}		
		return str.ltrim() + "\n\n" + view.longComment;
	}
	
	public function buildHxml( saveHxml : Bool = true ) : Void
	{
		var hxml : String = getHxml();		
			
		if( saveHxml == false ){
			Sys.print( hxml );
			hxml = "--macro define('this hxml does nothing')";
		}
		
		File.saveContent( Path.ROOT_DIR + '/' + BuildSettings.buildScriptName, hxml );
	}
}

/*/
import zcale.builder.projects.modular.ModularFlashProject;
import zcale.builder.projects.modular.ModularJsProject;
import zcale.builder.projects.modular.ModularPhpProject;
import zcale.builder.projects.modular.ModularWebProject;
/*/
class ProjectCreator 
{	
	// public var modular : ModularProjectCreator;
	
	public function new()
	{
		// modular = new ModularProjectCreator();
	}
	
	public function flash( classPath : String ) : FlashProject
	{
		return new FlashProject(  classPath );
	}
	
	public function js( classPath : String, ?outputPath : String ) : JsProject
	{
		return new JsProject(  classPath, outputPath );
	}
	
	public function php( classPath : String, ?outputPath : String ) : PhpProject
	{
		return new PhpProject(  classPath, outputPath );
	}
	/*/
	public function web( classPath : String ) : WebProject 
	{
		return new WebProject(  classPath );
	}
	/*/
	public function css( classPath : String, ?outputPath : String ) : CssProject 
	{
		return new CssProject(  classPath, outputPath );
	}
	
	public function tpl( classPath : String, ?outputPath : String ) : TplProject 
	{
		return new TplProject(  classPath, outputPath );
	}
	
	public function buildMacro( classPath : String ) : MacroProject
	{
		return new MacroProject(  classPath );
	}
}
/*/
private class ModularProjectCreator
{
	public function new(){}
		
	public function flash( moduleSequence : Array<String> ) : ModularFlashProject
	{
		return new ModularFlashProject( moduleSequence );
	}
	
	public function js( moduleSequence : Array<String> ) : ModularJsProject
	{
		return new ModularJsProject( moduleSequence );
	}
	
	public function php( moduleSequence : Array<String> ) : ModularPhpProject
	{
		return new ModularPhpProject( moduleSequence );
	}
	
	public function web( moduleSequence : Array<String> ) : ModularWebProject
	{
		return new ModularWebProject( moduleSequence );
	}
}
/*/