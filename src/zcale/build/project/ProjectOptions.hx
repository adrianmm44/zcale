package zcale.build.project;

import haxe.ds.StringMap;
import zcale.types.ArrayType;

class ProjectOptions<T> {
	
	private var project 	: T;
	private var prefix 		: String;
	
	public var options 	 	: StringMap<String>;	
	public var optionsOrder : ArrayType<String>;
	
	public function new( project : T, prefix : String ) {
		
		this.project = project;
		this.prefix  = prefix;
		this.options = new StringMap();
		this.optionsOrder = [];
	}
	
	public function set( name : String, ?value : String ) : T {
		
		if( ! options.exists( name )) {
			optionsOrder.add( name );
		}
		options.set( name, value );
		return project;
	}
	
	public function toString() : String {
		
		var s : String = "";
		var v : String;
		for ( option in optionsOrder ) {
			s += "\n" + prefix + " " + option;
			v = options.get( option );
			if( v != null ) {
				s += "=" + v;
			}
		}
		return s;
	}
}