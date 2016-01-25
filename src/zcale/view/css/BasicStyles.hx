package zcale.view.css;

import zcale.view.css.C;
import zcale.view.css.Style;

class BasicStyles {
	
	@:extern public static inline var BG_IMAGE_COVER : String = "bg-image-cover";
		
	public static function bgImageCover( url : String ) : Style {
		
		return C.lib.body()
			//C.cls( BG_IMAGE_COVER )			
			//.width.set("100%")
			//.height.set("100%")
			//.position.fixed()
			.background.url( url, "no-repeat center center fixed")
			.background.size.cover()
			//.get("-ms-filter").set("\"progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + url + "', sizingMethod='scale')\"")
			//.get("filter").set("progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + url + "', sizingMethod='scale')")
			;
	}
}