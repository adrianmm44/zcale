package zcale.build;

import sys.io.File;
import zcale.Path;
import zcale.settings.BuildSettings;
import zcale.build.tools.BuildTools;
import zcale.build.projects.*;
//import zcale.build.project.ProjectOptions;
import zcale.build.project.fields.Options;
import zcale.patterns.interfaces.IStringable;
import zcale.types.chains.BoolChain;

using zcale.types.helpers.StringHelper;

class Builder {
	
	public static var project = new ProjectCreator();	
	public static var view 	  = new BuilderView();
	
	private static var instance : Builder;
		
	public static function getInstance() : Builder {
		
		if( instance == null ){
			instance = new Builder();
		}
		return instance;
	}
	
	private var projects 	   : Array<IStringable>;
	
	public var directories 	   : Options<Builder>;
	public var macros 		   : Options<Builder>;
	public var showHelpMetas   : BoolChain<Builder>;
	public var showHelpOptions : BoolChain<Builder>;
	
	private function new() {
		
		projects 		= new Array();
		directories 	= new Options(   this, "");
		macros 			= new Options(   this, "--macro");
		showHelpMetas 	= new BoolChain( this, false );
		showHelpOptions = new BoolChain( this, false );
	}
	
	public function add( projects : Array<IStringable> ) : Builder {
		
		for( project in projects ) {
			 this.projects.push( project );
		}
		return this;
	}
	
	public function addProject( project : IStringable ) : Builder {
		
		projects.push( project );
		return this;
	}
	
	private function setMacros() : Void {
		
		for ( dir1 in directories ) {			
			var isAllowed : Bool = true;			
			for ( dir2 in directories ) {
				if( dir1.length < dir2.length && dir2.startsWith( dir1 )) {
					isAllowed = false;
					break;
				}
			}
			if( isAllowed ) {
				macros.add( BuildTools.getMacroCall().createPath( dir1 ) );
			}			
		}
	}
	
	private function getMacros() : String {
		
		setMacros();		
		var str = "";		
		if( macros.length > 0 ){
			str = "\n\n" + view.shortComment + " Macros" + macros.toString();
		}
		return str;
	}
	
	private function getHxml() : String {
		
		var str  : String = view.longComment;
		var hxml : Array<String> = [];
		
		for ( project in projects ) {
			 hxml.push( project.toString() );
		}
		str += getMacros() + hxml.join("\n\n--next");
		
		if( showHelpOptions == true ) {
			str += "\n" + "--help-defines";
		}
		
		if( showHelpMetas == true ) {
			str += "\n" + "--help-metas";
		}
		return str.ltrim() + "\n\n" + view.longComment;
	}
	
	public function buildHxml( saveHxml : Bool = true ) : Void {
		
		var hxml : String = getHxml();		
			
		if( saveHxml == false ) {
			Sys.print( hxml );
			hxml = "--macro define('this hxml does nothing')";
		}		
		File.saveContent( Path.ROOT_DIR + '/' + BuildSettings.buildScriptName, hxml );
	}
}

abstract ProjectCreator( Dynamic ) {
	
	@:extern public inline function new() {
		
		this = {};
	}
	
	@:extern public inline function buildMacro( classPath : String ) : MacroProject {
		
		return new MacroProject( classPath );
	}
	
	@:extern public inline function flash( classPath : String, ?outputPath : String ) : FlashProject {
		
		return new FlashProject( classPath, outputPath );
	}
	
	@:extern public inline function js( classPath : String, ?outputPath : String ) : JsProject {
		
		return new JsProject( classPath, outputPath );
	}	
	
	@:extern public inline function php( classPath : String, ?outputPath : String ) : PhpProject {
		
		return new PhpProject( classPath, outputPath );
	}
	
	@:extern public inline function xml( classPath : String, ?outputPath : String ) : CustomProject {
		
		return new CustomProject( "xml", classPath, outputPath );
	}
	
	@:extern public inline function html( classPath : String, ?outputPath : String ) : CustomProject {
		
		return new CustomProject( "html", classPath, outputPath );
	}
	
	@:extern public inline function css( classPath : String, ?outputPath : String ) : CustomProject {
		
		return new CustomProject( "css", classPath, outputPath );
	}
	
	@:extern public inline function tpl( classPath : String, ?outputPath : String ) : CustomProject  {
		
		return new CustomProject( "tlp", classPath, outputPath );
	}
}

abstract BuilderView( String ) {
	
	@:extern public var shortComment( get, never ) : String;
	@:extern public var longComment(  get, never ) : String;
		
	@:extern public inline function new() {		
		this = "";
	}
	
	@:extern private inline function get_shortComment() : String {		
		return "########";
	}
	
	@:extern private inline function get_longComment() : String {
		return "############################################################################";
	}
}
/*/
import zcale.builder.projects.modular.ModularFlashProject;
import zcale.builder.projects.modular.ModularJsProject;
import zcale.builder.projects.modular.ModularPhpProject;
import zcale.builder.projects.modular.ModularWebProject;

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