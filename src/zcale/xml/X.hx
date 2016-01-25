package zcale.xml;

import zcale.xml.nodes.Document;
import zcale.xml.nodes.Element;
import zcale.xml.nodes.PCData;
import zcale.xml.nodes.CData;
import zcale.xml.nodes.Comment;

class X {
	
	@:extern public static inline function doc( name : String ) : Document {
		
		return new Document( name );
	}
	
	@:extern public static inline function node( name : String ) : Element {
		
		return new Element( name );
	}
	
	@:extern public static inline function pcdata( ?str : String ) : PCData {
		
		return new PCData( str );
	}
	
	@:extern public static inline function cdata( ?str : String ) : CData {
		
		return new CData( str );
	}
	
	@:extern public static inline function comment( ?str  : String ) : Comment {
		
		return new Comment( str );
	}
}