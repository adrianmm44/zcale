package zcale.view.css;

import zcale.view.css.properties.*;

class Properties
{
	public var font 	  		: Font;
	public var text 	  		: Text;
	public var margin 	  		: Margin;
	public var padding    		: Padding;
	public var verticalAlign 	: VerticalAlign;
	public var float 	  		: FloatProperty;
	public var position 		: Position;
	public var display    		: Display;
	public var visibility 		: Visibility;
	public var overflow 		: Overflow;
	//public var zIndex 	  	: String;
	public var border 	  		: Border;
	public var background 		: Background;
	public var boxShadow 		: BoxShadow;
	public var listStyle  		: ListStyle;
	
	public function new(){}
	
	public function toString() : String
	{
		var str = "";
				
		if( font != null ){
			str += font.toString();
		}
		if( text != null ){
			str += text.toString();
		}
		if( margin != null ){
			str += margin.toString();
		}
		if( padding != null ){
			str += padding.toString();
		}
		if( verticalAlign != null ){
			str += verticalAlign.toString();
		}
		if( float != null ){
			str == float.toString();
		}
		if( position != null ){
			str == position.toString();
		}
		if( display != null ){
			str == display.toString();
		}
		if( visibility != null ){
			str == visibility.toString();
		}
		if( overflow != null ){
			str == overflow.toString();
		}
		if( border != null ){
			str += border.toString();
		}
		if( background != null ){
			str += background.toString();
		}
		if( boxShadow != null ){
			str += boxShadow.toString();
		}		
		if( listStyle != null ){
			str += listStyle.toString();
		}		
		return str;
	}
}