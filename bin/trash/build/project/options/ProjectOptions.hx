package zcale.build.project.options;

import zcale.build.Builder;
import zcale.build.tools.BuildTools;
import zcale.build.project.options.OptionsArray;
import zcale.settings.MainSettings;
import zcale.settings.BuildSettings;
import zcale.types.StringType;
import zcale.types.zcale.tools.PathTools;

//using StringTools;
using zcale.tools.PathTools;

@:allow( zcale.build.project.interfaces )

class ProjectOptions<T>
{	
	private var className  	   : String;
	private var classPath  	   : String;
	private var outputPath 	   : String = BuildSettings.outputPath;
	
	public var fileName( 	 default, set ) : StringType<T>;
	public var relativePath( default, set ) : StringType<T>;
		
	public var codeElimination : Null<Bool> = null;
	public var useMainFunction : zcale.tools.PathTools<T>;
	public var createExterns   : zcale.tools.PathTools<T>;
	public var debug		   : zcale.tools.PathTools<T>;
	public var noOutput 	   : zcale.tools.PathTools<T>;
	public var compile 		   : zcale.tools.PathTools<T>;
	
	public var sources : OptionsArray;
	public var libs    : OptionsArray;
	public var flags   : OptionsArray;
	public var macros  : OptionsArray;
	public var excludedSources : Array<String>;
	
	private var targetOutputPath : String;
	private var targetExtension  : String;
	
	public function new( 
		self 	   : T, 
		classPath  : String, 
		outputPath : String, 
		extension  : String )
	{
		this.classPath = classPath;
		this.className = classPath.lastElement('.');
		
		//codeElimination 
		useMainFunction = new zcale.tools.PathTools( self, true  );
		createExterns   = new zcale.tools.PathTools( self, false );
		debug		    = new zcale.tools.PathTools( self, false );
		compile 		= new zcale.tools.PathTools( self, true  ); 
		noOutput 	    = new zcale.tools.PathTools( self, false );
		
		sources = new OptionsArray(["-cp" ]);
		libs 	= new OptionsArray(["-lib"]);
		flags	= new OptionsArray(["-D"  ]);
		macros	= new OptionsArray(["--macro"]);
		
		sources.add("src");
		libs.add( 	 BuildSettings.zcaleLibName );
		macros.add( 'exclude("' + BuildSettings.zcaleMacrosPath   + '")' );
		macros.add( 'exclude("' + BuildSettings.zcaleSettingsPath + '")' );
	}
	
	/*/
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
	/*/
	/*/
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
	/*/
	private function overwriteOptions( options : ProjectOptions ) : Void
	{
		sources   		= options.sources.copy();
		libs			= options.libs.copy();
		flags			= options.flags.copy();
		macros	  		= options.macros.copy();
		
		className 		= options.className;
		classPath 		= options.classPath;
		outputPath	  	= options.outputPath;
				
		useMainFunction = options.useMainFunction;
		codeElimination = options.codeElimination;
		createExterns   = options.createExterns;
		debug           = options.debug;
		noOutput		= options.noOutput;
		// compile 		= options.compile;
	}
	/*/
	private function getTitle( targetName : String ) : String
	{
		return "\n\n" + Builder.view.shortComment + " " + className + " >>> " + targetName;
	}
	
	private function getHeader( targetName : String ) : String
	{
		var str : String = getTitle( targetName );
		str += sources.toString();
		str += libs.toString();
		str += "\n";
		
		if( targetName != MainSettings.macroTargetName )
		{
			if( useMainFunction.value == true ){
				str += "-main ";
			}
			str += classPath;
		}
		return str;
	}
	
	private function getFooter() : String
	{
		var str = flags.toString();
		
		if( codeElimination ){
			str += "\n" + "-dce full";
		}
		else if( codeElimination )
		{
			str += "\n" + "-dce no";
		}
		
		if( debug.value == true ){
			str += "\n" + "-debug";
		}
		if( createExterns.value == true ){
			str += "\n" + "--gen-hx-classes";
		}
		if( noOutput.value == true ){
			str += "\n" + "--no-output";
		}
		str += macros.toString();	
		return str;
	}
}