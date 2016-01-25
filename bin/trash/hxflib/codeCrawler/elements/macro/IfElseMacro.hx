/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.codeCrawler.elements.macro;

import hxflib.codeCrawler.CodeElement;
import hxflib.codeCrawler.interfaces.ICodeElement;

class IfElseMacro extends CodeElement implements ICodeElement
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
		
	public function new( reg : Dynamic )
	{
		super( this, reg, "#" );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function newInstance() : ICodeElement
	{
		return new IfElseMacro( registry );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function tryToParse() : Void
	{
		var str : String = modules.current.code.readWord();
		
		switch( str )
		{
			case "#if" 	   : parseIfElse( str );
			case "#elseif" : parseIfElse( str );
			case "#else"   : parseIfElse( str );
			case "#end"    : parseIfElse( str );
			case "#error"  : parseIfElse( str );
			default 	   : dispatchEvent( eventType().parseNot );
		}
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function parseIfElse( str : String ) : Void
	{
		syntax = "\n";		
		modules.current.code.index += modules.current.code.endIndexOf( str );
		
		if( str == "#if" || str == "#elseif" )
		{
			var condition : String = "";
			
			if( modules.current.code.read( 1 ) == "(" )
			{
				condition = modules.current.code.readUntil(")").substr( 1 );
				
				syntax += str + " ( " + StringTools.trim( condition ) + " )";
				
				modules.current.code.index += modules.current.code.endIndexOf(")");
			}
			else {
				condition = modules.current.code.readWord();
							
				syntax += str + " " + condition;
				
				modules.current.code.index += modules.current.code.endIndexOf( condition );
			}
			
			parseExtLib( condition );
		}
		else if( str == "#error" )
		{
			modules.current.code.index += modules.current.code.endIndexOf('"'); // needs to be changed
			modules.current.code.index += modules.current.code.endIndexOf('"'); // needs to be changed
			
			if( modules.current.code.read( 1 ) == ";" ){
				modules.current.code.index += modules.current.code.endIndexOf(';');
			}
			
			syntax += str + " " + '"error"'; // error still needs to be defined
		}
		else {
			syntax += str;
		}
		
		dispatchEvent( eventType().complete );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function parseExtLib( condition : String ) : Void // is not bug free yet
	{
		if( registry.macroInfo.useExternal       == true && 
			condition.indexOf("!useExternal")  	  > -1 && 
			modules.current.code.indexOf("#else") > -1 &&
			modules.current.code.indexOf("#end")  > -1 )
		{
			modules.current.code.index += modules.current.code.endIndexOf("#else");
			
			syntax  = StringTools.replace( syntax, "!", "" );
			syntax += "\n\t" + modules.current.code.readUntil("#end", true );
			
			modules.current.code.index += modules.current.code.endIndexOf("#end");
		}
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////