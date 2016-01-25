package zcale.view.html.node;

import zcale.patterns.Event;
import zcale.types.DynamicType;
import zcale.xml.node.Attribute;
import zcale.xml.node.ElderNode;

using zcale.view.html.node.HtmlAttrs;

class HtmlElder<T> extends ElderNode<T>
{
	public var id  : Attribute<T>;
	public var cls : DynamicType<T>;
	
	public function new( self : T, ?tagName : String, autoCloseTag : Bool = false )
	{
		super( self, tagName, autoCloseTag );
		
		id  = new Attribute( self, attrs, "id" );
		cls = new DynamicType( self );
		attrs.set( "class", null );
		listeners.addFront( Event.TO_STRING, onAttrsToString );
	}
	
	private function onAttrsToString( self : T ) : Void
	{
		if( cls.isset() ){			
			attrs.setClass( cls.value );
		}
	}
}

