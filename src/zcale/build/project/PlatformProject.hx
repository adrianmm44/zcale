package zcale.build.project;

import zcale.events.Event;
import zcale.events.EventListeners;
import zcale.settings.BuildSettings;
import zcale.types.chains.ArrayChain;
import zcale.types.chains.BoolChain;
import zcale.types.chains.StringChain;
import zcale.build.project.fields.Browsers;
import zcale.build.project.fields.DeadCodeElimination;

using zcale.tools.PathTools;
using zcale.types.helpers.StringHelper;

class PlatformProject<T:PlatformProject<T>> extends ProjectBase<T> {
	
	public var fileName 	   : StringChain<T>;
	public var outputPath 	   : StringChain<T>;
	public var relativePath    : StringChain<T>;
	
	public var browsers 	   : Browsers<T>;
	public var createIndex     : BoolChain<T>;
	public var createAssets    : BoolChain<T>;
	//public var createExterns   : BoolChain<T>;
	public var noOutput 	   : BoolChain<T>;
	public var debug		   : BoolChain<T>;
	public var useAnalyzer	   : BoolChain<T>;
	public var dce 			   : DeadCodeElimination<T>;	
	public var excludedSources : ArrayChain<T,String>;
	
	private var fileExtension  : String;
	//private var targetOutputPath : String;
	
	public function new( targetName : String, classPath : String, outputPath : String ) {
		
		super( targetName, classPath );
		
		fileName = new StringChain( self, className );
		
		if( outputPath != null ) {
			this.outputPath = new StringChain( self, outputPath );
		}
		else {
			this.outputPath = new StringChain( self, BuildSettings.outputPath );
		}
		relativePath 	= new StringChain( self, "" ); // "/" + classPath.replace(".","/").removeLastElement();
		
		browsers 		= new Browsers(  self );
		createIndex  	= new BoolChain( self, false );
		createAssets 	= new BoolChain( self, false );
		//createExterns   = new BoolChain( self, false );
		noOutput 	    = new BoolChain( self, false );
		debug		    = new BoolChain( self, false );
		useAnalyzer		= new BoolChain( self, true  );
		dce				= new DeadCodeElimination( self );
		
		excludedSources = new ArrayChain(  self );
		fileExtension   = "." + targetName;
		
		listeners.add( Event.TO_STRING, setPlatfromOptions );
	}
	
	private function setPlatfromOptions( self : T ) : Void {
		
		if( fileName.value.endsWith( fileExtension ) == false ) {
			fileName.value += fileExtension;
		}
		/*/
		if( createExterns ) {
			flags.add("--gen-hx-classes");
		}
		/*/
		if( noOutput ) {
			flags.add("--no-output");
		}
		if( debug ) {
			flags.add("-debug");
		}
		if( dce.isset() ) {
			flags.add( dce.value );
		}		
		if( useAnalyzer ) {
			vars.set("analyzer");
		}
		browsers.setVersions();		
		/*/
		if( relativePath.value.startsWith( targetOutputPath ) == false ){
			relativePath.value = targetOutputPath + relativePath;
		}
		/*/
	}
}