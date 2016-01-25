package zcale.build.projects;

import zcale.build.Builder;
import zcale.build.tools.BuildTools;
import zcale.build.project.PlatformProject;
import zcale.events.Event;
import zcale.types.chains.BoolChain;

class JsProject extends PlatformProject<JsProject>
{	
	public var embedJS 	 : BoolChain<JsProject>; // if true allows inclusion of JQuery and/or swfobject
	public var useJQuery : BoolChain<JsProject>; // determines if jquery is used inside the project or not
		
	public function new( classPath : String, ?outputPath : String )
	{
		super("js", classPath, outputPath );
			
		embedJS   = new BoolChain( this, true );
		useJQuery = new BoolChain( this, true );
				
		listeners.add( Event.TO_STRING, setOptions );
	}
	
	private function setOptions( obj : JsProject ) : Void
	{
		flags.add("-js " + outputPath + relativePath + "/" + fileName );
		
		if( embedJS.isFalse() ) {
			vars.set("noEmbedJS");
		}		
		if( useJQuery.isTrue() ) {
			targetName = "jquery";
			vars.set("jquery");
		}
		if( excludedSources.length > 0 ) {
			macros.add( BuildTools.getMacroCall().excludeSources( excludedSources ));
			macros.add( BuildTools.getMacroCall().exposeToWindow( excludedSources ));
		}
		if( createIndex.isTrue() ) {
			macros.add( BuildTools.getMacroCall().createJsIndex( outputPath, relativePath + "/" + fileName ) );
		}
		if( createAssets.isTrue() ) {
			Builder.getInstance().macros.add( BuildTools.getMacroCall().createAssets( outputPath ));
		}
		Builder.getInstance().directories.add( "" + outputPath + relativePath );
	}
}