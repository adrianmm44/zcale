(function (console) { "use strict";
Math.__name__ = true;
var Reflect = function() { };
Reflect.__name__ = true;
Reflect.field = function(o,field) {
	try {
		return o[field];
	} catch( e ) {
		return null;
	}
};
var Std = function() { };
Std.__name__ = true;
Std.string = function(s) {
	return js_Boot.__string_rec(s,"");
};
var angular__$Angular_TranscludeFn_$Impl_$ = {};
angular__$Angular_TranscludeFn_$Impl_$.__name__ = true;
angular__$Angular_TranscludeFn_$Impl_$.call = function(this1,scope,link) {
	this1(scope,link);
};
angular__$Angular_TranscludeFn_$Impl_$.withoutScope = function(this1,link) {
	this1(link);
};
var angular_internal_ModuleMacros = function() { };
angular_internal_ModuleMacros.__name__ = true;
var angular_internal_InjectorMacros = function() { };
angular_internal_InjectorMacros.__name__ = true;
var js_Boot = function() { };
js_Boot.__name__ = true;
js_Boot.__string_rec = function(o,s) {
	if(o == null) return "null";
	if(s.length >= 5) return "<...>";
	var t = typeof(o);
	if(t == "function" && (o.__name__ || o.__ename__)) t = "object";
	switch(t) {
	case "object":
		if(o instanceof Array) {
			if(o.__enum__) {
				if(o.length == 2) return o[0];
				var str2 = o[0] + "(";
				s += "\t";
				var _g1 = 2;
				var _g = o.length;
				while(_g1 < _g) {
					var i1 = _g1++;
					if(i1 != 2) str2 += "," + js_Boot.__string_rec(o[i1],s); else str2 += js_Boot.__string_rec(o[i1],s);
				}
				return str2 + ")";
			}
			var l = o.length;
			var i;
			var str1 = "[";
			s += "\t";
			var _g2 = 0;
			while(_g2 < l) {
				var i2 = _g2++;
				str1 += (i2 > 0?",":"") + js_Boot.__string_rec(o[i2],s);
			}
			str1 += "]";
			return str1;
		}
		var tostr;
		try {
			tostr = o.toString;
		} catch( e ) {
			return "???";
		}
		if(tostr != null && tostr != Object.toString && typeof(tostr) == "function") {
			var s2 = o.toString();
			if(s2 != "[object Object]") return s2;
		}
		var k = null;
		var str = "{\n";
		s += "\t";
		var hasp = o.hasOwnProperty != null;
		for( var k in o ) {
		if(hasp && !o.hasOwnProperty(k)) {
			continue;
		}
		if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
			continue;
		}
		if(str.length != 2) str += ", \n";
		str += s + k + " : " + js_Boot.__string_rec(o[k],s);
		}
		s = s.substring(1);
		str += "\n" + s + "}";
		return str;
	case "function":
		return "<function>";
	case "string":
		return o;
	default:
		return String(o);
	}
};
var zcale_js_angular_tests_AngularTestJs = function() {
	var module = window.angular.module("myApp",[]);
	module.controller("intro",["$scope",$bind(this,this.intro)]);
	module.controller("controllers1",["$scope",$bind(this,this.controllers1)]);
	module.controller("controllers2",["$scope",$bind(this,this.controllers2)]);
	module.controller("controllers3",["$scope",$bind(this,this.controllers3)]);
	module.controller("http",["$scope","$http",$bind(this,this.http)]);
	module.controller("events1",["$scope",$bind(this,this.events2)]);
	module.controller("events2",["$scope",$bind(this,this.events2)]);
	module.controller("forms",["$scope",$bind(this,this.forms)]);
	module.controller("validation",["$scope",$bind(this,this.validation)]);
};
zcale_js_angular_tests_AngularTestJs.__name__ = true;
zcale_js_angular_tests_AngularTestJs.main = function() {
	new zcale_js_angular_tests_AngularTestJs();
};
zcale_js_angular_tests_AngularTestJs.prototype = {
	intro: function(scope) {
		scope.firstName = "John";
		scope.lastName = "Doe";
	}
	,controllers1: function(scope) {
		scope.firstName = "John";
		scope.lastName = "Doe";
	}
	,controllers2: function(scope) {
		scope.firstName = "John";
		scope.lastName = "Doe";
		scope.fullName = function() {
			return Std.string(Reflect.field(scope,"firstName")) + " " + Std.string(Reflect.field(scope,"lastName"));
		};
	}
	,controllers3: function(scope) {
		scope.names = [{ name : "Jani", country : "Norway"},{ name : "Hege", country : "Sweden"},{ name : "Kai", country : "Denmark"}];
	}
	,http: function(scope,http) {
		http.get("http-test.php").success(function(response) {
			scope.names = response.records;
		});
	}
	,events1: function(scope) {
		scope.count = 0;
	}
	,events2: function(scope) {
		scope.firstName = "John";
		scope.lastName = "Doe";
		scope.myVar = false;
		scope.toggle = function() {
			var val = !Reflect.field(scope,"myVar");
			scope.myVar = val;
		};
	}
	,forms: function(scope) {
		scope.master = { firstName : "John", lastName : "Doe"};
		scope.reset = function() {
			scope.user = { firstName : "John", lastName : "Doe"};
		};
		var func = Reflect.field(scope,"reset");
		func.apply(scope,[]);
	}
	,validation: function(scope) {
		scope.user = "John Doe";
		scope.email = "john.doe@gmail.com";
	}
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
String.__name__ = true;
Array.__name__ = true;
var q = window.jQuery;
var js = js || {}
js.JQuery = q;
zcale_js_angular_tests_AngularTestJs.main();
})(typeof console != "undefined" ? console : {log:function(){}});
