/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.core.boot.targets;

import flash.Lib;
import flash.text.TextField;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

import zcale.core.events.*;
import zcale.core.boot.IBoot;
import zcale.core.boot.ITracer;
import zcale.core.patterns.ISingleton;

class FlashBoot implements IBoot implements ISingleton
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var printHtml : Bool = false;
	public var completed : Bool = false;	
	public var eventKeys : AsyncKeys;
	public var eventData : AsyncData;
	public var event 	 : AsyncDispatcher;
	public var tracer 	 : ITracer;
	
	private var traces 	 : TextField;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function new()
	{
		eventKeys = new AsyncKeys();
		eventData = new AsyncData();
		event 	  = new AsyncDispatcher( this, eventData );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function boot( mainClass : Class<Dynamic> ) : Void
	{
		if( completed == false ){
			Lib.current.stage.align 	= StageAlign.TOP_LEFT;
			Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
			
			traces = new TextField();
			traces.width  = Lib.current.stage.stageWidth;
			traces.height = Lib.current.stage.stageHeight;
			Lib.current.addChildAt( traces, 0 );
			
			completed = true;
		}	
		event.dispatch( eventKeys.complete );
	}
			
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function trace( str : Dynamic ) : Void
	{
		traces.appendText( "\n" + Std.string( str ) );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////