package lgt.css;

import zcale.sys.io.File;
import zcale.view.css.C;

class LgtCss extends C
{
	private static inline var prefix : String = "lgt";
	
	public static inline var GRAY_DARK 	: String = "#333";
	public static inline var ORANGE 	: String = "#FF6B00";
	public static inline var BLUE 		: String = "#0099DA";	
	
	public static inline var ORANGE_BG 	: String = prefix + "-orange-bg";
	public static inline var BLUE_BG 	: String = prefix + "-blue-bg";
	
	public static function export( path : String ) : Void
	{
		File.saveContent( path, new LgtCss().toString() );
	}
	
	public function new()
	{
		super();
		this.add([
		
		C.cls( ORANGE_BG )
			.color("#FFF")
			.background.color( ORANGE ),
		
		C.cls( BLUE_BG )
			.color("#FFF")
			.background.color( BLUE ),
				
		]);
	}
}