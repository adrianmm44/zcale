/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxf.core.loaders.textLoader.tester;

import hxf.core.Registry;
import hxf.core.loaders.TextLoader;
import hxf.core.tester.events.TesterDispatcher;

class TextLoaderTester extends TesterDispatcher
#if debug
	implements hxf.core.tester.interfaces.ITester
#end
{	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : Registry )
	{
		super( this, reg );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function test( ?testErrors : Bool ) : Void
	{
		var loader = new TextLoader();
		loader.addEventListener( loader.eventType().complete, onLoadComplete );
		loader.addEventListener( loader.eventType().error, 	  onLoadError 	 );
		
		if( testErrors != true ) 
		{
			loader.load( registry.location.rootPath + "test/testFile.txt" );
		}
		else {
			loader.load( registry.location.rootPath + "test/notExists.txt" );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onLoadComplete( loader : TextLoader ) : Void
	{
		eventData().testResults += getTitle( loader );
		eventData().testResults += loader.eventData().text + "\n\n";
		
		dispatchEvent( eventType().complete );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
		
	private function onLoadError( loader : TextLoader ) : Void
	{
		dispatchError( loader.eventData().error, this, "test" );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////