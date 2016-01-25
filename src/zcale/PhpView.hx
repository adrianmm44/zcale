package zcale;

import zcale.sys.io.File;
import zcale.haxe.language.Types;
import zcale.haxe.language.Assign;
import zcale.haxe.language.elements.Cls;
import zcale.haxe.language.elements.Variable;
import zcale.haxe.language.elements.Property;
import zcale.haxe.language.elements.Method;

import zcale.settings.BuildSettings;

using StringTools;
using zcale.PathTools;
using zcale.macros.StringExtender;

class PhpView
{
	public static function export( classPath : String, content : String )
	{
		var cls = new Cls( classPath );
		
		while( content.contains("{$"))
		{
			var startIndex : Int  = content.indexOf("{$");
			var endIndex   : Int  = content.indexOf("}", startIndex );
			
			var strFront : String = content.substr( 0, startIndex );
			var varName  : String = content.substr( startIndex + 2, endIndex - startIndex - 2 );
			var strEnd   : String = content.substr( endIndex + 1 );
			
			cls.addProperty( new Property(  varName, Types.STRING, "" ));			
			cls.constructor
				.addArgument( new Variable( varName, Types.STRING ))
				.addExpr( new Assign( "$this->" + varName, "$" + varName ));
			
			content = strFront + "' . $this->" + varName + " . '" + strEnd;
		}
				
		cls.addMethod(
			new Method( "toString", Types.STRING )
				.addExpr( new Variable("str", Types.STRING, content ))
				.onReturn("$str")
		);
			
		var filePath : String = BuildSettings.webOutputPath + "/lib/" + classPath.replace(".","/") + ".php";
		
		File.saveContent( filePath, cls.toString() );
	}
}