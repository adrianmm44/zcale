/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.dom.node;

import zcale.dom.css.Style;
import zcale.dom.global.DomData;
import zcale.dom.node.NodeAttrs;
import zcale.dom.node.Element;
import zcale.dom.node.Render;
import zcale.dom.node.interfaces.IChildNode;
import zcale.dom.node.interfaces.IElderNode;

class ChildNode<T:ChildNode<T>> implements IChildNode
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var ids    	  : Array<Int>;
	private var self   	  : T;
	
	public var parent  	  : IElderNode;
	public var element 	  : Element;
	public var name 	  : String;
	
	private var dom 	  : Dom;
	private var attrs  	  : NodeAttrs;
	private var styleAttr : Style;
	private var rendering : Render<T>;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( ids : Array<Int>, self : T, name : String )
	{
		this.ids       = ids;
		this.self      = self;
		this.name	   = name;
		this.dom  	   = DomData.getInstanceById( ids ).dom;		
		this.attrs 	   = new NodeAttrs();
		this.styleAttr = new Style();
		this.rendering = new Render( ids );
		
		registerToCss();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function registerToCss() : Void {} // to be overriden
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function render() : String
	{
		return rendering.renderChildNode( self );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////