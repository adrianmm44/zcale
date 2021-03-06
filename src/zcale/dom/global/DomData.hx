/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.dom.global;

import zcale.Dom;
import zcale.dom.global.NodeStatus;
import zcale.core.patterns.IMultiton;
//import zcale.dom.Css;
//import zcale.dom.data.HtmlLayout;
//import zcale.dom.node.content.interfaces.IContent;

class DomData implements IMultiton
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var dom : Dom;
	//public var css 		  : Css;
	//public var ids 		  : Map<String,IContent>;
	//public var classes 	  : Map<String,IContent>;
	//public var htmlLayout : HtmlLayout;
	
	public var currentNode  : NodeStatus;
	public var useIndenting : Bool = true;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function new( ids : Array<Int> )
	{
		currentNode = new NodeStatus();
		//css		   = new Css();
		//ids 	   = new Map();
		//classes    = new Map();
		//htmlLayout = new HtmlLayout();
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////