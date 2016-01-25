package zcale.system;

import sys.FileSystem;
import zcale.types.ArrayType;

using zcale.tools.PathTools;

class SystemTools {
			
	public static function createPath( path : String ) : Void {
		
		var directories : ArrayType<String> = []; 		 // holds all directories that not yet exist

		while ( ! FileSystem.exists( path )) {		  	 // checks if the current directory exists
			
			directories.addFront( path.lastElement() );  // adds the last directory to directories
			path = path.removeLastElement(); 			 // removes the last directory from path
		}
		for ( directory in directories ) { 				 // loops through all directories that not yet exist		
			
			path += "/" + directory;					 // adds the current directory
			FileSystem.createDirectory( path ); 		 // creates the current directory
		}
	}
	/*
	public static function seekParentFile( path : String, fileName : String ) : String
	{
		while( path.length > 0 && FileSystem.exists( path + fileName ) == false )
		{
			path = path.removeLastElement();
		}
		if( path.length > 0 ){
			path += "/" + fileName;
		}		
		return path;
	}
	*/
}