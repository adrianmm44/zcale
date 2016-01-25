/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxf.build;

import sys.io.File;
import sys.FileSystem;

import hxf.core.tools.PathTools;
import hxf.core.events.EventDispatcher;

import hxf.core.Registry;
import hxf.system.dir.DirTools;
import hxf.core.tools.ClassTools;

import hxflib.CodeCrawler;
import hxflib.codeCrawler.elements.Module;

typedef FileType = {
    var name  : String;
    var index : Int;
}

class ExtLibGenerator extends EventDispatcher
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var useExternal : Bool = false;
	
	private var registry  : Registry;
	private var sources   : Array<String>;
	private var buildPath : String;
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : Registry, sources : Array<String> ) // sourcePath : String
	{
		super( this );
		
		this.registry  = reg;
		this.sources   = sources;		
		this.buildPath = PathTools.popDirectory( PathTools.seekUpperDirectory( registry.location.rootPath, "bin" ));
	} 
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function generate( classPath : String ) : Void
	{
		var fileFound : Bool = false;
		classPath = StringTools.replace( classPath, ".", "/" ) + ".hx";
		
		for( sourcePath in sources )
		{
			var filePath = buildPath + sourcePath + classPath;
			
			if( FileSystem.exists( filePath ) == true )
			{
				fileFound   = true;
				var crawler = new CodeCrawler( new Registry() );
				crawler.useExternal	= useExternal;
				crawler.haxeStdPath = '/usr/lib/haxe/std/';
				crawler.addEventListener( crawler.eventType().complete, onCrawlingComplete );
				crawler.addEventListener( crawler.eventType().error, 	onCrawlingError );
				crawler.crawl( filePath );
				break;
			}
		}
		
		if( fileFound == false ){
			dispatchError( eventData().error, this, ClassTools.getLocalMethod(), "Class not found: " + classPath );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onCrawlingComplete( crawler : CodeCrawler ) : Void
	{
		exportExtLib( crawler.getModules() );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onCrawlingError( crawler : CodeCrawler ) : Void
	{
		dispatchError( crawler.eventData().error, this, "generate" );
	}	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function exportExtLib( modules : Map<String,Module> ) : Void
	{
		//var i : Int = 0;
		
		for( module in modules )
		{
			var nativeClassPath : String = module.path;
			
			if( module.pkg.packagePath.length > 0 ){
				module.pkg.packagePath = "ext." + module.pkg.packagePath;
			}
			else {
				module.pkg.packagePath = "ext"  + module.pkg.packagePath;
			}
						
			for( importElement in module.imports )
			{
				 importElement.importPath = "ext." + importElement.importPath;
			}
			
			for( cls in module.classes )
			{				
				for( extension in cls.extensions )
				{
					if( extension.isImported == false )
					{
						extension.name = "ext." + extension.name;
					}
				}
				
				for( implementation in cls.implementations )
				{
					if( implementation.isImported == false )
					{
						implementation.name = "ext." + implementation.name;
					}
				}
			}
						
			module.printComments = false;			
			var code : String = module.toString();
			code = setNativeClassPath( code, nativeClassPath, module.type );
			
			var relativePath = StringTools.replace( module.pkg.packagePath, ".", "/" );
						
			if( relativePath.length > 0 ){
				relativePath += "/";
			}
			
			relativePath += module.name + ".hx";
			
			var extFilePath : String = buildPath + "src/" + relativePath;
			
			DirTools.createDirPath( PathTools.directory( extFilePath ));
			
			File.saveContent( extFilePath, module.toString() );
			/*/			
			trace( code );
			
			i++;
			
			if( i == 20 ){
				break;
			}
			/*/
		}
		
		dispatchEvent( eventType().complete );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function setNativeClassPath( code : String, path : String, documentType : String ) : String
	{
		var typeIndex : Int    = code.indexOf( documentType + " " );
		var headCode  : String = code.substr( 0, typeIndex );
		var bodyCode  : String = code.substr( typeIndex );
		
		if( headCode.indexOf("@:native") < 0 ){
			headCode += '@:native("' + path + '")' + "\n";
		}
		
		return headCode + bodyCode;
	}
			
	/////////////////////////////////////////////////////////////////////////////////////////////////////

	public function set_useExternal( value : Bool ) : Bool
	{
		return useExternal = value;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////