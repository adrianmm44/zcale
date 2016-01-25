package zcale.build.project.fields;

@:forward( toString )

abstract Options<T>( ProjectOptions<T> ) {
	
	@:extern public var length( get, never ) : Int;
	
	@:extern public inline function new( project : T, prefix : String ) {
		
		this = new ProjectOptions( project, prefix );
	}
	
	@:extern public inline function add( option : String ) : T {
		
		return this.set( option );
	}
	
	@:extern public inline function iterator() : Iterator<String> {
		
		return this.optionsOrder.iterator();
	}
	
	@:extern private inline function get_length() : Int {
		
		return this.optionsOrder.length;
	}
}