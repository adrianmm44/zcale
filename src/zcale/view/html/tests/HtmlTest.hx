package zcale.view.html.tests;

import zcale.view.html.H;
import sys.io.File;

class HtmlTest
{
	public static function main( path : String )
	{
		var html = H.doc();
		html.head
			.title.set("Test")
			.metas.add( H.meta() )
			.links.add( H.link() )
			.scripts.add( H.script().set("var foo ='Hallo!';"))
			.addChild( H.style() )
			;
		html.body.add([
			H.div(),
			H.table(),
			H.tr(),
			H.td(),
			H.img().id.set("idImg").src.set("#"),
			H.p().cls.set("classdewd").id.set("dwqd"),
			H.a(),
			H.span()
		])
		.scripts.add( H.script() )
		;
		File.saveContent( path, html.toString() );
	}
}