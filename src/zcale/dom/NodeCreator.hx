/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.dom;

import zcale.dom.Nodes;
/*/
import hxf.core.dom.DomRegistry;
import hxf.core.dom.elements.*;
import hxf.core.dom.elements.table.Cell;
import hxf.core.dom.elements.table.Row;
import hxf.core.dom.elements.text.BoldText;
import hxf.core.dom.elements.text.ItalicText;
/*/
class NodeCreator 
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var ids : Array<Int>;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( ids : Array<Int> )
	{
		this.ids = ids;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function div( ?id : String ) : Div
	{ 
		var node = new Div( ids );
		node.id  = id;
		return node;
	}
	
	public function a( ?id : String ) : A
	{ 
		var node = new A( ids );
		node.id  = id;
		return node;
	}
	
	public function p( ?id : String ) : P
	{ 
		var node = new P( ids );
		node.id  = id;
		return node;
	}
	
	public function b( ?id : String ) : B
	{ 
		var node = new B( ids );
		node.id  = id;
		return node;
	}
	
	public function i( ?id : String ) : I
	{ 
		var node = new I( ids );
		node.id  = id;
		return node;
	}
	
	public function h( rank : Int, ?id : String ) : H
	{ 
		var node = new H( ids, rank );
		node.id  = id;
		return node;
	}
	
	public function img( ?id : String ) : Img
	{ 
		var node = new Img( ids );
		node.id  = id;
		return node;
	}
	
	/*/		
	public function boldText() : BoldText
	{	
		return new BoldText( registry );
	}
	
	public function italicText() : ItalicText
	{ 
		return new ItalicText( registry );
	}
	
	public function lineBreak() : LineBreak
	{	
		return new LineBreak( registry );
	}
	
	public function link() : Link
	{ 
		return new Link( registry );
	}
			
	public function script() : Script
	{ 
		return new Script( registry );
	}
	
	public function table() : Table
	{ 
		return new Table( registry );
	}
	
	public function tableCell() : Cell
	{ 
		return new Cell( registry );
	}
	
	public function tableRow() : Row
	{
		return new Row( registry );
	}
			
	public function meta() : Meta
	{ 
		return new Meta( ids );
	}
	/*/
	public function xmp( ?id : String ) : Xmp
	{ 
		var node = new Xmp( ids );
		node.id  = id;		
		return node;
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////