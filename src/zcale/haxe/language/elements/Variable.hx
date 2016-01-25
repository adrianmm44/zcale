package zcale.haxe.language.elements;

import zcale.haxe.language.Types;
import zcale.haxe.language.interfaces.IExpression;

class Variable implements IExpression
{
	public var name  : String;
	public var type  : String = Types.DYNAMIC;
	public var value : String;
	
	public function new( name : String, ?type : String, ?value : String )
	{
		this.name  = name;
		this.type  = type;
		this.value = value;
	}
	
	public function toString() : String
	{
		return toPhp();
	}
	
	private function toPhp() : String
	{
		var str = "\n\t\t" + "$" + name + " = ";
		
		if( type == Types.STRING )
		{
			str += "'" + value + "'";
		}
		return str;
	}
}