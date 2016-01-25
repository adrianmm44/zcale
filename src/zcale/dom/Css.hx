/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.dom;

import haxe.ds.StringMap;
import zcale.dom.global.DomData;
import zcale.dom.css.Style;
import zcale.dom.css.Styles;

using Lambda;
using StringTools;
using zcale.macros.StringExtender;

class Css
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var data   		  : DomData;
	private var styles 		  : StringMap<Style>;
	private var defaultStyles : StringMap<Style>;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( ids : Array<Int> )
	{
		data 		  = DomData.getInstanceById( ids );
		styles   	  = new StringMap();
		defaultStyles = new StringMap();
		
		setDefaultStyles();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function render() : String
	{
		var  str = "";	
		for( key in styles.keys() )
		{
			var style = styles.get( key );
			if( style.properties.empty() == false )
			{
				if( data.useIndenting == true ){
					str += "\n\t\t";
				}			 
				str += key + " { " + styles.get( key ).render() + " }";
			}
		}
		return str;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function style( selector : String ) : Style
	{
		if( styles.exists( selector ) == true )
		{
			return styles.get( selector );
		}
		else {
			var style = new Style();			
			if( defaultStyles.exists( selector ) == true ){
				//trace( selector );
				style.add( defaultStyles.get( selector ) );
			}
			styles.set( selector, style );
			return style;
		}
	}	
	/*/
	public function setById( id : String, style : Style ) : Void
	{
		styles.set( "#" + id, style );
	}
	
	public function getById( id : String ) : Style
	{
		return styles.get( "#" + id );
	}
	/*/	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function defaultStyle( selector : String ) : Style
	{
		if( defaultStyles.exists( selector ) == true )
		{
			return defaultStyles.get( selector );
		}
		else {
			var style = new Style();			
			defaultStyles.set( selector, style );
			return style;
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
		
	private function setDefaultStyles() : Void // by Eric Meyer // http://meyerweb.com/eric/tools/css/reset/ // v2.0 | 20110126
	{
		for( selector in splitSelectors(
			"html, body, div, span, applet, object, iframe,
			h1, h2, h3, h4, h5, h6, p, blockquote, pre,
			a, abbr, acronym, address, big, cite, code,
			del, dfn, em, img, ins, kbd, q, s, samp,
			small, strike, strong, sub, sup, tt, var,
			b, u, i, center,
			dl, dt, dd, ol, ul, li,
			fieldset, form, label, legend,
			table, caption, tbody, tfoot, thead, tr, th, td,
			article, aside, canvas, details, embed, 
			figure, figcaption, footer, header, hgroup, 
			menu, nav, output, ruby, section, summary,
			time, mark, audio, video"))
		{
			defaultStyles.set( selector, new Style()
		 	.margin.set("0")
			.padding.set("0")
			.border.set("0")
			.font.set("inherit")
			.font.size("100%")
			.verticalAlign("baseline"));
		}
		
		// HTML5 display-role reset for older browsers
		
		for( selector in splitSelectors("article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section"))
		{
			 defaultStyle( selector ).display("block");
		}		
		for( selector in splitSelectors("ol, ul"))
		{
			 defaultStyle( selector ).listStyle.set("none");
		}		
		for( selector in splitSelectors("blockquote, q"))
		{
			 defaultStyle( selector ).quotes("none");
		}		
		for( selector in splitSelectors("blockquote:before, blockquote:after, q:before, q:after"))
		{
			 defaultStyle( selector ).content("none");
		}		
		defaultStyle("body").lineHeight("1");
		
		defaultStyle("table")
			.border.collapse("collapse")
			.border.spacing("0");
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function splitSelectors( selectors : String, delimeter : String = "," ) : Array<String>
	{
		if( selectors.contains(" ") == true && delimeter != " " ){
			selectors = selectors.replace(" ", "");
		}
		if( selectors.contains("\n") == true && delimeter != "\n" ){
			selectors = selectors.replace("\n", "");
		}
		if( selectors.contains("\t") == true && delimeter != "\t" ){
			selectors = selectors.replace("\t", "");
		}
		return selectors.split( delimeter );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////