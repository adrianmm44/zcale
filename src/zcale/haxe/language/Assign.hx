package zcale.haxe.language;

import zcale.haxe.language.interfaces.IExpression;

class Assign implements IExpression
{
	public var variable : String;
	public var value 	: String;
	
	public function new( variable : String, value : String )
	{
		this.variable = variable;
		this.value	  = value;
	}
	
	public function toString() : String
	{
		return "\n\t\t" + variable + " = " + value;
	}
}