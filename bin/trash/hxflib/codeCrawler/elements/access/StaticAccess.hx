/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.codeCrawler.elements.access;

import hxflib.codeCrawler.interfaces.ICodeElement;
import hxflib.codeCrawler.elements.access.AccessElement;

class StaticElement extends AccessElement implements ICodeElement
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : Dynamic )
	{
		super( this, reg, "static" );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function newInstance() : ICodeElement
	{
		return new StaticElement( registry );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////