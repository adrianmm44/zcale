/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale;

import zcale.dom.Css;
import zcale.dom.Nodes;
import zcale.dom.NodeCreator;
import zcale.dom.global.DomData;
import zcale.core.boot.ITracer;

@:keep
@:expose

class Dom implements ITracer
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var ids : Array<Int>;
	
	public var data : DomData;
	public var doc  : Document;	
	public var css	: Css;
	public var title( get, set  ) : String;	
	public var head(  get, null ) : Head;	
	public var body(  get, null ) : Body;	
	public var create : NodeCreator;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( ids : Array<Int> )
	{
		ids  = DomData.addInstanceById( ids );
		data = DomData.getInstanceById( ids );
		data.dom = this;
		
		css = new Css( ids );
		doc = new Document( ids );
		create = new NodeCreator( ids );
		this.ids = ids;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function get_title() : String
	{
		return doc.head.title;
	}
	
	private function set_title( v : String ) : String
	{
		return doc.head.title = v;
	}
		
	private function get_head() : Head
	{
		return doc.head;
	}
	
	private function get_body() : Body
	{
		return doc.body;
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function render() : Void
	{
		#if ( neko || php )
			Sys.print( doc.render() );
		#else
			doc.render();
		#end
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function trace( str : Dynamic ) : Void
	{
		doc.tracer.text.add( "\n" + Std.string( str ) );
	}
				
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////