package zcale.build.projects;

import zcale.build.Builder;
import zcale.build.tools.BuildTools;
import zcale.build.project.PlatformProject;
import zcale.events.Event;
import zcale.types.chains.BoolChain;
import zcale.types.chains.StringChain;

class PhpProject extends PlatformProject<PhpProject>
{	
	public var libName 		  : StringChain<PhpProject>;
	public var createHtAccess : BoolChain<PhpProject>;
	
	public function new( classPath : String, ?outputPath : String )
	{
		super("php", classPath, outputPath );
		
		libName			  = new StringChain( this );
		createHtAccess 	  = new BoolChain( this, false );
		createIndex.value = true;
		listeners.add( Event.TO_STRING, setOptions );
	}
	
	private function setOptions( obj : PhpProject ) : Void
	{
		flags.add("-php " + outputPath + relativePath );
		
		if( libName.isset() ){
			flags.add("--php-lib " + libName );
		}
		if( createIndex.isFalse() ){
			flags.add("--php-front " + fileName );
		}		
		if( createAssets ){
			Builder.getInstance().macros.add( BuildTools.getMacroCall().createAssets( outputPath ));
		}
		if( createHtAccess ){
			macros.add( BuildTools.getMacroCall().createHtAccess( outputPath ));
		}
		Builder.getInstance().directories.add( "" + outputPath + relativePath );
	}
}