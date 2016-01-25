package zcale;

using zcale.macros.ArrayExtender;
using zcale.macros.ArrayMacros;

extern class Modules
{	
	public static inline function getCore() : Array<String>
	{
		return ["zcale.Core","zcale.core"];
	}
		
	public static inline function getDom() : Array<String>
	{
		return ["zcale.Dom","zcale.dom"].pushArray( getCore() ).merge();
	}
}