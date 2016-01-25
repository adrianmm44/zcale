package zcale.js.angular.tests;

import sys.io.File;
import zcale.view.html.H;
import zcale.view.css.C;
import zcale.view.css.Style;

class AngularTest {
	
	private static var angularUrl   : String = "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js";
	private static var angularJsUrl : String = "AngularTestJs.js";
	
	public static function main( path : String ) {
		
		var html : String = 
		home();
		//intro1();
		//intro2();
		//expressions();
		//directives();
		//controllers();
		//filters();
		//http();
		//tables();
		//dom();
		//events();
		//forms();
		//validation();
		//includes();
		
		File.saveContent( path, html );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private static function home() : String {
		
		var html = H.doc("Angular Home");
		html.head
			.scripts.add( H.script( angularUrl ));
		html.body.add([
			H.div().ng.app().set("").add([
				H.p().add([ H.input().ng.model().set("name") ]),
				H.h(1).addChild("Hello {{name}}")
			])
		])
		;
		return html.toString();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private static function intro1() : String {
		
		var html = H.doc("Angular Intro");
		html.head
			.scripts.add( H.script( angularUrl ));
		html.body.add([
			H.div().ng.app().set("").add([
				H.h(2).addChild("Example 1"),
				H.p().add([ H.input().ng.model().set("name") ]),
				H.p().ng.bind().set("name"),
				
				H.h(2).addChild("Example 2"),
				H.div().ng.init().set("firstName='John'"),
				H.p().add(["The name is", H.span().ng.bind().set("firstName") ]),
				
				H.h(2).addChild("Example 3"),
				H.p().addChild("My first expression: {{ 5 + 5 }}"),
				
				H.h(2).addChild("Example 4"),
				H.p().add([ H.input().ng.model().set("name2") ]),
				H.p().addChild("{{ name2 }}")
			])
		])
		;
		return html.toString();
	}
	
	private static function intro2() : String {
		
		var html = H.doc("Angular Intro");
		html.head
			.scripts.add( H.script( angularUrl ))
			.scripts.add( H.script( angularJsUrl ));
		html.body.add([
			H.div().ng.app().set("myApp").ng.controller().set("intro").add([
				H.h(2).addChild("Example 1"),
				H.p().add(["First Name:", H.input().ng.model().set("firstName"),"<br>"]),
				H.p().add(["Last Name:",  H.input().ng.model().set("lastName" ),"<br>"]),
				H.p().addChild('{{ firstName + " " + lastName }}')
			])
		])
		;
		return html.toString();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private static function expressions() : String {
		
		var html = H.doc("Angular Expressions");
		html.head
			.scripts.add( H.script( angularUrl ));
		html.body.add([
			H.div().ng.app().set("").add([
				H.h(2).addChild("Example 1"),
				H.p().addChild("My first expression: {{ 5 + 5 }}"),
				
				H.h(2).addChild("Example 2"),
				H.div().ng.init().set("quantity=1;cost=5").add([
					H.p().addChild("Total in dollar: {{ quantity * cost }}"),
				]),
				
				H.h(2).addChild("Example 3"),
				H.div().ng.init().set("quantity=1;cost=5").add([
					H.p().add(["Total in dollar: ", H.span().ng.bind().set("quantity * cost") ]),
				]),
				
				H.h(2).addChild("Example 4"),
				H.div().ng.init().set("firstName='John';lastName='Doe'").add([
					H.p().addChild("The name is {{ firstName + ' ' + lastName }}"),
				]),
				
				H.h(2).addChild("Example 5"),
				H.div().ng.init().set("firstName='John';lastName='Doe'").add([
					H.p().add(["The name is ", H.span().ng.bind().set("firstName + ' ' + lastName") ]),
				]),
				
				H.h(2).addChild("Example 6"),
				H.div().ng.init().set("person={firstName:'John',lastName:'Doe'}").add([
					H.p().addChild("The name is {{ person.lastName }}"),
				]),
				
				H.h(2).addChild("Example 7"),
				H.div().ng.init().set("person={firstName:'John',lastName:'Doe'}").add([
					H.p().add(["The name is ", H.span().ng.bind().set("person.lastName") ]),
				]),
				
				H.h(2).addChild("Example 8"),
				H.div().ng.init().set("points=[1,15,19,2,40]").add([
					H.p().addChild("The third result is {{ points[2] }}"),
				]),
				
				H.h(2).addChild("Example 9"),
				H.div().ng.init().set("points=[1,15,19,2,40]").add([
					H.p().add(["The name is ", H.span().ng.bind().set("points[2]") ]),
				]),				
				
			])
		])
		;
		return html.toString();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private static function directives() : String {
		
		var html = H.doc("Angular Directives");
		html.head
			.scripts.add( H.script( angularUrl ));
		html.body.add([
			H.div().ng.app().set("").add([
				H.h(2).addChild("Example 1"),
				H.div().ng.init().set("firstName='John'").add([
					H.p().add([ H.input().ng.model().set("firstName") ]),
					H.p().addChild("You wrote: {{firstName}}")
				]),
				
				H.h(2).addChild("Example 2"),
				H.div().ng.init().set("quantity=1;price=5").add([
					H.p().add(["Quantity:", H.input().type.set("number").ng.model().set("quantity") ]),
					H.p().add(["Costs:", 	H.input().type.set("number").ng.model().set("price") ]),
					H.p().addChild("Total in dollar: {{ quantity * price }}")
				]),
				
				H.h(2).addChild("Example 3"),
				H.div().ng.init().set("names=['Jani','Hege','Kai']").add([
					H.ul().addChild(
						H.li().ng.repeat().set("x in names").addChild("{{ x }}")
					)
				]),
				
				H.h(2).addChild("Example 4"),
				H.div().ng.init().set("names2=[
				{name:'Jani',country:'Norway'},
				{name:'Hege',country:'Sweden'},
				{name:'Kai',country:'Denmark'}]").add([
					H.ul().addChild(
						H.li().ng.repeat().set("x in names2").addChild("{{ x.name + ', ' + x.country }}")
					)
				]),
			])
		])
		;		
		return html.toString();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private static function controllers() : String {
		
		var html = H.doc("Angular Controllers");
		html.head
			.scripts.add( H.script( angularUrl ))
			.scripts.add( H.script( angularJsUrl ));
		html.body.add([
			H.div().ng.app().set("myApp").add([
				H.h(2).addChild("Example 1"),
				H.div().ng.controller().set("controllers1").add([
					H.p().add(["First Name: ", H.input().ng.model().set("firstName") ]),
					H.p().add(["Last Name: ",  H.input().ng.model().set("lastName") ]),
					H.p().add(["Full Name: {{ firstName + ' ' + lastName }}"])
				]),
				
				H.h(2).addChild("Example 2"),
				H.div().ng.controller().set("controllers2").add([
					H.p().add(["First Name: ", H.input().ng.model().set("firstName") ]),
					H.p().add(["Last Name: ",  H.input().ng.model().set("lastName") ]),
					H.p().add(["Full Name: {{ fullName() }}"])
				]),
				
				H.h(2).addChild("Example 3"),
				H.div().ng.controller().set("controllers3").add([
					H.ul().add([
						H.li().ng.repeat().set("x in names").addChild("{{ x.name + ', ' + x.country }}")
					])
				]),
			])
		])
		;
		return html.toString();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private static function filters() : String {
		
		var html = H.doc("Angular Filters");
		html.head
			.scripts.add( H.script( angularUrl ));
		html.body.add([
			H.div().ng.app().set("").add([
				H.h(2).addChild("Example 1"),
				H.div().ng.init().set("fullName='John Doe'").add([
					H.p().add(["The name is: {{ fullName | uppercase }}"])
				]),
				
				H.h(2).addChild("Example 2"),
				H.div().ng.init().set("fullName='John Doe'").add([
					H.p().add(["The name is: {{ fullName | lowercase }}"])
				]),
				
				H.h(2).addChild("Example 3"),
				H.div().ng.init().set("quantity=0;price=0").add([
					H.input().ng.model().set("quantity"),
					H.input().ng.model().set("price"),
					H.p().add(["{{ ( quantity * price ) | currency }}"])
				]),
				
				H.h(2).addChild("Example 4"),
				H.div().ng.init().set("names=[
					{ name : 'John Doe', country : 'US' }, 
					{ name : 'James Brown', country : 'Angelo' }]").add([
					H.ul().add([
						H.li().ng.repeat().set("person in names | orderBy:'country'").addChild(
							"{{ person.name + ', ' + person.country }}"
						)
					])
				]),
				
				H.h(2).addChild("Example 5"),
				H.div().ng.init().set("names=[
					{ name : 'John Doe', country : 'US' }, 
					{ name : 'James Brown', country : 'Angelo' }]").add([
					H.p().addChild( H.input().ng.model().set("test")),
					H.ul().add([
						H.li().ng.repeat().set("person in names | filter:test | orderBy:'country'").addChild(
							"{{ person.name + ', ' + person.country }}"
						)
					])
				])
			])
		])
		;
		return html.toString();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private static function http() : String {
		
		var html = H.doc("Angular Http");
		html.head
			.scripts.add( H.script( angularUrl ))
			.scripts.add( H.script( angularJsUrl ));
		html.body.add([
			H.div().ng.app().set("myApp").add([
				H.h(2).addChild("Example 1"),
				H.div().ng.controller().set("http").add([
					H.ul().add([
						H.li().ng.repeat().set("person in names").add([
							"{{ person.Name + ', ' + person.Country }}"
						])
					])
				])
			])
		])
		;
		return html.toString();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private static function tables() : String {
		
		var html = H.doc("Angular Tables");
		html.head
			.scripts.add( H.script( angularUrl ))
			.scripts.add( H.script( angularJsUrl ))
			.addChild(
				H.style().addChild(
				"table, th , td {
				  border: 1px solid grey;
				  border-collapse: collapse;
				  padding: 5px;
				}
				/*
				table tr:nth-child(odd) {
				  background-color: #f1f1f1;
				}
				table tr:nth-child(even) {
				  background-color: #ffffff;
				}*/")
			);
		html.body.add([
			H.div().ng.app().set("myApp").add([
				H.h(2).addChild("Example 1"),				
				H.div().ng.controller().set("http").add([
					H.table().add([
						H.tr().ng.repeat().set("person in names").add([
							H.td().ng._if().set("$odd").style.set( Style.lib.background.color.set("#f1f1f1") ).addChild("{{ $index + 1 }}"),
							H.td().ng._if().set("$odd").style.set( Style.lib.background.color.set("#f1f1f1") ).addChild("{{ person.Name }}"),
							H.td().ng._if().set("$odd").style.set( Style.lib.background.color.set("#f1f1f1") ).addChild("{{ person.Country }}"),
							H.td().ng._if().set("$even").addChild("{{ $index + 1 }}"),
							H.td().ng._if().set("$even").addChild("{{ person.Name }}"),
							H.td().ng._if().set("$even").addChild("{{ person.Country }}")
						])
					])
				])
			])
		])
		;
		return html.toString();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private static function dom() : String {
		
		var html = H.doc("Angular DOM");
		html.head
			.scripts.add( H.script( angularUrl ));
		html.body.add([
			H.div().ng.app().set("").add([
				
				H.h(2).addChild("Example 1"),
				H.div().ng.init().set("mySwitch=true").add([					
					H.p().add([ H.button().ng.disabled().set("mySwitch").addChild("Click Me!") ]),
					H.p().add([ H.input("checkbox").ng.model().set("mySwitch"), "Button" ]),
					H.p().add(["{{ mySwitch }}"])
				]),
				H.h(2).addChild("Example 2"),
				H.p().ng.show().set("true").add(["I am visible."]),
				H.p().ng.show().set("false").add(["I am not visible."]),
				
				H.h(2).addChild("Example 3"),
				H.div().ng.init().set("hour=13").addChild(
					H.p().ng.show().set("hour > 12").addChild("I am visible.")
				),
				
				H.h(2).addChild("Example 4"),
				H.p().get("ng-hide").set("true").add(["I am not visible."]),
				H.p().get("ng-hide").set("false").add(["I am visible."]),
			])
		])
		;
		return html.toString();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private static function events() : String {
		
		var html = H.doc("Angular Events");
		html.head
			.scripts.add( H.script( angularUrl ))
			.scripts.add( H.script( angularJsUrl ));
		html.body.add([
			H.div().ng.app().set("myApp").add([
				H.h(2).addChild("Example 1"),
				H.div().ng.controller().set("events1").add([
					H.button().type.set("button").get("ng-click").set("count = count + 1").addChild("Click me!"),
					H.p().addChild("{{ count }}")
				]),
				
				H.h(2).addChild("Example 2"),
				H.div().ng.controller().set("events2").add([
					H.button().get("ng-click").set("toggle()").addChild("Hide user"),
					H.p().get("ng-hide").set("myVar").add([
						"First Name:", H.input().ng.model().set("firstName"), "<br>",
						"Last Name:",  H.input().ng.model().set("lastName"), "<br>",
						"<br>",
						"Full Name: {{ firstName + ' ' + lastName }}"
					])
				])
			])
		])
		;
		return html.toString();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private static function forms() : String {
		
		var html = H.doc("Angular Forms");
		html.head
			.scripts.add( H.script( angularUrl ))
			.scripts.add( H.script( angularJsUrl ));
		html.body.add([
			H.div().ng.app().set("myApp").add([
				H.h(2).addChild("Example 1"),
				H.div().ng.controller().set("forms").add([
					H.form().novalidate().add([
						"First Name:<br>",
						H.input().ng.model().set("user.firstName"),
						"<br>", 
						"<br>",
						"Last Name:<br>",
						H.input().ng.model().set("user.lastName"),
						"<br>", 
						"<br>",
						H.button().get("ng-click").set("reset()").addChild("RESET")
					]),					
					H.p().addChild("form = {{ user }}"),
					H.p().addChild("master {{ master }}")
				])
			])
		])
		;
		return html.toString();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private static function validation() : String {
		
		var html = H.doc("Angular Validation");
		html.head
			.scripts.add( H.script( angularUrl ))
			.scripts.add( H.script( angularJsUrl ));
		html.body.add([
			H.div().ng.app().set("myApp").add([
				H.h(2).addChild("Example 1"),
				H.div().ng.controller().set("validation").add([
					H.form().name.set("myForm").novalidate().add([
						H.p().add([
							"Username:<br>",
							H.input().name.set("user").ng.model().set("user").required(),
							H.span().style.set( Style.lib.color.lib.red().toString() ).ng.show().set("myForm.user.$dirty && myForm.user.$invalid").add([
								H.span().ng.show().set("myForm.user.$error.required").addChild("Username is required.")
							])
						]),
						H.p().add([
							"Email:<br>",
							H.input().type.set("email").name.set("email").ng.model().set("email").required(),
							H.span().style.set( Style.lib.color.lib.red().toString() ).ng.show().set("myForm.email.$dirty && myForm.email.$invalid").add([
								H.span().ng.show().set("myForm.email.$error.required").addChild("Email is required."),
								H.span().ng.show().set("myForm.email.$error.email").addChild("Invalid email address."),
							])
						]),
						H.p().add([
							H.input("submit").ng.disabled().set("myForm.user.$dirty && myForm.user.$invalid || myForm.email.$dirty && myForm.email.$invalid")
						])
					])
				])
			])
		])
		;
		return html.toString();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private static function includes() : String {
		
		var html = H.doc("Angular Includes");
		html.head
			.scripts.add( H.script( angularUrl ));
		html.body.add([
			H.div().ng.app().set("").add([
				H.h(2).addChild("Example 1"),
				H.div().ng.include().set("'include-test.html'")
			])
		])
		;
		return html.toString();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}