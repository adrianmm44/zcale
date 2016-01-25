/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.core.events;

import zcale.macros.ClassMacros;

using zcale.macros.ArrayExtender;

class ErrorManager
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var data : AsyncData;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( eventData : AsyncData )
	{
		data = eventData;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function setError( instance : Dynamic, methodName : String, errorMessage : Dynamic ) : Void
	{
		data.error.classPath  = ClassMacros.getClassPath( instance );
		data.error.methodName = methodName;
		data.error.message	  = Std.string( errorMessage );
		data.error.crumbs 	  = new Array();

		data.error.crumbs.add( { classPath  : data.error.classPath, 
								 methodName : data.error.methodName } );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////

	public function addCrumb( instance : Dynamic, ?methodName : String ) : Void
	{
		var classPath : String = ClassMacros.getClassPath( instance );

		data.error.crumbs.add({ classPath : classPath, methodName : methodName });
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function toString() : String
	{
		if( data.error.message == null ){
			data.error.message = "no error message available";
		}
		var str = "Error: " + data.error.message;

		for( crumb in data.error.crumbs )
		{
			str += "\n- " + crumb.classPath;

			if( crumb.methodName != null ){
				str += " -> " + crumb.methodName;
			}
		}		
		return str + "\n" + Date.now().toString();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////