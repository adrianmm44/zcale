/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.macros.dom.node;

import haxe.macro.Context;
import haxe.macro.Expr;

class GlobalAttrsBuilder 
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	macro public static function build() : Array<Field>
	{
		var localClass = Context.getLocalClass().get();
		
		var cls = macro class GlobalAttrs
		{
			public var id( 	default, set ) : String;
			public var cls( default, set ) : String;
			
			private function set_id( v : String ) : String
			{
				attrs.id  = v;		
				return id = v;
			}
			
			private function set_cls( v : String ) : String
			{
				attrs.cls  = v;		
				return cls = v;
			}
		}
				
		var outputFields = Context.getBuildFields();
		
		if( localClass.isPrivate == false ){
			for( field in cls.fields ){
				 outputFields.push( field );
			}
		}
		return outputFields;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////