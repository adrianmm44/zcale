/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.macros.files;

import haxe.macro.Context;
import haxe.macro.Expr;
import zcale.core.Path;
import zcale.macros.Regex;
import zcale.system.dir.DirCrawler;

class FileNamesBuilder
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	macro public static function build( relativePath : String ) : Array<Field>
    {
        var outputFields : Array<Field> = Context.getBuildFields();

		for( element in DirCrawler.crawl( Path.rootPath + relativePath ) )
        {
        	if( element.isFile == true )
			{
        		outputFields.push({
					name   : Regex.replace( element.relativePath, "_", 
							 Regex.pattern.range("^a-zA-Z_").toString(), 
							 Regex.options.globalReach.toString() ),
	                doc    : 'Reference to file on disk "' + element.relativePath + '". (auto generated)',
	                access : [ Access.APublic, Access.AStatic, Access.AInline ],
	                kind   : FieldType.FVar( macro : String, macro $v{ element.relativePath }),
	                pos	   : Context.currentPos()
				});
        	}
        }
        return outputFields;
    }
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////