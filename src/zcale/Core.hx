/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale;

import zcale.core.Boot;
import zcale.core.web.ModuleLoader;

#if modular
	import zcale.core.Path;
	import zcale.core.path.PathData;
	import zcale.PathTools;
	import zcale.core.events.*;
	import zcale.core.events.interfaces.IAsyncDispatcher;
	import zcale.core.patterns.ISingleton;
	import zcale.core.patterns.IMultiton;
	import zcale.core.patterns.MultitonKeys;
	import zcale.core.web.HttpRemote;
	import zcale.core.web.HttpRequest;
	import zcale.core.web.ScriptLoader;
#end

using zcale.macros.ArrayExtender;

@:keep
@:expose

class Core
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private static var bootstrap : Boot;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function boot( mainClass  : Class<Dynamic>, 
								 onComplete : (Void->Void), 
								 ?onError	: (String->Void) ) : Void
	{
		bootstrap = Boot.getInstance();
		bootstrap.event.addListener( bootstrap.eventKeys.complete, function( cls : Boot )
		{
			bootstrap.event.removeAllListeners();
			onComplete();
		});
		bootstrap.event.addListener( bootstrap.eventKeys.error, function( cls : Boot )
		{
			bootstrap.event.removeAllListeners();
			onError( cls.event.error.toString() );
		});
		bootstrap.boot( mainClass );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function bootModules( mainClass  : Class<Dynamic>, 
								 		modules    : Array<String>, 
								 		onComplete : (Void->Void), 
								 		?onError   : (String->Void) ) : Void
	{
		boot( mainClass, function()
		{
			var loader = new ModuleLoader();
			loader.exclude( modules.first() );			
			loader.event.addListener( loader.eventKeys.complete, function( cls : ModuleLoader )
			{
				loader.event.removeAllListeners();
				onComplete();
			});			
			loader.event.addListener( loader.eventKeys.error, function( cls : ModuleLoader )
			{
				loader.event.removeAllListeners();
				if( onError != null ){
					onError( loader.event.error.toString() );
				}
			});			
			loader.load( modules );
		}, 
		function( errorMessage : String )
		{
			if( onError != null ){
				onError( errorMessage );
			}			
		});
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function trace( str : Dynamic ) : Void
	{
		bootstrap.trace( str );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////