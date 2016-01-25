/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.dom.css;

import haxe.ds.StringMap;
import zcale.dom.css.style.Margin;
import zcale.dom.css.style.Padding;
import zcale.dom.css.style.Border;
import zcale.dom.css.style.Background;
import zcale.dom.css.style.Font;
import zcale.dom.css.style.ListStyle;

class Style
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var properties : StringMap<String>;
	public var margin 	  : Margin;
	public var padding 	  : Padding;
	public var border 	  : Border;
	public var background : Background;
	public var font 	  : Font;
	public var listStyle  : ListStyle;
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
		
	public function new()
	{
		properties = new StringMap();
		margin	   = new Margin( 	 this );
		padding	   = new Padding( 	 this );
		border	   = new Border( 	 this );
		background = new Background( this );
		font	   = new Font( 		 this );
		listStyle  = new ListStyle(  this );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function add( style : Style ) : Void
	{
		for( name in style.properties.keys() ){
			 properties.set( name, style.properties.get( name ) );
		}
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function render() : String
	{
		var  str = "";
		for( key in properties.keys() ){
			 str += " " + key + ":" + properties.get( key ) + ";";
		}
		return str.substr( 1 );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function height( v : String ) : Style // Sets the height of an element 1
	{
		properties.set("height", v );
		return this;
	}
	
	public function width( v : String ) : Style // Sets the width of an element 1
	{
		properties.set("width", v );		
		return this;
	}
	
	public function minHeight( v : String ) : Style // Sets the minimum height of an element 2
	{
		properties.set("min-height", v );
		return this;
	}
		
	public function minWidth( v : String ) : Style // Sets the minimum width of an element 2
	{
		properties.set("min-width", v );		
		return this;
	}
	
	public function maxHeight( v : String ) : Style // Sets the maximum height of an element 2
	{
		properties.set("max-height", v );
		return this;
	}
	
	public function maxWidth( v : String ) : Style // Sets the maximum width of an element 2
	{
		properties.set("max-width", v );		
		return this;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Basic Box Properties
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function display( v : String ) : Style // Specifies how a certain HTML element should be displayed 1
	{
		properties.set("display", v );
		return this;
	}
	
	public function verticalAlign( v : String ) : Style // Sets the vertical alignment of an element 1
	{
		properties.set("vertical-align", v );
		return this;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Text Properties
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function lineBreak( v : String ) : Style // Specifies how/if to break lines 3
	{
		properties.set("line-break", v );
		return this;
	}
	
	public function lineHeight( v : String ) : Style // Sets the line height 1
	{
		properties.set("line-height", v );
		return this;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////	
	// Basic User Interface Properties
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function content( v : String ) : Style // Used with the :before and :after pseudo-elements, to insert generated content 2
	{
		properties.set("content", v );
		return this;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Generated Content for Paged Media
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function quotes( v : String ) : Style // Sets the type of quotation marks for embedded quotations 2
	{
		properties.set("quotes", v );
		return this;
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Color Properties
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	public function color( v : String ) : Style	// Sets the color of text 1
	{
		return this;
	}
	
	public function opacity( v : String ) : Style // Sets the opacity level for an element 3
	{
		return this;
	}
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Background and Border Properties
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/	
	public function boxDecorationBreak( v : String ) : Style // Sets the behaviour of the background and border of an element at page-break, or, for in-line elements, at line-break. 3
	{
		return this;
	}
	
	public function boxShadow( v : String ) : Style // Attaches one or more drop-shadows to the box 3
	{
		return this;
	}
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Basic Box Properties
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	public function bottom( v : String ) : Style // Specifies the bottom position of a positioned element 2
	{
		return this;
	}
	
	public function clear( v : String ) : Style // Specifies which sides of an element where other floating elements are not allowed 1
	{
		return this;
	}
	
	public function clip( v : String ) : Style // Clips an absolutely positioned element 2
	{
		return this;
	}
		
	public function float( v : String ) : Style // Specifies whether or not a box should float 1
	{
		return this;
	}
	
	public function left( v : String ) : Style 	// Specifies the left position of a positioned element 2
	{
		return this;
	}
	
	public function overflow( v : String ) : Style // Specifies what happens if content overflows an element's box 2
	{
		return this;
	}
	
	public function overflowX( v : String ) : Style // Specifies whether or not to clip the left/right edges of the content, if it overflows the element's content area 3
	{
		return this;
	}
	
	public function overflowY( v : String ) : Style // Specifies whether or not to clip the top/bottom edges of the content, if it overflows the element's content area 3
	{
		return this;
	}
		
	public function position( v : String ) : Style // Specifies the type of positioning method used for an element (static, relative, absolute or fixed) 2
	{
		return this;
	}
	
	public function right( v : String ) : Style // Specifies the right position of a positioned element 2
	{
		return this;
	}
	
	public function top( v : String ) : Style // Specifies the top position of a positioned element 2
	{
		return this;
	}
	
	public function visibility( v : String ) : Style // Specifies whether or not an element is visible 2
	{
		return this;
	}
		
	public function zIndex( v : String ) : Style // Sets the stack order of a positioned element 2
	{
		return this;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Flexible Box Layout
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function alignContent( v : String ) : Style // Specifies the alignment between the lines inside a flexible container when the items do not use all available space. 3
	{
		return this;
	}
	
	public function alignItems( v : String ) : Style // Specifies the alignment for items inside a flexible container. 3
	{
		return this;
	}
	
	public function alignSelf( v : String ) : Style // Specifies the alignment for selected items inside a flexible container. 3
	{
		return this;
	}
		
	public function justifyContent( v : String ) : Style // Specifies the alignment between the items inside a flexible container when the items do not use all available space. 3
	{
		return this;
	}
		
	public function order( v : String ) : Style // Sets the order of the flexible item, relative to the rest 3
	{
		return this;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Text Properties
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function hangingPunctuation( v : String ) : Style // Specifies whether a punctuation character may be placed outside the line box 3
	{
		return this;
	}
	
	public function hyphens( v : String ) : Style // Sets how to split words to improve the layout of paragraphs 3
	{
		return this;
	}
	
	public function letterSpacing( v : String ) : Style // Increases or decreases the space between characters in a text 1
	{
		return this;
	}
	
	public function overflowWrap( v : String ) : Style // Specifies whether or not the browser may break lines within words in order to prevent overflow (when a string is too long to fit its containing box) 3
	{
		return this;
	}
	
	public function tabSize( v : String ) : Style // Specifies the length of the tab-character 3
	{
		return this;
	}
			
	public function whiteSpace( v : String ) : Style // Specifies how white-space inside an element is handled 1
	{
		return this;
	}
	/*/	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Writing Modes Properties
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	public function direction( v : String ) : Style // Specifies the text direction/writing direction 2
	{
		return this;
	}
		
	public function unicodeBidi( v : String ) : Style // Used together with the direction property to set or return whether the text should be overridden to support multiple languages in the same document 2
	{
		return this;
	}
	
	public function writingMode( v : String ) : Style // 3
	{
		return this;
	}
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////	
	// Table Properties
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	public function captionSide( v : String ) : Style // Specifies the placement of a table caption 2
	{
		return this;
	}
	
	public function emptyCells( v : String ) : Style // Specifies whether or not to display borders and background on empty cells in a table 2
	{
		return this;
	}
	
	public function tableLayout( v : String ) : Style // Sets the layout algorithm to be used for a table 2
	{
		return this;
	}
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////	
	// Lists and Counters Properties
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	public function counterIncrement( v : String ) : Style // Increments one or more counters 2
	{
		return this;
	}
	
	public function counterReset( v : String ) : Style // Creates or resets one or more counters 2
	{
		return this;
	}
	/*/		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Animation Properties
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	public function keyframes( v : String ) : Style // Specifies the animation 3
	{
		return this;
	}
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Transform Properties
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	public function backfaceVisibility( v : String ) : Style // Defines whether or not an element should be visible when not facing the screen 3
	{
		return this;
	}
	
	public function perspective( v : String ) : Style // Specifies the perspective on how 3D elements are viewed 3
	{
		return this;
	}
	
	public function perspectiveOrigin( v : String ) : Style // Specifies the bottom position of 3D elements 3
	{
		return this;
	}
	
	public function transform( v : String ) : Style // Applies a 2D or 3D transformation to an element 3
	{
		return this;
	}
	
	public function transformOrigin( v : String ) : Style // Allows you to change the position on transformed elements 3
	{
		return this;
	}
	
	public function transformStyle( v : String ) : Style // Specifies how nested elements are rendered in 3D space 3
	{
		return this;
	}
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////	
	// Basic User Interface Properties
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	public function boxSizing( v : String ) : Style // Tells the browser what the sizing properties (width and height) should include 3
	{
		return this;
	}
		
	public function cursor( v : String ) : Style // Specifies the type of cursor to be displayed 2
	{
		return this;
	}
	
	public function icon( v : String ) : Style // Provides the author the ability to style an element with an iconic equivalent 3
	{
		return this;
	}
	
	public function imeMode( v : String ) : Style // Controls the state of the input method editor for text fields 3
	{
		return this;
	}
		
	public function resize( v : String ) : Style // Specifies whether or not an element is resizable by the user 3
	{
		return this;
	}
	
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Multi-column Layout Properties
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	public function widows( v : String ) : Style // Sets the minimum number of lines that must be left at the top of a page when a page break occurs inside an element 2
	{
		return this;
	}
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Paged Media
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	public function orphans( v : String ) : Style // Sets the minimum number of lines that must be left at the bottom of a page when a page break occurs inside an element 2
	{
		return this;
	}
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Generated Content for Paged Media
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	public function marks( v : String ) : Style // Adds crop and/or cross marks to the document 3
	{
		return this;
	}	
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Filter Effects Properties
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	public function filter( v : String ) : Style // Defines effects (e.g. blurring or color shifting) on an element before the element is displayed 3
	{
		return this;
	}
	/*/	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Masking Properties
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	public function mask( v : String ) : Style // 3
	{
		return this;
	}
	
	public function maskType( v : String ) : Style // 3
	{
		return this;
	}
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Speech Properties
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*/
	public function mark( v : String ) : Style // A shorthand property for setting the mark-before and mark-after properties 3
	{
		return this;
	}
	
	public function markAfter( v : String ) : Style // Allows named markers to be attached to the audio stream 3
	{
		return this;
	}
	
	public function markBefore( v : String ) : Style // Allows named markers to be attached to the audio stream 3
	{
		return this;
	}
	
	public function phonemes( v : String ) : Style // Specifies a phonetic pronunciation for the text contained by the corresponding element 3
	{
		return this;
	}
	
	public function rest( v : String ) : Style // A shorthand property for setting the rest-before and rest-after properties 3
	{
		return this;
	}
	
	public function restAfter( v : String ) : Style // Specifies a rest or prosodic boundary to be observed after speaking an element's content 3
	{
		return this;
	}
	
	public function restBefore( v : String ) : Style // Specifies a rest or prosodic boundary to be observed before speaking an element's content 3
	{
		return this;
	}
	/*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////