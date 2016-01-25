package zcale.xml.node;

import zcale.types.ChainType;

class Attribute<T> extends ChainType<T,String> {
	
	private var name  : String;
		
	public function new( user : T, name : String ) {
		
		super( user );
		this.name = name;
	}
	
	private function toString() : String {
		
		return name + '="' + value + '"';
	}
}