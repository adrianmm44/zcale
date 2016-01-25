package zcale.view.css;

import zcale.view.css.style.BaseStyle;
import zcale.view.css.style.Selector;
import zcale.view.css.style.Property;
import zcale.view.css.style.properties.*;
import zcale.view.css.style.properties.shared.TopBottom;
import zcale.view.css.style.properties.shared.ShowHide;
import zcale.view.css.style.properties.shared.LengthOrAuto;
import zcale.view.css.style.properties.shared.LengthOrNormal;
import zcale.types.mixed.FloatOrString;

@:forward( get, toString )

abstract Style( BaseStyle ) from BaseStyle to BaseStyle {
	
	@:extern public static inline var UNITS : String = "px";
		
	@:extern public static var lib( get, never ) : Style;	
	
	@:extern private static inline function get_lib() : Style {
		
		return new Style();
	}
	/*/
	macro public static function cssError( e : haxe.macro.Expr ) : haxe.macro.Expr {
	
		haxe.macro.Context.fatalError(' property not compatible with the current browser setup', e.pos );
		return null;
	}
	/*/
	@:extern public var add( 			get, never ) : Selector;	
	@:extern public var align(  		get, never ) : Align;
	@:extern public var background(  	get, never ) : Background;
	@:extern public var border(      	get, never ) : Border;
	@:extern public var bottom(      	get, never ) : Property<FloatOrString>;
	@:extern public var box( 		 	get, never ) : Box;
	@:extern public var captionSide( 	get, never ) : TopBottom;
	@:extern public var clear(		 	get, never ) : Clear;
	@:extern public var clip(		 	get, never ) : Clip;	
	@:extern public var color( 	     	get, never ) : Color;
	@:extern public var column( 	 	get, never ) : Column;
	@:extern public var content( 	 	get, never ) : Content;	
	@:extern public var counter( 	 	get, never ) : Counter;
	@:extern public var cursor(	 	 	get, never ) : Cursor;
	@:extern public var direction(	 	get, never ) : Direction;
	@:extern public var display(	 	get, never ) : Display;
	@:extern public var emptyCells(  	get, never ) : ShowHide;
	@:extern public var flex( 		 	get, never ) : Flex;
	@:extern public var float( 		 	get, never ) : FloatBox;
	@:extern public var font( 		 	get, never ) : Font;
	@:extern public var height(      	get, never ) : Height;
	@:extern public var justifyContent( get, never ) : JustifyContent;
	@:extern public var left(      		get, never ) : LengthOrAuto;
	@:extern public var letterSpacing(  get, never ) : LengthOrNormal;
	@:extern public var lineHeight(  	get, never ) : LineHeight;
	@:extern public var listStyle(		get, never ) : ListStyle;
	@:extern public var margin(	    	get, never ) : Margin;
	@:extern public var opacity(    	get, never ) : Property<Float>;
	@:extern public var order(    		get, never ) : Property<Int>;
	@:extern public var outline( 		get, never ) : Outline;
	@:extern public var overflow( 		get, never ) : Overflow;
	@:extern public var padding(    	get, never ) : Padding;
	@:extern public var pageBreak(    	get, never ) : PageBreak;
	@:extern public var perspective(    get, never ) : Perspective;
	@:extern public var position(    	get, never ) : Position;
	@:extern public var quotes(    		get, never ) : Quotes;
	@:extern public var right(      	get, never ) : LengthOrAuto;
	@:extern public var tableLayout(    get, never ) : TableLayout;
	@:extern public var text(	    	get, never ) : Text;
	@:extern public var top(      		get, never ) : LengthOrAuto;
	@:extern public var transform(    	get, never ) : Transform;
	@:extern public var transition(		get, never ) : Transition;
	@:extern public var unicodeBidi( 	get, never ) : UnicodeBidi;
	@:extern public var verticalAlign( 	get, never ) : VerticalAlign;
	@:extern public var visibility( 	get, never ) : Visibility;
	@:extern public var whiteSpace( 	get, never ) : WhiteSpace;	
	@:extern public var width(	    	get, never ) : Width;
	@:extern public var word(	    	get, never ) : Word;
	@:extern public var zIndex(	    	get, never ) : LengthOrAuto;	
	@:extern public var spriteSheet( 	get, never ) : SpriteSheet;
	
	@:extern public inline function new( ?selector : String ) {
		
		this = new BaseStyle( selector );
	}
	
	@:extern private inline function get_add() : Selector {
		
		return new Selector( this );
	}
	@:extern private inline function get_align() 	  	  : Align 					return this;
	@:extern private inline function get_background() 	  : Background 				return this.select("background");
	@:extern private inline function get_border() 	  	  : Border 					return this.select("border", UNITS );
	@:extern private inline function get_bottom() 		  : Property<FloatOrString> return this.get("bottom", UNITS );
	@:extern private inline function get_box() 			  : Box 					return this;
	@:extern private inline function get_captionSide() 	  : TopBottom 				return this.get("caption-side");
	@:extern private inline function get_clear() 		  : Clear		 			return this.get("clear");
	@:extern private inline function get_clip() 		  : Clip		 			return this.get("clip");
	@:extern private inline function get_color() 		  : Color			 		return this.get("color");
	@:extern private inline function get_column() 		  : Column			 		return this;
	@:extern private inline function get_content() 		  : Content			 		return this.get("content");
	@:extern private inline function get_counter() 		  : Counter			 		return this;
	@:extern private inline function get_cursor() 		  : Cursor			 		return this.get("cursor");
	@:extern private inline function get_direction()	  : Direction			 	return this.get("direction");
	@:extern private inline function get_display()		  : Display			 		return this.get("display");
	@:extern private inline function get_emptyCells()	  : ShowHide			 	return this.get("empty-cells");
	@:extern private inline function get_flex()			  : Flex			 		return this.select("flex");
	@:extern private inline function get_float()		  : FloatBox		 		return this.get("float");
	@:extern private inline function get_font()			  : Font		 			return this;	
	@:extern private inline function get_height()		  : Height 					return this;
	@:extern private inline function get_justifyContent() : JustifyContent 			return this.get("justify-content");
	@:extern private inline function get_left()		  	  : LengthOrAuto 			return this.get("left", UNITS );
	@:extern private inline function get_letterSpacing()  : LengthOrNormal			return this.get("letter-spacing", UNITS );
	@:extern private inline function get_lineHeight()  	  : LineHeight				return this.get("line-height");
	@:extern private inline function get_listStyle()  	  : ListStyle				return this.select("list-style");
	@:extern private inline function get_margin()  	  	  : Margin					return this.select("margin", UNITS );
	@:extern private inline function get_opacity() 	  	  : Property<Float>			return this.get("opacity");
	@:extern private inline function get_order() 	  	  : Property<Int>			return this.get("order");
	@:extern private inline function get_outline()  	  : Outline					return this.select("outline");
	@:extern private inline function get_overflow()  	  : Overflow				return this.select("overflow");
	@:extern private inline function get_padding() 		  : Padding 				return this.select("padding", UNITS );
	@:extern private inline function get_pageBreak() 	  : PageBreak 				return this;
	@:extern private inline function get_perspective() 	  : Perspective 			return this.select("perspective", Style.UNITS );
	@:extern private inline function get_position()		  : Position			 	return this.get("position");
	@:extern private inline function get_quotes()		  : Quotes			 		return this.get("quotes");
	@:extern private inline function get_right()		  : LengthOrAuto 			return this.get("right", UNITS );
	@:extern private inline function get_tableLayout()	  : TableLayout			 	return this.get("table-layout");
	@:extern private inline function get_text() 	  	  : Text 					return this;
	@:extern private inline function get_top()		  	  : LengthOrAuto 			return this.get("top", UNITS );
	@:extern private inline function get_transform() 	  : Transform 				return this.select("transform");
	@:extern private inline function get_transition() 	  : Transition 				return this.select("transition");
	@:extern private inline function get_unicodeBidi() 	  : UnicodeBidi				return this.get("unicode-bidi");
	@:extern private inline function get_verticalAlign()  : VerticalAlign 			return this.get("vertical-align", Style.UNITS );	
	@:extern private inline function get_visibility()  	  : Visibility 				return this.get("visibility");
	@:extern private inline function get_whiteSpace()  	  : WhiteSpace 				return this.get("white-space");	
	@:extern private inline function get_width()		  : Width 					return this;
	@:extern private inline function get_word() 	  	  : Word 					return this;
	@:extern private inline function get_zIndex()  	  	  : LengthOrAuto 			return this.get("z-index");	
	@:extern private inline function get_spriteSheet() 	  : SpriteSheet 			return this;	
	@:to
	@:extern public inline function toString() : String {

		return this.toString();
	}
}