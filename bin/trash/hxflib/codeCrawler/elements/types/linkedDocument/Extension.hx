/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.codeCrawler.elements.types.linkedDocument;

import hxflib.codeCrawler.interfaces.ICodeElement;
import hxflib.codeCrawler.elements.types.linkedDocument.LinkedDocumentBase;

class Extension extends LinkedDocumentBase implements ICodeElement
{	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : Dynamic )
	{
		super( this, reg, "extends" );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function newInstance() : ICodeElement
	{
		return new Extension( registry );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////