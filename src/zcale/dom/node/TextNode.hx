/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.dom.node;

class TextNode extends ElderNode<TextNode>
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var text : String;
	public var useIndenting( default, set ) : Bool;
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( ids : Array<Int>, text : String = "" )
	{
		super( ids, this, null );		
		this.text = text;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function set_useIndenting( v : Bool ) : Bool
	{
		rendering.useIndenting = v;
		return useIndenting = v;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public override function render() : String
	{
		return rendering.renderText( this );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////