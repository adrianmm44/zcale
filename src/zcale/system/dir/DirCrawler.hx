package zcale.system.dir;

import sys.FileSystem;
import zcale.system.dir.DirElement;

using zcale.tools.PathTools;

class DirCrawler
{	
	private var sourcePath 		: String;
	private var dirElements 	: Array<DirElement>;
	private var showHiddenFiles : Bool;
		
	public function new( path : String, showHidden : Bool = false )
	{
		sourcePath 		= path;
		dirElements 	= new Array();
		showHiddenFiles = showHidden;
		
		crawlDir( path );
	}
		
	public static function crawl( path : String, showHidden : Bool = false ) : Iterator<DirElement>
	{
		return new DirCrawler( path, showHidden ).iterator();
	}
		
	private function crawlDir( path : String ) : Void
	{
		var element = new DirElement();
		
		if( FileSystem.isDirectory( path ))
		{
			element.isDir  = true;
			element.isFile = false;
			element.path   = path; // path.directory();
			element.name   = element.path.lastElement();
			element.relativePath = element.path.substr( sourcePath.length );
			
			dirElements.push( element );
			
			for( dirElement in FileSystem.readDirectory( element.path ) )
			{
				 crawlDir( element.path + '/' + dirElement );
			}
		}
		else {
			element.isFile = true;
			element.isDir  = false;
			element.path   = path;
			element.name   = path.lastElement();
			element.relativePath = element.path.substr( sourcePath.length );
			
			if( element.name.substr( 0, 1 ) != "." || 
			  ( element.name.substr( 0, 1 ) == "." && showHiddenFiles == true )  )
			{
				dirElements.push( element );
			}
		}
	}
		
	public function iterator() : Iterator<DirElement>
	{
		return dirElements.iterator();
	}
		
	/*/
	public var directory( null, set ) : String;
	public var levelDepth 	   : Int  = 0;	
	public var showHiddenFiles : Bool = false;
	
	private var dirList 	   : List<Array<String>>;	
	private var sourcePath     : String;
	private var currentName    : String;
	private var currentPath    : String;	
	private var currentType    : String;
	private var currentLevel   : Int;
	
	// private var levelBoundary  : Int = 1;
		
	public function new( path : String )
	{
		set_directory( path );
	}
		
	private function set_directory( path : String ) : String
	{
		sourcePath	 = PathTools.cleanPath( path );
		currentPath  = sourcePath;
		currentLevel = 0;
		
		dirList = new List();
		dirList.push( FileSystem.readDirectory( path ) );
		
		return path;
	}
		
	public function hasNext() : Bool
	{	
		removeEmptyDirs();
				
		if( dirList.isEmpty() == false && dirList.first().length > 0 ) 			  	   // checks if the current directory has an available element
		{
			currentName = dirList.first().shift(); 								  	   // selects the first element of current directory
						
			if( FileSystem.isDirectory( currentPath + currentName ) == true ) 		   // checks if the current element is a directory
			{
				dirList.push( FileSystem.readDirectory( currentPath + currentName ) ); // adds the content of the directory to the list
				
				currentPath += currentName + "/";
				currentType  = "dir";
				currentLevel++;				
				// trace( currentPath + ' - folder <br/>');
			}
			else
			{
				currentType = "file";
				// trace( currentPath + currentName + ' - file <br/>');
			}
			
			return true;  // has found an available element
		}
		else {
			return false; // no available elements found
		}
	}
		
	public function next() : DirElement
	{
		var dirElement 	 	  = new DirElement();
		dirElement.name  	  = currentName;
		dirElement.path  	  = currentPath;
		dirElement.levelDepth = currentLevel;
		
		if( currentType == "file")
		{
			dirElement.path  += dirElement.name;
			dirElement.isDir  = false;
			dirElement.isFile = true;
		}
		else {
			dirElement.isDir  = true;
			dirElement.isFile = false;
		}
		
		dirElement.relativePath = dirElement.path.substr( sourcePath.length );
			
		return dirElement;
	}
	
	private function removeEmptyDirs() : Void
	{		
		while( isEmptyDir() == true || isRestrictedDir() == true )		   // this loop removes empty directories
		{
			dirList.pop(); 												   // removes current directory in list
			
			currentPath = PathTools.popDirectory( currentPath );		   // removes current directory in path
			currentLevel--;
		}
		
		if( dirList.isEmpty() == false && showHiddenFiles == false ) 	   // checks if there are elements available
		{
			removeHiddenElements(); 									   // removes hidden elements
		}
	}
		
	private function removeHiddenElements() : Void
	{
		var dirElements : Array<String> = dirList.first(); // selects the elements of current directory
		
		while( dirElements[ 0 ].substr( 0, 1 ) == "." )    // this loop removes hidden elements
		{
			dirElements.shift(); 	  					   // removes current hidden element
		}

		if( dirElements.length == 0 ) 					   // checks if the current directory is empty after removing hidden elements
		{
			removeEmptyDirs(); 					   		   // removes empty directories
		}
	}
		
	private function isEmptyDir() : Bool
	{
		// checks if the current directory is empty
		
		if( dirList.isEmpty() == false && dirList.first().length == 0 )
		{ 
			return true; 
		} 
		else { 
			return false; 
		}
	}
		
	private function isRestrictedDir() : Bool
	{
		// checks if the iterator is allowed to access the current directory
		
		var restricted : Bool = false;
		
		if( currentLevel >= levelDepth && levelDepth > 0 )
		{ 
			restricted = true; 
		}
				
		return restricted;
	}
	/*/
}