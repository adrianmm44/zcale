package zcale.xml.tests;

import zcale.xml.X;
import sys.io.File;

class XmlTest
{
	public static function main( path : String )
	{		
		var xml = 
		X.doc("rss").get("xmlns:g").set("http://base.google.com/ns/1.0").add([
			X.node("channel").add([
				X.node("test"),
				X.pcdata("Test PCData 1"),
				X.pcdata().set("Test PCData 2"),
				X.cdata("Test CData 1"),
				X.cdata().set("Test CData 2"),
				X.comment("Test Comment1"),
				X.comment().set("Test Comment2"),
				"Test String"
			])
		])
		;
		File.saveContent( path, xml.toString() );
	}
}