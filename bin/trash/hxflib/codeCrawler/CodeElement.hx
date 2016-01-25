/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.codeCrawler;

import hxf.core.tools.ClassTools;
import hxf.core.tools.TextTools;
import hxflib.codeCrawler.interfaces.ICodeElement;
import hxflib.codeCrawler.events.CodeDispatcher;

class CodeElement extends CodeDispatcher
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
		
	private var syntax 			   : String = "";
	private var keyword 		   : String;
	private var openChar 		   : String;
	private var closeChar 		   : String;
	private var counter   		   : Int;
	private var potentialElements  : Array<ICodeElement>;
	private var registeredElements : Array<ICodeElement>;
	
	public var allowRegister 	   : Bool = true;
	public var isLastElement 	   : Bool = false;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( sub : Dynamic, reg : Dynamic, ?keyword : String )
	{
		super( sub, reg );
		
		this.keyword 	   = keyword;		
		potentialElements  = new Array();
		registeredElements = new Array();
		resetCounter();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function startsWith( char : String ) : Bool
	{
		if( keyword != null && char == keyword.substr( 0, 1 ) )
		{
			return true;
		}
		else {
			return false;
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	private function getElements() : Array<ICodeElement>
	{
		return registeredElements;
	}
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function addElement( element : ICodeElement ) : Void
	{
		registeredElements.push( element );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function addPotentialElement( element : ICodeElement ) : Void
	{
		element.addEventListener( element.eventType().complete, 	onElementParseComplete );
		element.addEventListener( element.eventType().parseNot, 	onElementParseNot );
		element.addEventListener( element.eventType().parsePackage, onElementParsePackage );
		element.addEventListener( element.eventType().error, 		onElementError );
		
		potentialElements.push( element );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function startParse() : Void
	{
		resetCounter();
		parseNextElement();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function parseNextElement() : Void
	{
		counter++;
		
		if( counter < potentialElements.length )
		{
			parseCurrentElement();
		}
		else {
			endParse();
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function parseCurrentElement() : Void
	{
		var char : String = modules.current.code.read( 1 );
		
		if( potentialElements[ counter ].startsWith( char ) == true ){
			potentialElements[ counter ].tryToParse();
		}
		else {
			parseNextElement();
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function endParse() : Void
	{
		if( modules.current.code.read() == "" )
		{
			dispatchEvent( eventType().complete );
		}
		else if( modules.current.code.read( 1 ) == openChar )
		{
			modules.current.code.index += modules.current.code.endIndexOf( openChar );
			startParse();
		}
		else if( modules.current.code.read( 1 ) == closeChar )
		{
			modules.current.code.index += modules.current.code.endIndexOf( closeChar);
			dispatchEvent( eventType().complete );
		}
		else {
			dispatchError( eventData().error, targetClass, ClassTools.getLocalMethod(), "Unexpected " + modules.current.code.read() );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onElementParseComplete( element : ICodeElement ) : Void
	{
		if( element.allowRegister == true )
		{
			element.removeAllListeners();
			this.addElement( element );
			
			potentialElements[ counter ] = element.newInstance();
						
			element = potentialElements[ counter ];		
			element.addEventListener( element.eventType().complete, 	onElementParseComplete );
			element.addEventListener( element.eventType().parseNot, 	onElementParseNot );
			element.addEventListener( element.eventType().parsePackage, onElementParsePackage );
			element.addEventListener( element.eventType().error, 		onElementError );
		}
		
		if( element.isLastElement == false ){
			startParse();
		}
		else {
			dispatchEvent( eventType().complete );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onElementParseNot( element : ICodeElement ) : Void // this method is called when tryToParse() fails
	{
		parseNextElement();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onElementParsePackage( element : ICodeElement ) : Void
	{
		dispatchEvent( eventType().parsePackage );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onElementError( element : ICodeElement ) : Void
	{
		dispatchError( element.eventData().error, targetClass, "parse" );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function resetCounter() : Void
	{
		counter = -1;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function toString() : String
	{
		if( potentialElements.length > 0 )
		{
			syntax = "";
			
			for( element in registeredElements )
			{
				syntax += element.toString();
			}
		}
		
		return syntax;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////