(function ($hx_exports) { "use strict";
$hx_exports.zcale = $hx_exports.zcale || {};
$hx_exports.zcale.core = $hx_exports.zcale.core || {};
$hx_exports.zcale.core.web = $hx_exports.zcale.core.web || {};
$hx_exports.zcale.core.web.scriptLoader = $hx_exports.zcale.core.web.scriptLoader || {};
$hx_exports.zcale.core.web.scriptLoader.targets = $hx_exports.zcale.core.web.scriptLoader.targets || {};
;$hx_exports.zcale.core.boot = $hx_exports.zcale.core.boot || {};
$hx_exports.zcale.core.boot.targets = $hx_exports.zcale.core.boot.targets || {};
;$hx_exports.zcale.core.events = $hx_exports.zcale.core.events || {};
$hx_exports.zcale.core.events.interfaces = $hx_exports.zcale.core.events.interfaces || {};
var $hxClasses = {};
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var EReg = function(r,opt) {
	opt = opt.split("u").join("");
	this.r = new RegExp(r,opt);
};
$hxClasses["EReg"] = EReg;
EReg.__name__ = ["EReg"];
EReg.prototype = {
	match: function(s) {
		if(this.r.global) this.r.lastIndex = 0;
		this.r.m = this.r.exec(s);
		this.r.s = s;
		return this.r.m != null;
	}
	,__class__: EReg
};
var HxOverrides = function() { };
$hxClasses["HxOverrides"] = HxOverrides;
HxOverrides.__name__ = ["HxOverrides"];
HxOverrides.dateStr = function(date) {
	var m = date.getMonth() + 1;
	var d = date.getDate();
	var h = date.getHours();
	var mi = date.getMinutes();
	var s = date.getSeconds();
	return date.getFullYear() + "-" + (m < 10?"0" + m:"" + m) + "-" + (d < 10?"0" + d:"" + d) + " " + (h < 10?"0" + h:"" + h) + ":" + (mi < 10?"0" + mi:"" + mi) + ":" + (s < 10?"0" + s:"" + s);
};
HxOverrides.substr = function(s,pos,len) {
	if(pos != null && pos != 0 && len != null && len < 0) return "";
	if(len == null) len = s.length;
	if(pos < 0) {
		pos = s.length + pos;
		if(pos < 0) pos = 0;
	} else if(len < 0) len = s.length + len - pos;
	return s.substr(pos,len);
};
HxOverrides.indexOf = function(a,obj,i) {
	var len = a.length;
	if(i < 0) {
		i += len;
		if(i < 0) i = 0;
	}
	while(i < len) {
		if(a[i] === obj) return i;
		i++;
	}
	return -1;
};
HxOverrides.remove = function(a,obj) {
	var i = HxOverrides.indexOf(a,obj,0);
	if(i == -1) return false;
	a.splice(i,1);
	return true;
};
HxOverrides.iter = function(a) {
	return { cur : 0, arr : a, hasNext : function() {
		return this.cur < this.arr.length;
	}, next : function() {
		return this.arr[this.cur++];
	}};
};
var Lambda = function() { };
$hxClasses["Lambda"] = Lambda;
Lambda.__name__ = ["Lambda"];
Lambda.has = function(it,elt) {
	var $it0 = $iterator(it)();
	while( $it0.hasNext() ) {
		var x = $it0.next();
		if(x == elt) return true;
	}
	return false;
};
var IMap = function() { };
$hxClasses["IMap"] = IMap;
IMap.__name__ = ["IMap"];
Math.__name__ = ["Math"];
var Reflect = function() { };
$hxClasses["Reflect"] = Reflect;
Reflect.__name__ = ["Reflect"];
Reflect.field = function(o,field) {
	try {
		return o[field];
	} catch( e ) {
		return null;
	}
};
Reflect.setField = function(o,field,value) {
	o[field] = value;
};
Reflect.callMethod = function(o,func,args) {
	return func.apply(o,args);
};
Reflect.fields = function(o) {
	var a = [];
	if(o != null) {
		var hasOwnProperty = Object.prototype.hasOwnProperty;
		for( var f in o ) {
		if(f != "__id__" && f != "hx__closures__" && hasOwnProperty.call(o,f)) a.push(f);
		}
	}
	return a;
};
var Std = function() { };
$hxClasses["Std"] = Std;
Std.__name__ = ["Std"];
Std.string = function(s) {
	return js.Boot.__string_rec(s,"");
};
var StringTools = function() { };
$hxClasses["StringTools"] = StringTools;
StringTools.__name__ = ["StringTools"];
StringTools.replace = function(s,sub,by) {
	return s.split(sub).join(by);
};
var ValueType = { __ename__ : true, __constructs__ : ["TNull","TInt","TFloat","TBool","TObject","TFunction","TClass","TEnum","TUnknown"] };
ValueType.TNull = ["TNull",0];
ValueType.TNull.__enum__ = ValueType;
ValueType.TInt = ["TInt",1];
ValueType.TInt.__enum__ = ValueType;
ValueType.TFloat = ["TFloat",2];
ValueType.TFloat.__enum__ = ValueType;
ValueType.TBool = ["TBool",3];
ValueType.TBool.__enum__ = ValueType;
ValueType.TObject = ["TObject",4];
ValueType.TObject.__enum__ = ValueType;
ValueType.TFunction = ["TFunction",5];
ValueType.TFunction.__enum__ = ValueType;
ValueType.TClass = function(c) { var $x = ["TClass",6,c]; $x.__enum__ = ValueType; return $x; };
ValueType.TEnum = function(e) { var $x = ["TEnum",7,e]; $x.__enum__ = ValueType; return $x; };
ValueType.TUnknown = ["TUnknown",8];
ValueType.TUnknown.__enum__ = ValueType;
var Type = function() { };
$hxClasses["Type"] = Type;
Type.__name__ = ["Type"];
Type.getClass = function(o) {
	if(o == null) return null;
	if((o instanceof Array) && o.__enum__ == null) return Array; else return o.__class__;
};
Type.getClassName = function(c) {
	var a = c.__name__;
	return a.join(".");
};
Type.resolveClass = function(name) {
	var cl = $hxClasses[name];
	if(cl == null || !cl.__name__) return null;
	return cl;
};
Type["typeof"] = function(v) {
	var _g = typeof(v);
	switch(_g) {
	case "boolean":
		return ValueType.TBool;
	case "string":
		return ValueType.TClass(String);
	case "number":
		if(Math.ceil(v) == v % 2147483648.0) return ValueType.TInt;
		return ValueType.TFloat;
	case "object":
		if(v == null) return ValueType.TNull;
		var e = v.__enum__;
		if(e != null) return ValueType.TEnum(e);
		var c;
		if((v instanceof Array) && v.__enum__ == null) c = Array; else c = v.__class__;
		if(c != null) return ValueType.TClass(c);
		return ValueType.TObject;
	case "function":
		if(v.__name__ || v.__ename__) return ValueType.TObject;
		return ValueType.TFunction;
	case "undefined":
		return ValueType.TNull;
	default:
		return ValueType.TUnknown;
	}
};
var haxe = {};
haxe.ds = {};
haxe.ds.StringMap = function() {
	this.h = { };
};
$hxClasses["haxe.ds.StringMap"] = haxe.ds.StringMap;
haxe.ds.StringMap.__name__ = ["haxe","ds","StringMap"];
haxe.ds.StringMap.__interfaces__ = [IMap];
haxe.ds.StringMap.prototype = {
	set: function(key,value) {
		this.h["$" + key] = value;
	}
	,get: function(key) {
		return this.h["$" + key];
	}
	,keys: function() {
		var a = [];
		for( var key in this.h ) {
		if(this.h.hasOwnProperty(key)) a.push(key.substr(1));
		}
		return HxOverrides.iter(a);
	}
	,__class__: haxe.ds.StringMap
};
var js = {};
js.Boot = function() { };
$hxClasses["js.Boot"] = js.Boot;
js.Boot.__name__ = ["js","Boot"];
js.Boot.getClass = function(o) {
	if((o instanceof Array) && o.__enum__ == null) return Array; else return o.__class__;
};
js.Boot.__string_rec = function(o,s) {
	if(o == null) return "null";
	if(s.length >= 5) return "<...>";
	var t = typeof(o);
	if(t == "function" && (o.__name__ || o.__ename__)) t = "object";
	switch(t) {
	case "object":
		if(o instanceof Array) {
			if(o.__enum__) {
				if(o.length == 2) return o[0];
				var str = o[0] + "(";
				s += "\t";
				var _g1 = 2;
				var _g = o.length;
				while(_g1 < _g) {
					var i = _g1++;
					if(i != 2) str += "," + js.Boot.__string_rec(o[i],s); else str += js.Boot.__string_rec(o[i],s);
				}
				return str + ")";
			}
			var l = o.length;
			var i1;
			var str1 = "[";
			s += "\t";
			var _g2 = 0;
			while(_g2 < l) {
				var i2 = _g2++;
				str1 += (i2 > 0?",":"") + js.Boot.__string_rec(o[i2],s);
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
		if(tostr != null && tostr != Object.toString) {
			var s2 = o.toString();
			if(s2 != "[object Object]") return s2;
		}
		var k = null;
		var str2 = "{\n";
		s += "\t";
		var hasp = o.hasOwnProperty != null;
		for( var k in o ) {
		if(hasp && !o.hasOwnProperty(k)) {
			continue;
		}
		if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
			continue;
		}
		if(str2.length != 2) str2 += ", \n";
		str2 += s + k + " : " + js.Boot.__string_rec(o[k],s);
		}
		s = s.substring(1);
		str2 += "\n" + s + "}";
		return str2;
	case "function":
		return "<function>";
	case "string":
		return o;
	default:
		return String(o);
	}
};
js.Boot.__interfLoop = function(cc,cl) {
	if(cc == null) return false;
	if(cc == cl) return true;
	var intf = cc.__interfaces__;
	if(intf != null) {
		var _g1 = 0;
		var _g = intf.length;
		while(_g1 < _g) {
			var i = _g1++;
			var i1 = intf[i];
			if(i1 == cl || js.Boot.__interfLoop(i1,cl)) return true;
		}
	}
	return js.Boot.__interfLoop(cc.__super__,cl);
};
js.Boot.__instanceof = function(o,cl) {
	if(cl == null) return false;
	switch(cl) {
	case Int:
		return (o|0) === o;
	case Float:
		return typeof(o) == "number";
	case Bool:
		return typeof(o) == "boolean";
	case String:
		return typeof(o) == "string";
	case Array:
		return (o instanceof Array) && o.__enum__ == null;
	case Dynamic:
		return true;
	default:
		if(o != null) {
			if(typeof(cl) == "function") {
				if(o instanceof cl) return true;
				if(js.Boot.__interfLoop(js.Boot.getClass(o),cl)) return true;
			}
		} else return false;
		if(cl == Class && o.__name__ != null) return true;
		if(cl == Enum && o.__ename__ != null) return true;
		return o.__enum__ == cl;
	}
};
js.Boot.__cast = function(o,t) {
	if(js.Boot.__instanceof(o,t)) return o; else throw "Cannot cast " + Std.string(o) + " to " + Std.string(t);
};
var zcale = {};
zcale.Core = $hx_exports.zcale.Core = function() { };
$hxClasses["zcale.Core"] = zcale.Core;
zcale.Core.__name__ = ["zcale","Core"];
zcale.Core.boot = function(mainClass,onComplete,onError) {
	zcale.Core.bootstrap = zcale.core.boot.targets.JsBoot.getInstance();
	zcale.Core.bootstrap.event.addListener(zcale.Core.bootstrap.eventKeys.complete,function(cls) {
		zcale.Core.bootstrap.event.removeAllListeners();
		onComplete();
	});
	zcale.Core.bootstrap.event.addListener(zcale.Core.bootstrap.eventKeys.error,function(cls1) {
		zcale.Core.bootstrap.event.removeAllListeners();
		onError(cls1.event.error.toString());
	});
	zcale.Core.bootstrap.boot(mainClass);
};
zcale.Core.bootModules = function(mainClass,modules,onComplete,onError) {
	zcale.Core.boot(mainClass,function() {
		var loader = new zcale.core.web.ModuleLoader();
		loader.exclude(modules[0]);
		loader.event.addListener(loader.eventKeys.complete,function(cls) {
			loader.event.removeAllListeners();
			onComplete();
		});
		loader.event.addListener(loader.eventKeys.error,function(cls1) {
			loader.event.removeAllListeners();
			if(onError != null) onError(loader.event.error.toString());
		});
		loader.load(modules);
	},function(errorMessage) {
		if(onError != null) onError(errorMessage);
	});
};
zcale.Core.trace = function(str) {
	zcale.Core.bootstrap.trace(str);
};
zcale.PathTools = function() { };
$hxClasses["zcale.PathTools"] = zcale.PathTools;
zcale.PathTools.__name__ = ["zcale","PathTools"];
zcale.PathTools.firstElement = function(path,delimiter) {
	if(delimiter == null) delimiter = "/";
	path = zcale.PathTools.removeFrontDelimiter(path,delimiter);
	if(path.indexOf(delimiter) > -1) {
		var len = path.indexOf(delimiter);
		path = HxOverrides.substr(path,0,len);
	}
	return path;
};
zcale.PathTools.lastElement = function(path,delimiter) {
	if(delimiter == null) delimiter = "/";
	path = zcale.PathTools.removeEndDelimiter(path,delimiter);
	var pos = path.lastIndexOf(delimiter) + 1;
	return HxOverrides.substr(path,pos,null);
};
zcale.PathTools.removeFirstElement = function(path,delimiter) {
	if(delimiter == null) delimiter = "/";
	path = zcale.PathTools.removeFrontDelimiter(path,delimiter);
	if(path.indexOf(delimiter) > -1) {
		var pos = path.indexOf(delimiter);
		path = HxOverrides.substr(path,pos,null);
		if(path == delimiter) path = "";
	} else if(path.length > 0) path = "";
	return path;
};
zcale.PathTools.removeLastElement = function(path,delimiter) {
	if(delimiter == null) delimiter = "/";
	path = zcale.PathTools.removeEndDelimiter(path,delimiter);
	if(path.indexOf(delimiter) > -1) {
		var len = path.lastIndexOf(delimiter);
		path = HxOverrides.substr(path,0,len);
	} else if(path.length > 0) path = "";
	return path;
};
zcale.PathTools.removeFrontDelimiter = function(path,delimiter) {
	if(delimiter == null) delimiter = "/";
	if(HxOverrides.substr(path,0,1) == delimiter) path = HxOverrides.substr(path,1,null);
	return path;
};
zcale.PathTools.removeEndDelimiter = function(path,delimiter) {
	if(delimiter == null) delimiter = "/";
	if(HxOverrides.substr(path,-1,null) == delimiter) path = HxOverrides.substr(path,0,-1);
	return path;
};
zcale.PathTools.hasExtension = function(path,delimiter) {
	if(delimiter == null) delimiter = "/";
	var source = zcale.PathTools.lastElement(path,delimiter);
	return source.indexOf(".") > -1;
};
zcale.PathTools.removeExtension = function(path,delimiter) {
	if(delimiter == null) delimiter = "/";
	if(zcale.PathTools.hasExtension(path,delimiter)) {
		var len = path.lastIndexOf(".");
		path = HxOverrides.substr(path,0,len);
	}
	return path;
};
zcale.PathTools.splitPath = function(path,delimiter) {
	if(delimiter == null) delimiter = "/";
	path = zcale.PathTools.removeFrontDelimiter(path,delimiter);
	path = zcale.PathTools.removeEndDelimiter(path,delimiter);
	return path.split(delimiter);
};
zcale.PathTools.joinPath = function(array,delimiter) {
	if(delimiter == null) delimiter = "/";
	var path = array.join(delimiter);
	if(path.length > 0) path = delimiter + path;
	return path;
};
zcale.PathTools.cleanPath = function(path,delimiter) {
	if(delimiter == null) delimiter = "/";
	var doubleDelimiter = delimiter + delimiter;
	while(path.indexOf(doubleDelimiter) > -1) path = StringTools.replace(path,doubleDelimiter,delimiter);
	return path;
};
zcale.PathTools.paramsToString = function(params) {
	var str = "";
	var $it0 = params.keys();
	while( $it0.hasNext() ) {
		var key = $it0.next();
		str += key + "=" + params.get(key) + "&";
	}
	if(str.length > 0) str = HxOverrides.substr(str,0,-1);
	return str;
};
zcale.core = {};
zcale.core.events = {};
zcale.core.events.interfaces = {};
zcale.core.events.interfaces.IAsyncDispatcher = $hx_exports.zcale.core.events.interfaces.IAsyncDispatcher = function() { };
$hxClasses["zcale.core.events.interfaces.IAsyncDispatcher"] = zcale.core.events.interfaces.IAsyncDispatcher;
zcale.core.events.interfaces.IAsyncDispatcher.__name__ = ["zcale","core","events","interfaces","IAsyncDispatcher"];
zcale.core.events.interfaces.IAsyncDispatcher.prototype = {
	__class__: zcale.core.events.interfaces.IAsyncDispatcher
};
zcale.core.boot = {};
zcale.core.boot.ITracer = function() { };
$hxClasses["zcale.core.boot.ITracer"] = zcale.core.boot.ITracer;
zcale.core.boot.ITracer.__name__ = ["zcale","core","boot","ITracer"];
zcale.core.boot.ITracer.prototype = {
	__class__: zcale.core.boot.ITracer
};
zcale.core.boot.IBoot = function() { };
$hxClasses["zcale.core.boot.IBoot"] = zcale.core.boot.IBoot;
zcale.core.boot.IBoot.__name__ = ["zcale","core","boot","IBoot"];
zcale.core.boot.IBoot.__interfaces__ = [zcale.core.events.interfaces.IAsyncDispatcher,zcale.core.boot.ITracer];
zcale.core.boot.IBoot.prototype = {
	__class__: zcale.core.boot.IBoot
};
zcale.core.patterns = {};
zcale.core.patterns.ISingleton = function() { };
$hxClasses["zcale.core.patterns.ISingleton"] = zcale.core.patterns.ISingleton;
zcale.core.patterns.ISingleton.__name__ = ["zcale","core","patterns","ISingleton"];
zcale.core.boot.targets = {};
zcale.core.boot.targets.JsBoot = $hx_exports.zcale.core.boot.targets.JsBoot = function() {
	this.completed = false;
	this.printHtml = false;
	this.eventKeys = new zcale.core.events.AsyncKeys();
	this.eventData = new zcale.core.events.AsyncData();
	this.event = new zcale.core.events.AsyncDispatcher(this,this.eventData);
};
$hxClasses["zcale.core.boot.targets.JsBoot"] = zcale.core.boot.targets.JsBoot;
zcale.core.boot.targets.JsBoot.__name__ = ["zcale","core","boot","targets","JsBoot"];
zcale.core.boot.targets.JsBoot.__interfaces__ = [zcale.core.patterns.ISingleton,zcale.core.boot.IBoot];
zcale.core.boot.targets.JsBoot.getInstance = function() {
	if(zcale.core.boot.targets.JsBoot.instance == null) zcale.core.boot.targets.JsBoot.instance = new zcale.core.boot.targets.JsBoot();
	return zcale.core.boot.targets.JsBoot.instance;
};
zcale.core.boot.targets.JsBoot.prototype = {
	boot: function(mainClass) {
		this.completed = true;
		this.event.dispatch(this.eventKeys.complete);
	}
	,trace: function(str) {
		window.document.getElementById("traces").innerHTML += "\n" + Std.string(str);
	}
	,__class__: zcale.core.boot.targets.JsBoot
};
zcale.core.events.EventData = $hx_exports.zcale.core.events.EventData = function() {
	this.eventKey = -1;
};
$hxClasses["zcale.core.events.EventData"] = zcale.core.events.EventData;
zcale.core.events.EventData.__name__ = ["zcale","core","events","EventData"];
zcale.core.events.EventData.prototype = {
	__class__: zcale.core.events.EventData
};
zcale.core.events.AsyncData = $hx_exports.zcale.core.events.AsyncData = function() {
	zcale.core.events.EventData.call(this);
	this.error = { crumbs : []};
};
$hxClasses["zcale.core.events.AsyncData"] = zcale.core.events.AsyncData;
zcale.core.events.AsyncData.__name__ = ["zcale","core","events","AsyncData"];
zcale.core.events.AsyncData.toObject = function(eventData) {
	var object = { };
	var _g = 0;
	var _g1 = Reflect.fields(eventData);
	while(_g < _g1.length) {
		var fieldName = _g1[_g];
		++_g;
		Reflect.setField(object,fieldName,Reflect.field(eventData,fieldName));
	}
	return object;
};
zcale.core.events.AsyncData.fromObject = function(eventData,object) {
	var _g = 0;
	var _g1 = Reflect.fields(object);
	while(_g < _g1.length) {
		var fieldName = _g1[_g];
		++_g;
		Reflect.setField(eventData,fieldName,Reflect.field(object,fieldName));
	}
};
zcale.core.events.AsyncData.__super__ = zcale.core.events.EventData;
zcale.core.events.AsyncData.prototype = $extend(zcale.core.events.EventData.prototype,{
	__class__: zcale.core.events.AsyncData
});
zcale.core.events.EventDispatcher = $hx_exports.zcale.core.events.EventDispatcher = function(instance,eventData) {
	this.instance = instance;
	this.eventData = eventData;
	this.listeners = new Array();
};
$hxClasses["zcale.core.events.EventDispatcher"] = zcale.core.events.EventDispatcher;
zcale.core.events.EventDispatcher.__name__ = ["zcale","core","events","EventDispatcher"];
zcale.core.events.EventDispatcher.prototype = {
	addListener: function(eventKey,eventListener) {
		if(this.listeners[eventKey] == null) this.listeners[eventKey] = new Array();
		this.listeners[eventKey].push(eventListener);
	}
	,removeListener: function(eventKey,eventListener) {
		if(this.listeners[eventKey] != null) HxOverrides.remove(this.listeners[eventKey],eventListener);
	}
	,removeAllListeners: function() {
		this.listeners = new Array();
	}
	,dispatch: function(eventKey) {
		if(this.listeners[eventKey] != null) {
			this.eventData.eventKey = eventKey;
			var _g = 0;
			var _g1 = this.listeners[eventKey];
			while(_g < _g1.length) {
				var eventListener = _g1[_g];
				++_g;
				eventListener(this.instance);
			}
		}
	}
	,__class__: zcale.core.events.EventDispatcher
};
zcale.core.events.AsyncDispatcher = $hx_exports.zcale.core.events.AsyncDispatcher = function(instance,eventData) {
	zcale.core.events.EventDispatcher.call(this,instance,eventData);
	this.asyncData = eventData;
	this.asyncKeys = new zcale.core.events.AsyncKeys();
	this.error = new zcale.core.events.ErrorManager(eventData);
};
$hxClasses["zcale.core.events.AsyncDispatcher"] = zcale.core.events.AsyncDispatcher;
zcale.core.events.AsyncDispatcher.__name__ = ["zcale","core","events","AsyncDispatcher"];
zcale.core.events.AsyncDispatcher.__super__ = zcale.core.events.EventDispatcher;
zcale.core.events.AsyncDispatcher.prototype = $extend(zcale.core.events.EventDispatcher.prototype,{
	dispatchError: function(eventData,instance,methodName,errorMessage) {
		if(errorMessage == null) {
			this.asyncData.error = eventData.error;
			this.error.addCrumb(instance,methodName);
		} else this.error.setError(instance,methodName,errorMessage);
		this.dispatch(this.asyncKeys.error);
	}
	,__class__: zcale.core.events.AsyncDispatcher
});
zcale.core.events.EventKeys = $hx_exports.zcale.core.events.EventKeys = function() {
	this.keys = 0;
};
$hxClasses["zcale.core.events.EventKeys"] = zcale.core.events.EventKeys;
zcale.core.events.EventKeys.__name__ = ["zcale","core","events","EventKeys"];
zcale.core.events.EventKeys.prototype = {
	assignKey: function() {
		return this.keys++;
	}
	,__class__: zcale.core.events.EventKeys
};
zcale.core.events.AsyncKeys = $hx_exports.zcale.core.events.AsyncKeys = function() {
	zcale.core.events.EventKeys.call(this);
	this.complete = this.assignKey();
	this.error = this.assignKey();
};
$hxClasses["zcale.core.events.AsyncKeys"] = zcale.core.events.AsyncKeys;
zcale.core.events.AsyncKeys.__name__ = ["zcale","core","events","AsyncKeys"];
zcale.core.events.AsyncKeys.__super__ = zcale.core.events.EventKeys;
zcale.core.events.AsyncKeys.prototype = $extend(zcale.core.events.EventKeys.prototype,{
	__class__: zcale.core.events.AsyncKeys
});
zcale.core.events.ErrorManager = function(eventData) {
	this.data = eventData;
};
$hxClasses["zcale.core.events.ErrorManager"] = zcale.core.events.ErrorManager;
zcale.core.events.ErrorManager.__name__ = ["zcale","core","events","ErrorManager"];
zcale.core.events.ErrorManager.prototype = {
	setError: function(instance,methodName,errorMessage) {
		this.data.error.classPath = Type.getClassName(Type.getClass(instance));
		this.data.error.methodName = methodName;
		this.data.error.message = Std.string(errorMessage);
		this.data.error.crumbs = new Array();
		this.data.error.crumbs.push({ classPath : this.data.error.classPath, methodName : this.data.error.methodName});
	}
	,addCrumb: function(instance,methodName) {
		var classPath = Type.getClassName(Type.getClass(instance));
		this.data.error.crumbs.push({ classPath : classPath, methodName : methodName});
	}
	,toString: function() {
		if(this.data.error.message == null) this.data.error.message = "no error message available";
		var str = "Error: " + this.data.error.message;
		var _g = 0;
		var _g1 = this.data.error.crumbs;
		while(_g < _g1.length) {
			var crumb = _g1[_g];
			++_g;
			str += "\n- " + crumb.classPath;
			if(crumb.methodName != null) str += " -> " + crumb.methodName;
		}
		return str + "\n" + (function($this) {
			var $r;
			var _this = new Date();
			$r = HxOverrides.dateStr(_this);
			return $r;
		}(this));
	}
	,__class__: zcale.core.events.ErrorManager
};
zcale.core.path = {};
zcale.core.path.targets = {};
zcale.core.path.targets.ClientPath = function() { };
$hxClasses["zcale.core.path.targets.ClientPath"] = zcale.core.path.targets.ClientPath;
zcale.core.path.targets.ClientPath.__name__ = ["zcale","core","path","targets","ClientPath"];
zcale.core.path.targets.ClientPath.get_DIR = function() {
	if(zcale.core.path.targets.ClientPath.dir == null) zcale.core.path.targets.ClientPath.dir = zcale.core.path.targets.ClientPath.get_ROOT_DIR() + zcale.PathTools.removeFrontDelimiter(zcale.core.path.targets.ClientPath.get_RELATIVE());
	return zcale.core.path.targets.ClientPath.dir;
};
zcale.core.path.targets.ClientPath.get_URL = function() {
	if(zcale.core.path.targets.ClientPath.url == null) zcale.core.path.targets.ClientPath.url = window.location.href;
	return zcale.core.path.targets.ClientPath.url;
};
zcale.core.path.targets.ClientPath.get_ROOT_URL = function() {
	if(zcale.core.path.targets.ClientPath.rootUrl == null) {
		var url = zcale.core.path.targets.ClientPath.get_URL();
		if(url.indexOf("#!") > -1) {
			var len = url.indexOf("#!") + "#!".length;
			zcale.core.path.targets.ClientPath.rootUrl = HxOverrides.substr(url,0,len);
		} else zcale.core.path.targets.ClientPath.rootUrl = zcale.core.path.targets.ClientPath.get_ROOT_DIR();
	}
	return zcale.core.path.targets.ClientPath.rootUrl;
};
zcale.core.path.targets.ClientPath.get_ROOT_DIR = function() {
	if(zcale.core.path.targets.ClientPath.rootDir == null) {
		zcale.core.path.targets.ClientPath.rootDir = window.location.protocol + "//" + window.location.host;
		zcale.core.path.targets.ClientPath.rootDir += zcale.core.path.targets.ClientPath.get_FILE_DIR();
	}
	return zcale.core.path.targets.ClientPath.rootDir;
};
zcale.core.path.targets.ClientPath.get_FILE_DIR = function() {
	if(zcale.core.path.targets.ClientPath.fileDir == null) zcale.core.path.targets.ClientPath.fileDir = window.location.pathname;
	return zcale.core.path.targets.ClientPath.fileDir;
};
zcale.core.path.targets.ClientPath.get_RELATIVE = function() {
	if(zcale.core.path.targets.ClientPath.relativePath == null) {
		zcale.core.path.targets.ClientPath.relativePath = "";
		var url = zcale.core.path.targets.ClientPath.get_URL();
		if(url.indexOf("#!") > -1) {
			var pos = url.indexOf("#!") + "#!".length;
			zcale.core.path.targets.ClientPath.relativePath = HxOverrides.substr(url,pos,null);
			if(zcale.core.path.targets.ClientPath.relativePath.indexOf("?") > -1) {
				var len = zcale.core.path.targets.ClientPath.relativePath.indexOf("?");
				zcale.core.path.targets.ClientPath.relativePath = HxOverrides.substr(zcale.core.path.targets.ClientPath.relativePath,0,len);
			}
		}
	}
	return zcale.core.path.targets.ClientPath.relativePath;
};
zcale.core.path.targets.ClientPath.get_PARAMS = function() {
	if(zcale.core.path.targets.ClientPath.params == null) {
		var map = new haxe.ds.StringMap();
		var str = HxOverrides.substr(zcale.core.path.targets.ClientPath.paramsString,1,null);
		if(str.indexOf("=") > -1) {
			var _g = 0;
			var _g1 = str.split("&");
			while(_g < _g1.length) {
				var element = _g1[_g];
				++_g;
				var name;
				var len = element.indexOf("=");
				name = HxOverrides.substr(element,0,len);
				var value;
				var pos = element.indexOf("=") + 1;
				value = HxOverrides.substr(element,pos,null);
				map.set(name,value);
			}
		}
		zcale.core.path.targets.ClientPath.params = map;
	}
	return zcale.core.path.targets.ClientPath.params;
};
zcale.core.path.targets.ClientPath.get_PARAMS_STRING = function() {
	if(zcale.core.path.targets.ClientPath.paramsString == null) {
		var str = zcale.core.path.targets.ClientPath.paramsString = "";
		var url = zcale.core.path.targets.ClientPath.get_URL();
		if(url.indexOf("#!") > -1) {
			var pos = url.indexOf("#!");
			str = HxOverrides.substr(url,pos,null);
			if(str.indexOf("?") > -1) {
				var pos1 = str.indexOf("?");
				zcale.core.path.targets.ClientPath.paramsString = HxOverrides.substr(str,pos1,null);
			}
		}
	}
	return zcale.core.path.targets.ClientPath.paramsString;
};
zcale.core.web = {};
zcale.core.web.ModuleLoader = $hx_exports.zcale.core.web.ModuleLoader = function() {
	this.modules = new Array();
	this.eventKeys = new zcale.core.events.AsyncKeys();
	this.eventData = new zcale.core.events.AsyncData();
	this.event = new zcale.core.events.AsyncDispatcher(this,this.eventData);
};
$hxClasses["zcale.core.web.ModuleLoader"] = zcale.core.web.ModuleLoader;
zcale.core.web.ModuleLoader.__name__ = ["zcale","core","web","ModuleLoader"];
zcale.core.web.ModuleLoader.__interfaces__ = [zcale.core.events.interfaces.IAsyncDispatcher];
zcale.core.web.ModuleLoader.prototype = {
	exclude: function(classPath) {
		zcale.core.web.ModuleLoader.loadedModules.push(classPath);
	}
	,load: function(moduleSequence) {
		var _g = 0;
		while(_g < moduleSequence.length) {
			var path = moduleSequence[_g];
			++_g;
			if((function($this) {
				var $r;
				var str;
				{
					var str1 = zcale.PathTools.lastElement(path,".");
					str = HxOverrides.substr(str1,0,1);
				}
				$r = new EReg("^[A-Z]+$","").match(str);
				return $r;
			}(this)) == true && path != ["zcale.Core","zcale.core"][0] && Lambda.has(zcale.core.web.ModuleLoader.loadedModules,path) == false) this.modules.push(path);
		}
		this.loadNextModule();
	}
	,loadNextModule: function() {
		if(this.modules.length > 0) {
			this.currentModule = this.modules.pop();
			this.executeModule(this.currentModule);
		} else this.event.dispatch(this.eventKeys.complete);
	}
	,executeModule: function(classPath) {
		var cls = Type.resolveClass(classPath);
		if(Type["typeof"](cls) != ValueType.TNull) {
			try {
				Reflect.callMethod(cls,Reflect.field(cls,"main"),[]);
			} catch( error ) {
			}
			zcale.core.web.ModuleLoader.loadedModules.push(classPath);
			this.loadNextModule();
		} else this.event.dispatchError(this.eventData,this,"executeModule","Class not found: " + classPath);
	}
	,onLoadComplete: function(loader) {
		loader.event.removeAllListeners();
		zcale.core.web.ModuleLoader.loadedModules.push(this.currentModule);
		this.loadNextModule();
	}
	,onLoadError: function(loader) {
		loader.event.removeAllListeners();
		this.event.dispatchError(loader.eventData,this,"load");
	}
	,__class__: zcale.core.web.ModuleLoader
};
zcale.core.web.scriptLoader = {};
zcale.core.web.scriptLoader.IScriptLoader = function() { };
$hxClasses["zcale.core.web.scriptLoader.IScriptLoader"] = zcale.core.web.scriptLoader.IScriptLoader;
zcale.core.web.scriptLoader.IScriptLoader.__name__ = ["zcale","core","web","scriptLoader","IScriptLoader"];
zcale.core.web.scriptLoader.IScriptLoader.__interfaces__ = [zcale.core.events.interfaces.IAsyncDispatcher];
zcale.core.web.scriptLoader.IScriptLoader.prototype = {
	__class__: zcale.core.web.scriptLoader.IScriptLoader
};
zcale.core.web.scriptLoader.targets = {};
zcale.core.web.scriptLoader.targets.JsScriptLoader = $hx_exports.zcale.core.web.scriptLoader.targets.JsScriptLoader = function() {
	this.eventKeys = new zcale.core.events.AsyncKeys();
	this.eventData = new zcale.core.events.AsyncData();
	this.event = new zcale.core.events.AsyncDispatcher(this,this.eventData);
};
$hxClasses["zcale.core.web.scriptLoader.targets.JsScriptLoader"] = zcale.core.web.scriptLoader.targets.JsScriptLoader;
zcale.core.web.scriptLoader.targets.JsScriptLoader.__name__ = ["zcale","core","web","scriptLoader","targets","JsScriptLoader"];
zcale.core.web.scriptLoader.targets.JsScriptLoader.__interfaces__ = [zcale.core.web.scriptLoader.IScriptLoader];
zcale.core.web.scriptLoader.targets.JsScriptLoader.prototype = {
	load: function(filePath) {
		if(Lambda.has(zcale.core.web.scriptLoader.targets.JsScriptLoader.loadedScripts,filePath) == false) {
			this.filePath = filePath;
			var script;
			script = js.Boot.__cast(window.document.createElement("script") , HTMLScriptElement);
			script.src = filePath;
			script.type = "text/javascript";
			script.onload = $bind(this,this.onLoadComplete);
			script.onerror = $bind(this,this.onLoadError);
			window.document.getElementsByTagName("head").item(0).appendChild(script);
		} else this.event.dispatch(this.eventKeys.complete);
	}
	,onLoadComplete: function(data) {
		zcale.core.web.scriptLoader.targets.JsScriptLoader.loadedScripts.push(this.filePath);
		this.event.dispatch(this.eventKeys.complete);
	}
	,onLoadError: function(errorMessage) {
		this.event.dispatchError(this.eventData,this,"load","File not found: " + this.filePath);
	}
	,__class__: zcale.core.web.scriptLoader.targets.JsScriptLoader
};
zcale.tests = {};
zcale.tests.PathTest = function() { };
$hxClasses["zcale.tests.PathTest"] = zcale.tests.PathTest;
zcale.tests.PathTest.__name__ = ["zcale","tests","PathTest"];
zcale.tests.PathTest.main = function() {
	zcale.Core.boot(zcale.tests.PathTest,function() {
		var str = "";
		str += "\n Path.DIR: " + zcale.core.path.targets.ClientPath.get_DIR();
		str += "\n Path.URL:      " + zcale.core.path.targets.ClientPath.get_URL();
		str += "\n Path.ROOT_URL:  " + zcale.core.path.targets.ClientPath.get_ROOT_URL();
		str += "\n Path.ROOT_DIR: " + zcale.core.path.targets.ClientPath.get_ROOT_DIR();
		str += "\n Path.FILE_DIR: " + zcale.core.path.targets.ClientPath.get_FILE_DIR();
		str += "\n Path.RELATIVE: " + zcale.core.path.targets.ClientPath.get_RELATIVE();
		str += "\n Path.PARAMS_STRING: " + zcale.core.path.targets.ClientPath.get_PARAMS_STRING();
		str += "\n PathTools.paramsToString( Path.PARAMS ): " + zcale.PathTools.paramsToString(zcale.core.path.targets.ClientPath.get_PARAMS());
		zcale.Core.trace(str);
	});
};
function $iterator(o) { if( o instanceof Array ) return function() { return HxOverrides.iter(o); }; return typeof(o.iterator) == 'function' ? $bind(o,o.iterator) : o.iterator; }
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
if(Array.prototype.indexOf) HxOverrides.indexOf = function(a,o,i) {
	return Array.prototype.indexOf.call(a,o,i);
};
Math.NaN = Number.NaN;
Math.NEGATIVE_INFINITY = Number.NEGATIVE_INFINITY;
Math.POSITIVE_INFINITY = Number.POSITIVE_INFINITY;
$hxClasses.Math = Math;
Math.isFinite = function(i) {
	return isFinite(i);
};
Math.isNaN = function(i1) {
	return isNaN(i1);
};
String.prototype.__class__ = $hxClasses.String = String;
String.__name__ = ["String"];
$hxClasses.Array = Array;
Array.__name__ = ["Array"];
Date.prototype.__class__ = $hxClasses.Date = Date;
Date.__name__ = ["Date"];
var Int = $hxClasses.Int = { __name__ : ["Int"]};
var Dynamic = $hxClasses.Dynamic = { __name__ : ["Dynamic"]};
var Float = $hxClasses.Float = Number;
Float.__name__ = ["Float"];
var Bool = Boolean;
Bool.__ename__ = ["Bool"];
var Class = $hxClasses.Class = { __name__ : ["Class"]};
var Enum = { };
zcale.core.path.targets.ClientPath.HASHBANG = "#!";
zcale.core.web.ModuleLoader.loadedModules = [];
zcale.core.web.scriptLoader.targets.JsScriptLoader.loadedScripts = [];
zcale.tests.PathTest.main();
})(typeof window != "undefined" ? window : exports);
