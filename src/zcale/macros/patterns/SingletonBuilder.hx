package zcale.macros.patterns;

import haxe.macro.Context;
import haxe.macro.Expr;

class SingletonBuilder 
{	
	macro public static function build() : Array<Field> // with special thanks to basro who helped me with this code
	{
		var localClass 			  = Context.getLocalClass().get();				
		var localClassTypePath 	  : TypePath 	= { pack : localClass.pack, name : localClass.name };
		var localClassComplexType : ComplexType = TPath( localClassTypePath );
		
		var singleton = macro class Singleton
		{
			private static var instance : $localClassComplexType;
			
			public static function getInstance() : $localClassComplexType
			{
				if( instance == null ){
					instance = new $localClassTypePath();
				}
				return instance;
			}
		}
				
		var outputFields = Context.getBuildFields();
		
		for( field in singleton.fields ){
			 outputFields.push( field );
		}		
		for( field in outputFields ){
			 if( field.name == "new" ){
			 	 field.access.push( APrivate );
				 break;
			 }
		}
		return outputFields;
	}
}