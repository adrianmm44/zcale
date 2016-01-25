package zcale.view.bootstrap;

import zcale.view.bootstrap.nodes.BootstrapNodes;

class Bts {
	
	@:extern public static inline var XS : Int = 0;
	@:extern public static inline var SM : Int = 768;
	@:extern public static inline var MD : Int = 992;
	@:extern public static inline var LG : Int = 1200;
	
	// basic grid
	
	@:extern public static inline var CONTAINER 	  : String = "container";
	@:extern public static inline var CONTAINER_FLUID : String = "container-fluid";
	@:extern public static inline var ROW 	   		  : String = "row";		
			
	// typography
	
	@:extern public static inline var SMALL 		  : String = "small";
	@:extern public static inline var TEXT_LEFT 	  : String = "text-left";
	@:extern public static inline var TEXT_CENTER 	  : String = "text-center";
	@:extern public static inline var TEXT_RIGHT 	  : String = "text-right";
	@:extern public static inline var TEXT_JUSTIFY 	  : String = "text-justify";
	@:extern public static inline var TEXT_NOWRAP 	  : String = "text-nowrap";
	@:extern public static inline var TEXT_LOWERCASE  : String = "text-lowercase";
	@:extern public static inline var TEXT_UPPERCASE  : String = "text-uppercase";
	@:extern public static inline var TEXT_CAPITALIZE : String = "text-capitalize";
	@:extern public static inline var INITIALISM 	  : String = "initialism";
	@:extern public static inline var LIST_UNSTYLED   : String = "list-unstyled";
	@:extern public static inline var LIST_INLINE 	  : String = "list-inline";
	@:extern public static inline var DL_HORIZONTAL   : String = "dl-horizontal";
	@:extern public static inline var PRE_SCROLLABLE  : String = "pre-scrollable";
	
	// images
	
	@:extern public static inline var IMG_RESPONSIVE  		 : String = "img-responsive";
	@:extern public static inline var IMG_ROUNDED 	 		 : String = "img-rounded";
	@:extern public static inline var IMG_CIRCLE 			 : String = "img-circle";
	@:extern public static inline var IMG_THUMBNAIL 	 	 : String = "img-thumbnail";	
	@:extern public static inline var THUMBNAIL 		 	 : String = "thumbnail";
	// @:extern public static inline var EMBED_RESPONSIVE 	 : String = "embed-responsive";
	@:extern public static inline var EMBED_RESPONSIVE_ITEM  : String = "embed-responsive-item";
	@:extern public static inline var EMBED_RESPONSIVE_16BY9 : String = "embed-responsive embed-responsive-16by9";
	@:extern public static inline var EMBED_RESPONSIVE_4BY3  : String = "embed-responsive embed-responsive-4by3";
	
	// well
	
	@:extern public static inline var WELL 	    : String = "well";
	@:extern public static inline var WELL_SM   : String = "well-sm";
	@:extern public static inline var WELL_LG   : String = "well-lg";
	
	@:extern public static inline var HIDDEN_XS : String = "hidden-xs";
	@:extern public static inline var HIDDEN_SM : String = "hidden-sm";
	@:extern public static inline var HIDDEN_MD : String = "hidden-md";
	@:extern public static inline var HIDDEN_LG : String = "hidden-lg";
	
	@:extern public static inline var HIDDEN_INLINE_XS : String = "hidden-inline-xs";
	@:extern public static inline var HIDDEN_INLINE_SM : String = "hidden-inline-sm";
	@:extern public static inline var HIDDEN_INLINE_MD : String = "hidden-inline-md";
	@:extern public static inline var HIDDEN_INLINE_LG : String = "hidden-inline-lg";
	
	@:extern public static inline var VISIBLE_XS : String = "visible-xs";
	@:extern public static inline var VISIBLE_SM : String = "visible-sm";
	@:extern public static inline var VISIBLE_MD : String = "visible-md";
	@:extern public static inline var VISIBLE_LG : String = "visible-lg";
	
	@:extern public static inline var VISIBLE_INLINE_XS : String = "visible-inline-xs";
	@:extern public static inline var VISIBLE_INLINE_SM : String = "visible-inline-sm";
	@:extern public static inline var VISIBLE_INLINE_MD : String = "visible-inline-md";
	@:extern public static inline var VISIBLE_INLINE_LG : String = "visible-inline-lg";
	
	@:extern public static function doc( ?title : String ) : BootstrapDoc {
		
		return new BootstrapDoc( title );
	}	
	@:extern public static var col( 	  get, never ) : Column;
	@:extern public static var colOffset( get, never ) : ColumnOffset;
	
	@:extern private static inline function get_col() : Column {
		
		return new Column();
	}	
	@:extern private static inline function get_colOffset() : ColumnOffset {
		
		return new ColumnOffset();
	}
}

abstract Column( String ) {
	
	@:extern public inline function new() {
		this = null;
	}
	@:extern public inline function xs( span : Int ) : String { // for phones
	
		 return "col-xs-" + Std.string( span );
	}	
	@:extern public inline function sm( span : Int ) : String { // for tablets
	
		 return "col-sm-" + Std.string( span );
	}		
	@:extern public inline function md( span : Int ) : String { // for desktops
	
		 return "col-md-" + Std.string( span );
	}		
	@:extern public inline function lg( span : Int ) : String { // for larger desktops
	
		 return "col-lg-" + Std.string( span );
	}
}

abstract ColumnOffset( String ) {
	
	@:extern public inline function new() {
		this = null;
	}	
	@:extern public inline function xs( span : Int ) : String { // for phones
	
		return "col-xs-offset-" + Std.string( span );
	}	
	@:extern public inline function sm( span : Int ) : String { // for tablets
	
		return "col-sm-offset-" + Std.string( span );
	}		
	@:extern public inline function md( span : Int ) : String { // for desktops
	
		return "col-md-offset-" + Std.string( span );
	}		
	@:extern public inline function lg( span : Int ) : String { // for larger desktops
	
		return "col-lg-offset-" + Std.string( span );
	}
}