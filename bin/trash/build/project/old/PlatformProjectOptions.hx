package zcale.build.project.options;

import zcale.build.project.options.ProjectOptions;

using StringTools;
using zcale.tools.PathTools;

class PlatformProjectOptions<T> extends ProjectOptions<T>
{
	public var fileName( 	 default, set ) : String;
	public var relativePath( default, set ) : String;
	public var excludedSources 	 : Array<String>;
	public var isMainModule    	 : Bool = false;
	public var isModule 	   	 : Bool = false;
	
	private var targetOutputPath : String;
	private var targetExtension  : String;
	
	public function new( classPath 		  : String,
						 outputPath 	  : String = "",
						 targetOutputPath : String = "",
						 targetExtension  : String = "" )
	{
		super( classPath );
		
		this.outputPath		  = outputPath;
		this.targetOutputPath = targetOutputPath;
		this.targetExtension  = targetExtension;
		
		fileName  = className;
		relativePath = "/" + classPath.replace(".","/").removeLastElement();
		excludedSources = new Array();
	}
	
	private function set_fileName( name : String ) : String
	{
		if( name.endsWith( targetExtension ) == false ){
			name += targetExtension;
		}
		return fileName = name;
	}
		
	private function set_relativePath( path : String ) : String
	{
		if( path.startsWith( targetOutputPath ) == false ){
			path = targetOutputPath + path;
		}		
		return relativePath = path;
	}
	/*/
	public function overwrite( options : PlatformProjectOptions ) : Void
	{
		overwriteOptions( options );
		
		fileName 		= options.fileName;
		excludedSources = options.excludedSources;
		isMainModule 	= options.isMainModule;
		isModule 		= options.isModule;		
		// relativePath gets not overridden because it differs on each platform
	}
	/*/
}