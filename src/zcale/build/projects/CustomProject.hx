package zcale.build.projects;

import zcale.events.Event;
import zcale.build.tools.BuildTools;
import zcale.build.project.PlatformProject;

using zcale.tools.CaseTools;
using zcale.tools.PathTools;
using zcale.types.helpers.StringHelper;

class CustomProject extends PlatformProject<CustomProject> {
	
	public function new( targetName	: String, classPath	: String, ?outputPath : String ) {
		
		super( targetName, classPath, outputPath );
		
		fileName.value = getFileName();
		useAnalyzer.value 	  = false;
		useMainFunction.value = false;
		listeners.add( Event.TO_STRING, setOptions );
	}
	
	private function getFileName() : String {
		
		var name   	: String = fileName.value;
		var endName : String = targetName.toUpperCaseFirst() + fileExtension;
		
		if( name.endsWith( endName )) {
			name = name.replace( endName, fileExtension );
		}
		return name.toSpinalCase();
	}
	
	private function setOptions( obj : CustomProject ) : Void {
		
		var filePath : String = outputPath + relativePath + "/"+ fileName;
		var dirPath  : String = outputPath + relativePath;
		
		macros.add( classPath + '.main("' + filePath.cleanPath() + '")' );
		
		if( createAssets ) {
			Builder.getInstance().macros.add( BuildTools.getMacroCall().createAssets( outputPath.cleanPath() ));
		}
		Builder.getInstance().directories.add( dirPath.cleanPath() );
	}
}