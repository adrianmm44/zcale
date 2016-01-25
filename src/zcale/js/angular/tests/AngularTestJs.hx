package zcale.js.angular.tests;

import angular.*;
import angular.support.*;
import angular.service.*;

class AngularTestJs {
	
	public static function main() {
		
		new AngularTestJs();
	}
		
	public function new() {
		
		var module = Angular.module("myApp", [] );
		
		module.controller("intro", intro );
		module.controller("controllers1", controllers1 );
		module.controller("controllers2", controllers2 );
		module.controller("controllers3", controllers3 );
		module.controller("http", http );
		module.controller("events1", events2 );
		module.controller("events2", events2 );
		module.controller("forms", forms );
		module.controller("validation", validation );
	}
	
	private function intro( scope : Scope ) : Void {
        
		scope.set("firstName", "John" );
		scope.set("lastName", "Doe" );
    }
	
	private function controllers1( scope : Scope ) : Void {
        
		scope.set("firstName", "John" );
		scope.set("lastName", "Doe" );
    }

	private function controllers2( scope : Scope ) : Void {
        
		scope.set("firstName", "John" );
		scope.set("lastName", "Doe" );
		scope.set("fullName", function() : String {
			
				return scope.get("firstName") + " " + scope.get("lastName");
			}
		);
    }
	
	private function controllers3( scope : Scope ) : Void {
        
		scope.set("names", [
		        { name : 'Jani', country : 'Norway' },
		        { name : 'Hege', country : 'Sweden' },
		        { name : 'Kai',	 country : 'Denmark'}
		    ]
		);
    }
	
	private function http( scope : Scope, http : Http ) : Void {
		
		http.get("http-test.php").success( cast function( response : Dynamic ) {
			
			scope.set("names", response.records );
		});
	}
	
	private function events1( scope : Scope ) : Void {
		
		scope.set("count", 0 );
	}
	
	private function events2( scope : Scope ) : Void {
		
		scope.set("firstName", "John");
		scope.set("lastName", "Doe");
		scope.set("myVar", false );
		scope.set("toggle", function() : Void {				
				scope.set("myVar", !scope.get("myVar"));
			}
		);
	}
	
	private function forms( scope : Scope ) : Void {
				
		scope.set("master", { firstName : "John", lastName : "Doe" });
		
		scope.set("reset", function() {
			scope.set("user", { firstName : "John", lastName : "Doe" } );
		});
		Reflect.callMethod( scope, Reflect.field( scope, "reset"), [] );
	}
	
	private function validation( scope : Scope ) : Void {
		
		scope.set("user",  "John Doe");
		scope.set("email", "john.doe@gmail.com");
	}
}





