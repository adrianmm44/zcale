package zcale.haxe.language.elements;

import haxe.ds.StringMap;
import zcale.haxe.language.Access;
import zcale.haxe.language.Types;

class Property
{
	public var name    : String;
	
	private var type   : String;
	private var value  : String;
	private var access : StringMap<Bool>;
	
	public function new( name : String,  ?type : String, ?value : String )
	{
		this.name   = name;
		this.type   = type;
		this.value  = value;
		this.access	= new StringMap();
	}
		
	public function isPrivate( bool : Bool = true ) : Property
	{
		access.set( "private", bool );
		return this;
	}
	
	public function toString() : String
	{
		return toPhp();
	}
	
	private function toPhp() : String
	{
		var str = "\n\t";
		
		if( access.exists( Access.PRIVATE ))
		{
			str += "protected ";
		}
		else{
			str += Access.PUBLIC + " ";
		}
		if( access.exists( Access.STATIC ))
		{
			str += Access.STATIC + " ";
		}
		str += "$" + name;
		
		if( value != null ){
			str += " = ";
			if( type == Types.STRING ){
				str += "'" + value + "'";
			}
			else{
				str += value;
			}
		}
		return str + ";";
	}
}