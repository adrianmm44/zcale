package zcale.build.project.fields;

@:forward( toString )

abstract Variables<T>( ProjectOptions<T> ) {
	
	@:extern public var length( get, never ) : Int;
	
	@:extern public inline function new( project : T) {
		
		this = new ProjectOptions( project, "-D" );
	}
	
	@:extern public inline function set( name : String, ?value : String ) : T {
		
		return this.set( name, value );
	}
	
	@:extern public inline function iterator() : Iterator<String> {
		
		return this.options.iterator();
	}
	
	@:extern private inline function get_length() : Int {
		
		return this.optionsOrder.length;
	}
}