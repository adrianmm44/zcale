package zcale.view.bootstrap.nodes;

import zcale.view.html.H;
import zcale.view.html.nodes.HtmlNodes;

class BootstrapDoc extends HtmlDoc {
	
	public function new( ?title : String ) {
		
		super( title );
		
		head.metas.add( H.meta().httpEquiv.set("X-UA-Compatible").content.set("IE=edge"))
			.metas.add( H.meta().name.set("viewport").content.set("width=device-width, initial-scale=1"))
			.links.add( H.link("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"))
			.scripts.add( H.script("https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"))
			.scripts.add( H.script("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"))
			.addChild( 
				H.condition.ifLessThanIE9().add([
					H.script("https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"),
					H.script("https://oss.maxcdn.com/respond/1.4.2/respond.min.js")
				])
			);
	}
}