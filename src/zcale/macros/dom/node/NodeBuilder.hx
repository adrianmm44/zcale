/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.macros.dom.node;

import haxe.macro.Context;
import haxe.macro.Expr;

class NodeBuilder
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	macro public static function build() : Array<Field>
	{
		var cls = macro class Node
		{
			private var ids   : Array<Int>;
			private var dom   : Dom;
			private var self  : T;
			private var attrs : zcale.dom.node.NodeAttrs;
			
			public var parent : zcale.dom.node.interfaces.IElderNode;
			
			#if flash
				public var element : Dynamic;
			#elseif js
				public var element : js.html.Element;
			#elseif ( neko || php )
				public var element : Dynamic;
			#else
				#error "target unknown"
			#end
			
			public function new( ids : Array<Int>, self : T ) : Void
			{
				this.ids   = ids;
				this.dom   = zcale.dom.global.DomGlobalData.getInstanceById( ids ).dom;
				this.self  = self;
				this.attrs = new NodeAttrs();
			}
		}
		
		var outputFields = Context.getBuildFields();
		
		for( clsField in cls.fields ){
			switch( clsField ){
		    	case { name: "new", kind: FFun( clsField ) }:
					for( outField in outputFields ){
						switch( outField ){
					    	case { name: "new", kind: FFun( outField ) }:
								outField.expr = macro { ${ clsField.expr }; ${ outField.expr }; };
								break;
					    	default:
					    }
					}
		      	default:
				outputFields.push( clsField );
		    }
		}
		return outputFields;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////