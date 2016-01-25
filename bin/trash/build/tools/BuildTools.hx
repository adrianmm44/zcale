package zcale.build.tools;

import haxe.Json;
import sys.io.File;
import sys.FileSystem;
import zcale.Path;
import zcale.server.html.views.HtmlIndex;
import zcale.system.SystemTools;
import zcale.settings.MainSettings;
import zcale.settings.BuildSettings;
import zcale.settings.CoreSettings;
import zcale.macros.ClassMacros;
import zcale.macros.CompileMacros;
import zcale.system.dir.DirCrawler;

using zcale.tools.PathTools;
using zcale.macros.ArrayExtender;

class BuildTools
{	
	public static function getMacroCall() : MacroCall
	{
		return new MacroCall( Type.getClassName( BuildTools ) );
	}
	
	public static function createPath( path : String ) : Void
	{
		SystemTools.createPath( path );
	}
	
	public static function createFlashIndex( relativePath : String, mainFilePath : String ) : Void
	{
		var indexFilePath : String = Path.ROOT_DIR + "/" + relativePath + "/" + HtmlIndex.fileName;
		
		var index 	 = new HtmlIndex();
		index.title  = mainFilePath.lastElement().removeExtension();
		index.target = HtmlIndex.flashTarget;
		index.mainFilePath = mainFilePath;
		
		File.saveContent( indexFilePath, index.toString() );
	}
	
	public static function createJsIndex( relativePath : String, mainFilePath : String ) : Void
	{
		var indexFilePath : String = Path.ROOT_DIR + "/" + relativePath + "/" + HtmlIndex.fileName;
		
		var index 	 = new HtmlIndex();
		index.title  = mainFilePath.lastElement().removeExtension();
		index.target = HtmlIndex.jsTarget;
		index.mainFilePath = mainFilePath;
		
		trace( indexFilePath );
		File.saveContent( indexFilePath, index.toString() );
	}
	
	public static function createAssets( relativePath : String ) : Void
	{
		var sourcePath : String = Path.ROOT_DIR + "/assets";
		var outputPath : String = Path.ROOT_DIR + "/" + relativePath + "/assets";
		
		for( element in DirCrawler.crawl( sourcePath ) )
		{
			if( element.isDir == true ){
				SystemTools.createPath(  outputPath + element.relativePath );
			}
			else {
				File.copy( element.path, outputPath + element.relativePath );
			}
		}
	}
	
	public static function createHtAccess( relativeDir : String ) : Void
	{
		var htaccessPath = Path.ROOT_DIR + "/" + relativeDir + "/.htaccess";
		var content 	 = "RewriteEngine on";
		content		    += "\n\n" + "RewriteRule !(jpg|png|gif|swf|css|js|txt|css.*|bin.*)$ index.php";
		
		File.saveContent( htaccessPath, content );
	}
	
	public static function excludeSources( sources : Array<String> ) : Void
	{
		CompileMacros.excludeSources( sources );
	}
	
	public static function exposeToWindow( sources : Array<String> ) : Void
	{
		CompileMacros.exposeToWindow( sources );
	}
}

class MacroCall 
{	
	private var classPath : String;
	
	public function new( classPath : String )
	{
		this.classPath = classPath;
	}
	
	public function createPath( relativePath : String ) : String
	{
		return classPath + '.' + ClassMacros.getLocalMethod() + '("' + relativePath + '")';
	}
	
	public function createFlashIndex( relativePath : String, mainFilePath : String ) : String
	{
		return classPath + '.' + ClassMacros.getLocalMethod() + '("' + relativePath + '","' + mainFilePath + '")';
	}
	
	public function createJsIndex( relativePath : String, mainFilePath : String ) : String
	{
		return classPath + '.' + ClassMacros.getLocalMethod() + '("' + relativePath + '","' + mainFilePath + '")';
	}

	public function createAssets( relativePath : String ) : String
	{
		return classPath + '.' + ClassMacros.getLocalMethod() + '("' + relativePath + '")';
	}
	
	public function createHtAccess( relativePath : String ) : String
	{
		return classPath + '.' + ClassMacros.getLocalMethod() + '("' + relativePath + '")';
	}
	
	public function excludeSources( sources : Array<String> ) : String
	{
		return classPath + '.' + ClassMacros.getLocalMethod() + '(' + Json.stringify( sources ) + ')';
	}
	
	public function exposeToWindow( sources : Array<String> ) : String
	{
		return classPath + '.' + ClassMacros.getLocalMethod() + '(' + Json.stringify( sources ) + ')';
	}
}