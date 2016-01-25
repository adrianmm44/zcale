package zcale.view.css;

using zcale.tools.PathTools;

class FontFace {
	
	public var name  : String;
	public var url   : String;
	public var svgId : String;
	
	public function new( name : String, url : String, ?svgId : String ) {
				
		this.name  = name;
		this.url   = url;
		this.svgId = svgId;
	}
		
	public function toString() : String {
		
		if( url.hasExtension() ) {
			url = url.removeExtension();
		}
		var s = "\n"   + "@font-face {";
		s += "\n\t"    + "font-family: '" + name + "';";
		s += "\n\t"    + "font-style:  normal;";
		s += "\n\t"    + "font-weight: 200;";
		s += "\n\t"    + "src: url('" + url + ".eot'); /* IE9 Compat Modes */";
		s += "\n\t"    + "src: url('" + url  + ".eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */";
		s += "\n\t\t " + "url('" + url + ".woff') format('woff'), /* Modern Browsers */";
		s += "\n\t\t " + "url('" + url + ".ttf')  format('truetype'), /* Safari, Android, iOS */";
		if( svgId != null ) {
			s += "\n\t\t " + "url('" + url + ".svg#" + svgId + "') format('svg'); /* Legacy iOS */";
		}
		return s + "\n" + "}";
	}
}