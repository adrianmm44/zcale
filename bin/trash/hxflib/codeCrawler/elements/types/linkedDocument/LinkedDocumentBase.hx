/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.codeCrawler.elements.types.linkedDocument;

import hxflib.codeCrawler.CodeElement;
import hxflib.codeCrawler.elements.Module;

class LinkedDocumentBase extends CodeElement
{	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var name : String;	
	public var isImported : Bool = false;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( sub : Dynamic, reg : Dynamic, keyword : String )
	{
		super( sub, reg, keyword );
	}
			
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function tryToParse() : Void
	{
		var str : String = modules.current.code.read( keyword.length );
		
		if( str == keyword )
		{
			modules.current.code.index += modules.current.code.endIndexOf( keyword );
			modules.current.classes[ modules.current.classes.length - 1 ].extensions.push( targetClass );
			
			parseLinkedModule();
		}
		else {
			dispatchEvent( eventType().parseNot );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function parseLinkedModule() : Void
	{
		name = modules.current.code.readWord("{");
		modules.current.code.index += modules.current.code.endIndexOf( name );
		
		checkImports();
				
		if( isImported == false )
		{
			if( name.indexOf(".") < 0 )
			{
				var currentPackage : String = modules.current.pkg.packagePath;
				
				if( currentPackage.length > 0 ){
					name = currentPackage + "." + name;
				}
			}
			
			if( modules.moduleExists( name ) == false )
			{
				var filePath : String = registry.getFilePath( name );
				var module = new Module( registry, filePath );
				module.addEventListener( module.eventType().complete, onParseComplete );
				module.addEventListener( module.eventType().error, 	  onParseError );
				module.parse();
			}
			else {
				dispatchEvent( eventType().complete );
			}
		}
		else {
			dispatchEvent( eventType().complete );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function checkImports() : Void
	{
		for( import1 in modules.current.imports )
		{
			for( import2 in import1.multipleImports )
			{
				if( import2.importName == name ){
					isImported = true;
					break;
				}
			}
			
			if( isImported == true ){
				break;
			}
		}
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onParseComplete( module : Module ) : Void
	{
		dispatchEvent( eventType().complete );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onParseError( module : Module ) : Void
	{
		dispatchError( module.eventData().error, this, "parseLinkedDocument" );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public override function toString() : String
	{
		return "\n" + keyword + " " + name;
	}
			
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////