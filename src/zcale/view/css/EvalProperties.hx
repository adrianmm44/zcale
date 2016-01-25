package zcale.view.css;

import zcale.view.css.Style;
import zcale.view.css.style.BaseStyle;

class EvalProperties {
	
	public static function evalSpriteSheet( style : BaseStyle ) : Void {
		
		var image : String = style.properties.get("-z-sprite-sheet-image").value;
		var width : Float  = style.properties.get("-z-sprite-sheet-width").value;
		
		style.get("background").set( image + " no-repeat" );
		//style.display.inLineBlock();
		evalSprites( style, width );
	}
	
	private static function evalSprites( style : BaseStyle, spriteSheetWidth : Float ) : Void {
		
		for ( subStyle in style.substyles ) {
						
			if( subStyle.properties.exists("-z-sprite-sheet-crop")) {
				
				var sprite = new ImageSprite( subStyle.properties.get("-z-sprite-sheet-crop").value.split(" "), spriteSheetWidth );				
								
				if( subStyle.properties.exists("-z-sprite-width")) {
					
					sprite.width = subStyle.properties.get("-z-sprite-width").value;
				}
				else if( subStyle.properties.exists("-z-sprite-height")) {
					
					sprite.height = subStyle.properties.get("-z-sprite-height").value;
				}
				else if( subStyle.properties.exists("-z-sprite-fit-square")) {
					
					sprite.fitSquare( subStyle.properties.get("-z-sprite-fit-square").value );
				}
				
				cast( subStyle, Style )
					.width.set(  sprite.width  )
					.height.set( sprite.height )
					.background.position.set( sprite.x, sprite.y );
				
				if( sprite.imageRatio != 1 ) {
					cast( subStyle, Style ).background.size.set( Std.string( sprite.sheetRatio * 100 ) + "%");
				}		
				if( sprite.marginY > 0 ){
					cast( subStyle, Style ).margin.top.set( sprite.marginY );
				}
				else if( sprite.marginX > 0 ){
					cast( subStyle, Style ).margin.top.set( sprite.marginX );
				}
			}
			evalSprites( subStyle, spriteSheetWidth );
		}
	}
}

private class ImageSprite { // does not work in Chrome or in Opera because of a positioning bug, but the code is perfectly fine
	
	public var x( 		   get, never )    : Float;
	public var y( 		   get, never )    : Float;
	public var width(  	   get, set ) 	   : Float;
	public var height( 	   get, set ) 	   : Float;
	public var marginX(    default, null ) : Float;
	public var marginY(    default, null ) : Float;
	public var imageRatio( default, null ) : Float;
	public var sheetRatio( get, never )    : Float;
	
	private var sheetWidth 	: Float;
	private var cropX 	   	: Float;
	private var cropY 	   	: Float;
	private var cropWidth  	: Float;
	private var cropHeight 	: Float;
	private var cropPadding : Float = 2;
	
	public function new( cropValues : Array<String>, spriteSheetWidth : Float ) {
		
		cropX 	   = Std.parseFloat( cropValues[ 0 ]);
		cropY 	   = Std.parseFloat( cropValues[ 1 ]);
		cropWidth  = Std.parseFloat( cropValues[ 2 ]);
		cropHeight = Std.parseFloat( cropValues[ 3 ]);
		sheetWidth = spriteSheetWidth;
		imageRatio = 1;
		marginX	   = 0;
		marginY	   = 0;
	}
	
	private function applyPadding() : Void {
		
		cropX 	   -= cropPadding;
		cropY 	   -= cropPadding;
		cropWidth  += ( cropPadding * 2 );
		cropHeight += ( cropPadding * 2 );
	}
	
	private function get_x() : Float return cropX * imageRatio * -1;
	private function get_y() : Float return cropY * imageRatio * -1;
	
	private function get_width() : Float return cropWidth * imageRatio;
		
	private function set_width( value : Float ) : Float {
		
		if( value != cropWidth ) {
			applyPadding();
			imageRatio = value / cropWidth;
		}		
		return value;
	}
		
	private function get_height() : Float return cropHeight * imageRatio;
	
	private function set_height( value : Float ) : Float {
		
		if( value != cropHeight ) {
			applyPadding();
			imageRatio = value / cropHeight;
		}		
		return value;
	}
	
	public function fitSquare( size : Float ) : Void {
		
		if( size != cropWidth || size != cropHeight ) {
			applyPadding();
		}
		if( cropWidth > cropHeight ){
			imageRatio = size / cropWidth;
			marginY    = size - ( cropHeight * imageRatio );
		}
		else{
			imageRatio = size / cropHeight;
			marginX    = size - ( cropWidth * imageRatio );
		}
	}
		
	private function get_sheetRatio() : Float return sheetWidth / cropWidth;
}
