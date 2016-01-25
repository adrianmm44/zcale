package zcale.build.project.options;

using Lambda;
using zcale.macros.ArrayExtender;

abstract OptionsArray( Array<String> ) // from Array<String> to Array<String>
{	
	public var length( get, never ) : Int;
	
	public inline function new( array : Array<String> )
	{
		if( array.length > 0 ){
			this = array;
		}
		else {
			throw "prefix is not declared";
		}
	}
	
	private function get_length() : Int
	{
		return this.length - 1;
	}
	
	public function iterator() : Iterator<String>
	{
		var elements : Iterator<String> = this.iterator();
		elements.next();		
		return elements;
	}
	
	public function add( item : String ) : Void
	{
		if( this.has(  item ) == false ){
			this.push( item );
		}
	}
	
	public function remove( item : String ) : Bool
	{
		if( item == this.first() ){
			return false;
		}
		else {
			return this.remove( item );
		}
	}
	
	public inline function copy() : OptionsArray
	{
		return new OptionsArray( this.copy() );
	}
	
	public function toString() : String
	{
		var str = "";					
		for( key in 1...this.length ){
			 str += "\n" + this[ 0 ] + " " + this[ key ];
		}
		return str;
	}
}