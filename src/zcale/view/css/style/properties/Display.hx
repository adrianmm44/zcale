package zcale.view.css.style.properties;

import zcale.view.css.Style;
import zcale.view.css.style.Property;
import zcale.view.css.style.property.DynamicProperty;

@:forward( value, set )

abstract Display( Property<String> ) from DynamicProperty {
	
	@:extern public inline function inlined() 	   	   : Style return this.set("inline");
	@:extern public inline function block() 	   	   : Style return this.set("block");
	@:extern public inline function flex() 	   		   : Style return this.set("flex");	
	@:extern public inline function inlineBlock() 	   : Style return this.set("inline-block");
	@:extern public inline function inlineFlex() 	   : Style return this.set("inline-flex");
	@:extern public inline function inlineTable() 	   : Style return this.set("inline-table");
	@:extern public inline function listItem() 	   	   : Style return this.set("list-item");
	@:extern public inline function runIn() 	   	   : Style return this.set("run-in");
	@:extern public inline function table() 	   	   : Style return this.set("table");
	@:extern public inline function tableCaption() 	   : Style return this.set("table-caption");
	@:extern public inline function tableHeaderGroup() : Style return this.set("table-header-group");
	@:extern public inline function tableFooterGroup() : Style return this.set("table-footer-group");
	@:extern public inline function tableRowGroup()    : Style return this.set("table-row-group");
	@:extern public inline function tableCell() 	   : Style return this.set("table-cell");
	@:extern public inline function tableColumn() 	   : Style return this.set("table-column");
	@:extern public inline function tableRow() 	   	   : Style return this.set("table-row");
	@:extern public inline function none() 	   		   : Style return this.set("none");
}