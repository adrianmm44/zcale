package zcale.tests;

import zcale.PathTools;

class PathToolsTest 
{
	public static function main()
	{		
		Sys.print( getTestResults() );
	}
		
	public static function getTestResults() : String
	{
		var values = new Array<String>();
		values.push('Filename.hx');
		values.push('dir1/dir2/dir3/Filename.hx');
		values.push('dir1/dir2/dir3/');
		values.push('/dir1/dir2/dir3');
		values.push('dir1.dir2.dir3');
		values.push('dir1/');
		values.push('/dir1');
		values.push('/');
		values.push('');
		
		var str = '';
		
		str += "\n" + 'PathTools.cleanPath("/dir1//dir2////dir3") = ' + PathTools.cleanPath('/dir1//dir2////dir3');
		str += "\n" + 'PathTools.removeFirstDelimiter("/dir/") = '    + PathTools.removeFrontDelimiter('/dir/');		
		str += "\n" + 'PathTools.removeLastDelimiter("/dir/") = '  	  + PathTools.removeEndDelimiter('/dir/');		
		str += "\n" + 'PathTools.joinPath("' + '[ "dir1", "dir2", "dir3" ]' + '") = ' + PathTools.joinPath([ 'dir1', 'dir2', 'dir3' ]);
		
		for( value in values ){
			 str += "\n" + 'PathTools.lastElement("' + value + '") = ' + PathTools.lastElement( value );
		}
		for( value in values ){
			 str += "\n" + 'PathTools.splitPath("' + value + '") = ' + PathTools.splitPath( value );
		}
		for( value in values ){
			 str += "\n" + 'PathTools.firstElement("' + value + '") = ' + PathTools.firstElement( value );
		}	
		for( value in values ){
			 str += "\n" + 'PathTools.lastElement("' + value + '") = ' + PathTools.lastElement( value );
		}
		for( value in values ){
			 str += "\n" + 'PathTools.removeFirstElement("' + value + '") = ' + PathTools.removeFirstElement( value );
		}
		for( value in values ){
			 str += "\n" + 'PathTools.removeLastElement("' + value + '") = ' + PathTools.removeLastElement( value );
		}
		/*/
		for( value in values ){
			 str += "\n" + 'PathTools.seekParentDirectory("' + value + '","dir1/") = ' + PathTools.seekParentDirectory( value, "dir1/" );
		}
		/*/		
		for( value in values ){
			 str += "\n" + 'PathTools.removeExtension("' + value + '") = ' + PathTools.removeExtension( value );
		}					
		/*/
		results += 'TextTools.toLowerCaseFirst("Hello") = ' + TextTools.toLowerCaseFirst("hello") + "\n";
		results += 'TextTools.toUpperCaseFirst("hello") = ' + TextTools.toUpperCaseFirst("Hello") + "\n";
		results += 'TextTools.toCamelCase() dir1.dir2.dir3.ClassName = ' + TextTools.toCamelCase("dir1.dir2.dir3.ClassName", "." ) + "\n";
		results += "TextTools.unWrap() <title>Hello World</title> = " + TextTools.unWrap("<title>Hello World</title>", "<title>", "</title>") + "\n";
		/*/		
		return str;
	}
}