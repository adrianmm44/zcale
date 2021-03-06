/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.dom.node.interfaces;

import zcale.dom.node.interfaces.IChildNode;

interface IElderNode extends IChildNode
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var children : Array<IChildNode>;
	
	public function addChild( child : IChildNode ) : Void;
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////