package zcale.haxe.language.elements;

import haxe.ds.StringMap;
import zcale.haxe.language.Access;
import zcale.haxe.language.Types;
import zcale.haxe.language.interfaces.IExpression;

using zcale.macros.ArrayExtender;

class Method
{
	public var name 		 : String;
	public var arguments 	 : Array<Variable>;
	public var isConstructor : Bool = false;
		
	private var access 	  	 : StringMap<Bool>;
	
	private var variables 	 : Array<Variable>;
	private var expressions  : Array<IExpression>;	
	private var returnType   : String;
	private var returnValue  : String;
	
	public function new( name : String,  returnType : String = "Void" )
	{
		this.name 		 = name;
		this.returnType  = returnType;
		this.access		 = new StringMap();
		this.arguments	 = new Array();
		this.variables	 = new Array();
		this.expressions = new Array();
	}
	
	public function addArgument( v : Variable ) : Method
	{
		arguments.add( v );
		return this;
	}
	
	public function addExpr( expr : Dynamic ) : Method
	{
		if( Std.is( expr, Variable )){
			var v : Variable = cast( expr, Variable );
			variables.add( v );
		}	
		expressions.add( expr );
		return this;
	}
	
	public function isPrivate( bool : Bool = true ) : Method
	{
		access.set( "private", bool );		
		return this;
	}
	
	public function onReturn( value : String ) : Method
	{
		returnValue = value;
		return this;
	}
	
	public function toString() : String
	{
		return toPhp();
	}
	
	private function toPhp() : String
	{
		var str = '\n\n\t';
		
		if( access.exists( Access.PRIVATE ))
		{
			str += "protected ";
		}
		else if( ! isConstructor )
		{
			str += Access.PUBLIC + " ";
		}
		if( access.exists( Access.STATIC ))
		{
			str += Access.STATIC + " ";
		}
		str += "function ";
		
		if( isConstructor ){
			str += "__construct";
		}
		else{
			str += name;
		}
		str += "(";
		
		var args = "";
		for( argument in arguments )
		{
			args += ", $" + argument.name;
			
			if( argument.value != null ){
				args += " = " + argument.value;
			}
		}
		if( args.length > 0 ){
			str += args.substr( 1 ) + " ";
		}		
		str += ")";
		str += "\n\t" + "{";
		
		for( expr in expressions ){
			 str += expr.toString() + ";";
		}
		if( returnType != Types.VOID ){
			str += "\n\t\t" + "return " + returnValue + ";";
		}
		return str + "\n\t" + "}";
	}
}