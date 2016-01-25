package zcale.build.projects;

import zcale.build.Builder;
import zcale.build.tools.BuildTools;
import zcale.build.project.PlatformProject;
import zcale.events.Event;
import zcale.settings.BuildSettings;

class FlashProject extends PlatformProject<FlashProject>
{	
	public var flashVersion : String = BuildSettings.flashVersion;
	
	public function new( classPath : String, ?outputPath )
	{
		super("flash", classPath, outputPath );
		fileExtension = ".swf";
		listeners.add( Event.TO_STRING, setOptions );
	}
	
	private function setOptions( obj : FlashProject ) : Void
	{
		flags.add("-swf " + outputPath + relativePath + "/" + fileName );
		flags.add("-swf-version " + flashVersion );
		
		if( excludedSources.length > 0 ) {
			macros.add( BuildTools.getMacroCall().excludeSources( excludedSources ));
		}
		if( createIndex.value == true ) {
			macros.add( BuildTools.getMacroCall().createFlashIndex( outputPath, relativePath + '/' + fileName ));
		}
		if( createAssets.value == true ) {
			Builder.getInstance().macros.add( BuildTools.getMacroCall().createAssets( outputPath ));
		}
		Builder.getInstance().directories.add( "" + outputPath + relativePath );
	}
}