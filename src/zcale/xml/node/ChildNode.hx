package zcale.xml.node;

import zcale.Indenting;
import zcale.types.chains.StringChain;
import zcale.xml.node.ElderNodeType;

class ChildNode<T> {
	
	public var parent 		 : ElderNodeType;
		
	private var self 		 : T;
	private var content 	 : StringChain<T>;
	private var indenting	 : Indenting;
	private var useIndenting : Bool = true;	
	
	public function new( ?content : String ) {
	
		this.self 	   = cast this;
		this.content   = new StringChain( self, content );
		this.indenting = new Indenting();		
	}
	
	private function getIndenting() : String {
						
		return ( useIndenting ) ? "\n" + indenting.toString() : "";
	}
				
	public function toString() : String {
		
		return ( content.value != null ) ? getIndenting() + content.value : "";
	}
}
