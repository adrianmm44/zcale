/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.macros.dom.node;

import haxe.macro.Context;
import haxe.macro.Expr;

class TextNodeBuilder
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	macro public static function build() : Array<Field>
	{
		var localClass = Context.getLocalClass().get();
				
		var cls = macro class TextNode
		{
			public var text( get, null ) : zcale.dom.node.TextHatch;
			
			private function get_text()  : zcale.dom.node.TextHatch
			{
				return textHatch;
			}
		}
		
		var outputFields = Context.getBuildFields();
		
		if( localClass.isInterface == false ){
			for( field in cls.fields ){
				 outputFields.push( field );
			}
		}
		return outputFields;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////