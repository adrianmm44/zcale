package zcale.view.responsive;

import zcale.view.bootstrap.Bts;
import zcale.view.responsive.nodes.ResponsiveNodes;

class Res {
	
	@:extern public static inline var CONTAINER : String = Bts.CONTAINER;
	
	@:extern public static function doc( ?title : String ) : ResponsiveDoc {
		
		return Bts.doc( title );
	}
}