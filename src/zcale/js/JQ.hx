package zcale.js;

import js.JQuery;

@:forward
//@:native("$")
abstract JQ( JQuery ) 
{
	@:extern
	public inline function new( v : Dynamic )
	{
		this = new JQuery( v );
	}
	/*/
	public static function ajax( args : { url 	   : String, 
										  type 	   : String, 
										  ?data    : Dynamic, 
										  ?success : Dynamic -> Void, 
										  ?error   : Dynamic -> Void, 
										  ?async   : Bool } ) : Void; /*/
}