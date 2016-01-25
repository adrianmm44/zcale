package zcale.views;

import zcale.view.css.C;
import zcale.view.css.Style;

class ZcaleStyles {
	
	@:extern public static inline var SHINY_BOX 		: String = "shiny-box";
		
	public static function shinyBox() : Style {
		
		return C.cls( SHINY_BOX )
			.color.lib.white()
			.background.color.set("#111")
			.background.set("linear-gradient( 180deg, rgba( 8, 8, 8, 0.8 ) 50%, rgba( 0, 0, 0, 0.8 ) 51% )")
			.border.set("1px solid #000000");
	}
}