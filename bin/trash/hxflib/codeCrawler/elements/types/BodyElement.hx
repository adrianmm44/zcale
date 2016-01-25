/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.codeCrawler.elements.types;

import hxflib.codeCrawler.CodeElement;
import hxflib.codeCrawler.elements.types.linkedDocument.Extension;
import hxflib.codeCrawler.elements.types.linkedDocument.Implementation;

class BodyElement extends CodeElement
{		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var name 		   : String = "";
	public var extensions 	   : Array<Extension>;
	public var implementations : Array<Implementation>;
	
	private var isExtern 	   : Bool;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( sub : Dynamic, reg : Dynamic, keyword : String )
	{
		super( sub, reg, keyword );
		
		extensions 	    = new Array();
		implementations = new Array();
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public override function startsWith( char : String ) : Bool
	{
		if( char == keyword.substr( 0, 1 ) || char == "e" ) // e is for extern
		{
			return true;
		}
		else {
			return false;
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
		
	public function tryToParse() : Void
	{
		var str : String = modules.current.code.readWord();
		
		if( str == "extern" )
		{
			isExtern = true;
			modules.current.code.index += modules.current.code.endIndexOf( str );
			
			str = modules.current.code.readWord();
		}
		
		if( str == keyword )
		{
			modules.current.type = keyword;
			modules.current.classes.push( targetClass );
			modules.current.code.index += modules.current.code.endIndexOf( keyword );
			
			name = modules.current.code.readWord("{");
			
			modules.current.code.index += modules.current.code.endIndexOf( name );
			
			startParse();
		}
		else 
		{
			if( isExtern == true ){
				modules.current.code.index -= 6;
			}
			
			dispatchEvent( eventType().parseNot );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public override function toString() : String
	{
		syntax = "\n";
		
		if( isExtern == true ){
			syntax += "extern ";
		}
		
		syntax += keyword + " " + name;
		
		for( element in registeredElements )
		{
			syntax += element.toString();
		}
		
		return syntax;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////