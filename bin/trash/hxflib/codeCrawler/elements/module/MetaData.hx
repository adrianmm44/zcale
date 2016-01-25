/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.codeCrawler.elements.module;

import hxflib.codeCrawler.CodeElement;
import hxflib.codeCrawler.interfaces.ICodeElement;

class MetaData extends CodeElement implements ICodeElement
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : Dynamic )
	{
		super( this, reg, "@" );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function newInstance() : ICodeElement
	{
		return new MetaData( registry );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function tryToParse() : Void
	{
		var result : Bool 	= false;
		var str    : String = modules.current.code.readWord("(");
		
		switch( str )
		{
			case "@:final" :
				
				result = true;
				syntax = "\n" + str;
				modules.current.code.index += modules.current.code.endIndexOf( str );
			
			case "@:native" :
				
				result = true;
				syntax = "\n" + modules.current.code.readUntil(")", true );
				modules.current.code.index += modules.current.code.endIndexOf(")");
			
			case "@:expose" :

				result = true;
				syntax = "\n" + str;
				modules.current.code.index += modules.current.code.endIndexOf( str );

				if( modules.current.code.read( 1 ) == "(" ){
					syntax += modules.current.code.readUntil(")", true );
					modules.current.code.index += modules.current.code.endIndexOf(")");
				}
			
			case "@:keep" :

				result = true;
				syntax = "\n" + str;
				modules.current.code.index += modules.current.code.endIndexOf( str );
			
			case "@:fakeEnum" :

				result = true;
				syntax = "\n" + modules.current.code.readUntil(")", true );
				modules.current.code.index += modules.current.code.endIndexOf(")");
						
			case "@:noDoc" :
			
				result = true;
				syntax = "\n" + str;
				modules.current.code.index += modules.current.code.endIndexOf( str );
		}
				
		if( result == true )
		{
			dispatchEvent( eventType().complete );
		}
		else {
			dispatchEvent( eventType().parseNot );
		}
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////