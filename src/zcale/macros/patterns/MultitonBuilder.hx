/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.macros.patterns;

import haxe.macro.Context;
import haxe.macro.Expr;

using  zcale.macros.ArrayExtender;

class MultitonBuilder 
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	macro public static function build() : Array<Field> // with special thanks to basro who helped me with this code
	{
		var localClass 			  = Context.getLocalClass().get();
		var localClassTypePath 	  : TypePath 	= { pack : localClass.pack, name : localClass.name };
		var localClassComplexType : ComplexType = TPath( localClassTypePath );
		
		var multiton = macro class Multiton
		{			
			private static var key : Int = -1;
			private static var instances : Array<$localClassComplexType> = [];
			
			public static function addInstanceById( ids : Array<Int> ) : Array<Int>
			{
				if( key < 0 ) key = zcale.core.patterns.MultitonKeys.assignKey();
				ids = ids.copy();
				ids[ key ] = instances.length;
				instances.push( new $localClassTypePath( ids ) );
				return ids;
			}
			
			public static function getInstanceById( ids : Array<Int> ) : $localClassComplexType
			{
				return instances[ ids[ key ] ];
			}
		}
					
		var outputFields = Context.getBuildFields();
		
		for( field in multiton.fields ){
			 outputFields.push( field );
		}
		for( field in outputFields ){
			 if( field.name == "new" ){
			 	 field.access.add( APrivate );
			 	 break;
			 }
		}				
		return outputFields;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////