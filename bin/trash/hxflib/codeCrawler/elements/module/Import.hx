/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.codeCrawler.elements.module;

import hxf.core.tools.PathTools;
import hxf.core.system.dir.DirCrawler;
import hxf.core.system.dir.DirElement;
import hxflib.codeCrawler.CodeElement;
import hxflib.codeCrawler.interfaces.ICodeElement;
import hxflib.codeCrawler.elements.Module;

typedef ImportPath = {
    var importName : String;
	var importPath : String;
    var filePath   : String;
}

class Import extends CodeElement implements ICodeElement
{	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var importName : String;
	public var importPath : String;	
	public var multipleImports : Array<ImportPath>;
	
	private var importCounter : Int;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : Dynamic )
	{
		super( this, reg, "import" );
		
		this.closeChar = ";";
		this.multipleImports = new Array();
		
		resetImportCounter();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function newInstance() : ICodeElement
	{
		return new Import( registry );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function tryToParse() : Void
	{
		var str : String = modules.current.code.read( keyword.length );
		
		if( str == keyword )
		{
			modules.current.code.index += modules.current.code.endIndexOf( keyword );
			
			parseImport();
		}
		else {
			dispatchEvent( eventType().parseNot );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function parseImport() : Void
	{
		importPath = modules.current.code.readWord(";");
		importName = PathTools.lastElement( importPath, "." );
		modules.current.code.index += modules.current.code.endIndexOf( importPath );		
		modules.current.imports.push( this );		
		//trace( importPath );
		var lastDir : String = PathTools.lastElement( importPath, "." );
		
		if( lastDir != "*" )
		{
			multipleImports[ 0 ] = { importName : importName, 
							 		 importPath : importPath, 
							 		 filePath 	: registry.getFilePath( importPath ) };
			parseNextImport();
		}
		else {
			var importDir  = registry.projectPath + StringTools.replace( PathTools.popDirectory( importPath, "." ), ".", "/" );			
			var dirCrawler = new DirCrawler( registry.core );
			dirCrawler.addEventListener( dirCrawler.eventType().complete, onDirCrawlingComplete );
			dirCrawler.addEventListener( dirCrawler.eventType().error, 	  onDirCrawlingError );
			dirCrawler.crawl( importDir );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function parseNextImport() : Void
	{
		importCounter++;
		
		if( importCounter < multipleImports.length )
		{
			var modulePath : String = multipleImports[ importCounter ].importPath;
			var filePath   : String = multipleImports[ importCounter ].filePath;
									
			if( modules.moduleExists( modulePath ) == false )
			{
				var module = new Module( registry, filePath );
				module.addEventListener( module.eventType().complete, onImportParseComplete );
				module.addEventListener( module.eventType().error, 	  onImportParseError );
				module.parse();
			}
			else {
				parseNextImport();
			}
		}
		else {
			resetImportCounter();
			endParse();
		}
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onImportParseComplete( module : Module ) : Void
	{
		parseNextImport();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onImportParseError( module : Module ) : Void
	{
		dispatchError( module.eventData().error, this, "parseImport" );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onDirCrawlingComplete( dirCrawler : DirCrawler ) : Void
	{		
		for( element in dirCrawler.eventData().dirElements )
		{
			if( element.levelDepth == 0 && element.isFile == true )
			{
				var importFilePath : String = element.path + element.name;
				
				multipleImports.push( { importName : element.name.substr( 0, element.name.indexOf(".") ), 
										importPath : registry.getModulePath( importFilePath ), 
										filePath   : importFilePath } );
			}
		}
		
		parseNextImport();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onDirCrawlingError( dirCrawler : DirCrawler ) : Void
	{
		dispatchError( dirCrawler.eventData().error, this, "parseImport" );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function resetImportCounter() : Void
	{
		importCounter = -1;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public override function toString() : String
	{
		return "\n" + "import " + importPath + ";";
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////