/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.macros.dom.node;

import haxe.macro.Context;
import haxe.macro.Expr;

class StyledNodeBuilder
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	macro public static function build() : Array<Field>
	{
		var localClass = Context.getLocalClass().get();
				
		var cls = macro class StyledNode
		{
			public var style( get, set ) : zcale.dom.css.Style;
			
			private function get_style() : zcale.dom.css.Style
			{
				return styleAttr;
			}
			
			private function set_style( v : zcale.dom.css.Style ) : zcale.dom.css.Style
			{
				return styleAttr = v;
			}
			
			private override function registerToCss() : Void
			{
				dom.css.style( name );
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