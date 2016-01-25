package zcale.haxe.language.elements;

import haxe.ds.StringMap;
import zcale.PathTools;

using StringTools;
using zcale.macros.ArrayExtender;

class Cls
{
	public var pkg 		   : String;
	public var name 	   : String;
	public var constructor : Method;
	public var properties  : Array<Property>;
	public var methods 	   : Array<Method>;	
	
	public function new( classPath : String )
	{
		pkg  		= PathTools.removeLastElement( classPath, "." );
		name 		= PathTools.lastElement( classPath, "." );
		properties	= new Array();
		methods 	= new Array();
		constructor = new Method("new");
		constructor.isConstructor = true;
	}
	
	public function addProperty( property : Property ) : Cls
	{
		properties.add( property );
		return this;
	}
	
	public function addMethod( method : Method ) : Cls
	{
		methods.add( method );
		return this;
	}
	
	public function toString() : String
	{
		return toPhp();
	}
	
	private function toPhp() : String
	{
		var str = "<?php";
		str += "\n\n" + "namespace " + pkg.replace( ".", "\\" ) + ";";
		str += "\n\n" + "class " + name;
		str += "\n" + "{";
		
		for( property in properties ){
			 str += property.toString();
		}
		str += constructor.toString();
		
		for( method in methods ){
			 str += method.toString();
		}
		str += "\n" + "}";
		return str;
	}
}