package zcale.tests;

import zcale.Core;
import zcale.Path;
import zcale.PathTools;

class PathTest
{	
	// relative path test: ?run=js&/#!/dir1/dir2/dir3/?var1=value1&var2=value2&vsr3=value3
	
	public static function main()
	{
		Core.boot( PathTest, function()
		{
			var str = '';					
			str += '\n Path.DIR: ' 			 + Path.DIR;
			str += '\n Path.URL:      '		 + Path.URL;
			str += '\n Path.ROOT_URL:  '	 + Path.ROOT_URL;			
			str += '\n Path.ROOT_DIR: ' 	 + Path.ROOT_DIR;
			str += '\n Path.FILE_DIR: ' 	 + Path.FILE_DIR;
			str += '\n Path.RELATIVE: '  + Path.RELATIVE;			
			str += '\n Path.PARAMS_STRING: ' + Path.PARAMS_STRING;
			str += '\n PathTools.paramsToString( Path.PARAMS ): ' + PathTools.paramsToString( Path.PARAMS );
						
			Core.trace( str );
		});
	}
}