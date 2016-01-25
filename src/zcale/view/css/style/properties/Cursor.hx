package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

@:forward( value, set )

abstract Cursor( Property<String> ) from DynamicProperty {
	
	public inline function url( v : String ) : Style {
		
		return this.set("url(" + v + ") auto");
	}
	@:extern public inline function alias() 	   : Style return this.set("alias");
	@:extern public inline function allScroll()    : Style return this.set("all-scroll");
	@:extern public inline function auto() 		   : Style return this.set("auto");
	@:extern public inline function cell() 		   : Style return this.set("cell");
	@:extern public inline function contextMenu()  : Style return this.set("context-menu");
	@:extern public inline function colResize()	   : Style return this.set("col-resize");
	@:extern public inline function copy() 		   : Style return this.set("copy");
	@:extern public inline function crosshair()    : Style return this.set("crosshair");
	@:extern public inline function eResize()	   : Style return this.set("e-resize");
	@:extern public inline function ewResize()	   : Style return this.set("ew-resize");
	@:extern public inline function grab() 		   : Style return this.set("grab");
	@:extern public inline function grabbing() 	   : Style return this.set("grabbing");
	@:extern public inline function help() 		   : Style return this.set("help");
	@:extern public inline function move() 		   : Style return this.set("move");
	@:extern public inline function nResize() 	   : Style return this.set("cell");
	@:extern public inline function neResize()	   : Style return this.set("ne-resize");
	@:extern public inline function neswResize()   : Style return this.set("nesw-resize");
	@:extern public inline function nsResize() 	   : Style return this.set("ns-resize");
	@:extern public inline function nwResize()	   : Style return this.set("nw-resize");
	@:extern public inline function nwseResize()   : Style return this.set("nwse-resize");
	@:extern public inline function noDrop() 	   : Style return this.set("no-drop");
	@:extern public inline function none() 		   : Style return this.set("none");
	@:extern public inline function notAllowed()   : Style return this.set("not-allowed");
	@:extern public inline function pointer() 	   : Style return this.set("pointer");
	@:extern public inline function progress() 	   : Style return this.set("progress");
	@:extern public inline function rowResize()    : Style return this.set("row-resize");
	@:extern public inline function sResize() 	   : Style return this.set("s-resize");
	@:extern public inline function seResize() 	   : Style return this.set("se-resize");
	@:extern public inline function swResize()	   : Style return this.set("sw-resize");
	@:extern public inline function text() 		   : Style return this.set("text");
	@:extern public inline function verticalText() : Style return this.set("vertical-text");
	@:extern public inline function wResize() 	   : Style return this.set("w-resize");	
	@:extern public inline function wait() 		   : Style return this.set("wait");
	@:extern public inline function zoomIn() 	   : Style return this.set("zoom-in");
	@:extern public inline function zoomOut() 	   : Style return this.set("zoom-out");	
}