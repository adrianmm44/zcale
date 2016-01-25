package zcale.build.project.fields;

import zcale.types.chains.FloatChain;
import zcale.build.project.ProjectBase;

class Browsers<T:ProjectBase<T>> {
	
	private var project 	 : T;
	
	public var ie			 : FloatChain<T>;
	public var firefox 		 : FloatChain<T>;
	public var chrome 		 : FloatChain<T>;	
	public var safari 		 : FloatChain<T>;
	public var opera 		 : FloatChain<T>;
	
	public var android  	 : FloatChain<T>;
	public var safariMobile  : FloatChain<T>;
	public var ieMobile 	 : FloatChain<T>;
	public var operaMobile 	 : FloatChain<T>;
	public var firefoxMobile : FloatChain<T>;
	
	public function new( project : T ) {
		
		this.project  = project;		
		ie	    	  = new FloatChain( project, 6 );
		firefox		  = new FloatChain( project, 1 );
		chrome  	  = new FloatChain( project, 1 );		
		safari		  = new FloatChain( project, 1 );
		opera		  = new FloatChain( project, 3.5 );		
		android 	  = new FloatChain( project, 2.1 );
		safariMobile  = new FloatChain( project, 3.2 );
		/*/
		ieMobile 	  = new FloatChain( project, 10 );
		operaMobile   = new FloatChain( project, 5 );
		firefoxMobile = new FloatChain( project, 1 );
		/*/
	}
	
	public function classic() : T {
			
		ie.set( 6 );
		firefox.set( 1 );
		chrome.set( 1 );
		safari.set( 1 );
		opera.set( 3.5 );
		android.set( 2.3 );
		safariMobile.set( 3.2 );
		return project;
	}
	
	public function modern() : T {
		
		ie.set( 9 );
		firefox.set( 3.6 );
		chrome.set( 1 );
		safari.set( 4.1 );
		opera.set( 10 );
		android.set( 2.3 );
		safariMobile.set( 3.2 );
		return project;
	}
	
	public function stateOfArt() : T {
		
		ie.set( 11 );
		firefox.set( 33 );
		chrome.set( 38 );
		safari.set( 7.1 );
		opera.set( 25 );
		android.set( 4.1 );
		safariMobile.set( 8 );
		return project;
	}
	
	public function setVersions() : Void {
		
		if( ie.value > 6 ) {
			project.vars.set("ie", Std.string( ie.value ));
		}
		if( firefox.value > 1 ) {
			project.vars.set("firefox", Std.string( firefox.value ));
		}
		if( chrome.value > 1 ) {
			project.vars.set("chrome", Std.string( chrome.value ));
		}
		if( safari.value > 1 ) {
			project.vars.set("safari", Std.string( safari.value ));
		}
		if( opera.value > 3.5 ) {
			project.vars.set("opera", Std.string( opera.value ));
		}
		if( android.value > 2.1 ) {
			project.vars.set("android", Std.string( android.value ));
		}
		if( safariMobile.value > 3.2 ) {
			project.vars.set("safariMobile", Std.string( safariMobile.value ));
		}
		/*/
		if( ieMobile.value > 10 ) {
			project.vars.set("ieMobile", Std.string( ieMobile.value ));
		}
		if( operaMobile.value > 5 ) {
			project.vars.set("operaMobile", Std.string( operaMobile.value ));
		}
		if( firefoxMobile.value > 1 ) {
			project.vars.set("firefoxMobile", Std.string( firefoxMobile.value ));
		}
		/*/
	}
}