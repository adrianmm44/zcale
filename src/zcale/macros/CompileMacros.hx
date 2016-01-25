package zcale.macros;

import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Compiler;
import zcale.tools.CaseTools;

using StringTools;

class CompileMacros
{	
	public static function excludeSources( sources : Array<String> ) : Void
	{
		for( source in sources ){
			 Compiler.exclude( source );
		}
	}
	
	public static function exposeToWindow( sources : Array<String> ) : Void
	{
		Context.onGenerate( function( types : Array<haxe.macro.Type> )
		{
			for( source in sources )
			{
				if( CaseTools.isUpperCase( source.lastElement(".").firstChar() ) == true ) // source is class
				{
					var type = Context.getType( source );
					
					switch( type )
					{
						case TInst( cls, params ):
							if( cls.get().meta.has(":expose") == true ){
								cls.get().meta.add(":native", [ macro $v{ "window." + cls.toString() } ], Context.currentPos() );
								cls.get().meta.remove(":expose");
							}
						default: // no action
					}
				}
				else // source is package
				{
					for( type in types )
					{
						switch( type )
						{
							case TInst( cls, params ):
								if( cls.toString().startsWith( source ) == true &&
								 	cls.get().meta.has(":expose") == true ){
									cls.get().meta.add(":native", [ macro $v{ "window." + cls.toString() } ], Context.currentPos() );
									cls.get().meta.remove(":expose");
								}
							default: // no action
						}
					}
				}
			}
		});
	}
}