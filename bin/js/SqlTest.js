(function () { "use strict";
var HxOverrides = function() { };
HxOverrides.__name__ = true;
HxOverrides.substr = function(s,pos,len) {
	if(pos != null && pos != 0 && len != null && len < 0) return "";
	if(len == null) len = s.length;
	if(pos < 0) {
		pos = s.length + pos;
		if(pos < 0) pos = 0;
	} else if(len < 0) len = s.length + len - pos;
	return s.substr(pos,len);
};
var Std = function() { };
Std.__name__ = true;
Std.string = function(s) {
	return js.Boot.__string_rec(s,"");
};
var js = {};
js.Boot = function() { };
js.Boot.__name__ = true;
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
var zcale = {};
zcale.sys = {};
zcale.sys.db = {};
zcale.sys.db.Sql = function() { };
zcale.sys.db.Sql.__name__ = true;
zcale.sys.db.SqlTools = function() { };
zcale.sys.db.SqlTools.__name__ = true;
zcale.sys.db.SqlTools.joinColumns = function(columns) {
	var str = "";
	var _g = 0;
	while(_g < columns.length) {
		var column = columns[_g];
		++_g;
		str += ", " + Std.string(column);
	}
	return HxOverrides.substr(str,2,null);
};
zcale.sys.db.SqlTools.joinValues = function(values) {
	var str = "";
	var _g = 0;
	while(_g < values.length) {
		var v = values[_g];
		++_g;
		str += "," + zcale.sys.db.SqlTools.evalValue(v);
	}
	return HxOverrides.substr(str,1,null);
};
zcale.sys.db.SqlTools.evalValue = function(v) {
	var str;
	if(typeof(v) == "string") str = "'" + Std.string(v) + "'"; else str = Std.string(v);
	return str;
};
zcale.sys.db._Sql = {};
zcale.sys.db._Sql.MainOperation_Impl_ = function() { };
zcale.sys.db._Sql.MainOperation_Impl_.__name__ = true;
zcale.sys.db._Sql.MainOperation_Impl_.insert = function(this1,table,columns) {
	var str = "INSERT INTO " + Std.string(table);
	if(columns != null) str += " (" + zcale.sys.db.SqlTools.joinColumns(columns) + ")";
	return str;
};
zcale.sys.db._Sql.SelectOperation_Impl_ = function() { };
zcale.sys.db._Sql.SelectOperation_Impl_.__name__ = true;
zcale.sys.db._Sql.Select3_Impl_ = function() { };
zcale.sys.db._Sql.Select3_Impl_.__name__ = true;
zcale.sys.db._Sql.Operator_Impl_ = function() { };
zcale.sys.db._Sql.Operator_Impl_.__name__ = true;
zcale.sys.db._Sql.Pattern_Impl_ = function() { };
zcale.sys.db._Sql.Pattern_Impl_.__name__ = true;
zcale.sys.db.tests = {};
zcale.sys.db.tests.SqlTest = function() { };
zcale.sys.db.tests.SqlTest.__name__ = true;
zcale.sys.db.tests.SqlTest.main = function() {
	console.log((function($this) {
		var $r;
		var str = "CREATE" + " DATABASE " + "db";
		$r = str;
		return $r;
	}(this)));
	console.log((function($this) {
		var $r;
		var str1 = "" + "SELECT *" + " FROM " + "table";
		$r = str1;
		return $r;
	}(this)));
	console.log((function($this) {
		var $r;
		var this1;
		{
			var str2 = "" + "SELECT " + zcale.sys.db.SqlTools.joinColumns(["column1","column2"]);
			this1 = str2;
		}
		$r = (function($this) {
			var $r;
			var str3 = this1 + " FROM " + "table";
			$r = str3;
			return $r;
		}($this));
		return $r;
	}(this)));
	console.log((function($this) {
		var $r;
		var this2;
		{
			var str4 = "" + "SELECT DISTINCT " + zcale.sys.db.SqlTools.joinColumns(["column1","column2"]);
			this2 = str4;
		}
		$r = (function($this) {
			var $r;
			var str5 = this2 + " FROM " + "table";
			$r = str5;
			return $r;
		}($this));
		return $r;
	}(this)));
	console.log((function($this) {
		var $r;
		var this3;
		{
			var str6;
			str6 = (function($this) {
				var $r;
				var str7;
				str7 = (function($this) {
					var $r;
					var str8 = "" + "SELECT *" + " FROM " + "table";
					$r = str8;
					return $r;
				}($this)) + " WHERE " + "column";
				$r = str7;
				return $r;
			}($this)) + "=" + zcale.sys.db.SqlTools.evalValue("value");
			this3 = str6;
		}
		$r = this3;
		return $r;
	}(this)));
	console.log((function($this) {
		var $r;
		var this4;
		{
			var str9;
			str9 = (function($this) {
				var $r;
				var str10;
				str10 = (function($this) {
					var $r;
					var str11 = "" + "SELECT *" + " FROM " + "table";
					$r = str11;
					return $r;
				}($this)) + " WHERE " + "column";
				$r = str10;
				return $r;
			}($this)) + " IN (" + zcale.sys.db.SqlTools.joinValues([1,2,3]) + ")";
			this4 = str9;
		}
		$r = this4;
		return $r;
	}(this)));
	console.log((function($this) {
		var $r;
		var this5;
		{
			var this6;
			var this7;
			var this8;
			var this9;
			var str12;
			str12 = (function($this) {
				var $r;
				var str13;
				str13 = (function($this) {
					var $r;
					var str14 = "" + "SELECT *" + " FROM " + "table";
					$r = str14;
					return $r;
				}($this)) + " WHERE " + "column1";
				$r = str13;
				return $r;
			}($this)) + "=" + zcale.sys.db.SqlTools.evalValue("value1");
			this9 = str12;
			var str15 = this9 + " AND " + "column2";
			this8 = str15;
			var str16 = this8 + "=" + zcale.sys.db.SqlTools.evalValue("value2");
			this7 = str16;
			var str17 = this7 + " OR " + "column3";
			this6 = str17;
			var str18 = this6 + "=" + zcale.sys.db.SqlTools.evalValue("value3");
			this5 = str18;
		}
		$r = this5;
		return $r;
	}(this)));
	console.log((function($this) {
		var $r;
		var this10;
		{
			var this11;
			var this12;
			var str19 = Std.string((function($this) {
				var $r;
				var str20 = "" + "SELECT *" + " FROM " + "table";
				$r = str20;
				return $r;
			}($this))) + " ORDER BY ";
			this12 = str19;
			var str21 = Std.string(this12 + "column1") + " ASC";
			this11 = str21;
			var str22 = this11 + ", " + "solumn2" + " DESC";
			this10 = str22;
		}
		$r = this10;
		return $r;
	}(this)));
	console.log((function($this) {
		var $r;
		var this13;
		{
			var this14 = zcale.sys.db._Sql.MainOperation_Impl_.insert("","table",["column1","column2","column3"]);
			var str23 = this14 + " VALUES (" + zcale.sys.db.SqlTools.joinValues(["value1","value2","value3"]) + ")";
			this13 = str23;
		}
		$r = this13;
		return $r;
	}(this)));
	console.log((function($this) {
		var $r;
		var this15;
		{
			var this16;
			var this17;
			var this18;
			var str24;
			str24 = (function($this) {
				var $r;
				var str25 = "UPDATE " + "table";
				$r = str25;
				return $r;
			}($this)) + " SET " + "column1" + "=" + zcale.sys.db.SqlTools.evalValue("value1");
			this18 = str24;
			var str26 = Std.string(this18) + "," + "column2" + "=" + zcale.sys.db.SqlTools.evalValue("value2");
			this17 = str26;
			var str27 = this17 + " WHERE " + "column";
			this16 = str27;
			var str28 = this16 + "=" + zcale.sys.db.SqlTools.evalValue("value");
			this15 = str28;
		}
		$r = this15;
		return $r;
	}(this)));
	console.log((function($this) {
		var $r;
		var this19;
		{
			var str29;
			str29 = (function($this) {
				var $r;
				var str30;
				str30 = (function($this) {
					var $r;
					var str31 = "DELETE" + " FROM " + "table";
					$r = str31;
					return $r;
				}($this)) + " WHERE " + "column";
				$r = str30;
				return $r;
			}($this)) + "=" + zcale.sys.db.SqlTools.evalValue("value");
			this19 = str29;
		}
		$r = this19;
		return $r;
	}(this)));
	console.log((function($this) {
		var $r;
		var str32 = "DELETE *" + " FROM " + "table";
		$r = str32;
		return $r;
	}(this)));
	console.log((function($this) {
		var $r;
		var str33;
		str33 = (function($this) {
			var $r;
			var str34 = "" + "SELECT *" + " FROM " + "table";
			$r = str34;
			return $r;
		}($this)) + " WHERE " + "column";
		$r = str33;
		return $r;
	}(this)) + " LIKE " + "'%" + "something" + "%'");
	console.log((function($this) {
		var $r;
		var str35;
		str35 = (function($this) {
			var $r;
			var str36 = "" + "SELECT *" + " FROM " + "table";
			$r = str36;
			return $r;
		}($this)) + " WHERE " + "column";
		$r = str35;
		return $r;
	}(this)) + " LIKE " + "'" + ("" + "[" + "a-c" + "]" + "%") + "'");
	console.log((function($this) {
		var $r;
		var str37;
		str37 = (function($this) {
			var $r;
			var str38 = "" + "SELECT *" + " FROM " + "table";
			$r = str38;
			return $r;
		}($this)) + " WHERE " + "column";
		$r = str37;
		return $r;
	}(this)) + " LIKE " + "'" + ("" + "L_n_on") + "'");
	console.log((function($this) {
		var $r;
		var str39;
		str39 = (function($this) {
			var $r;
			var str40 = "" + "SELECT *" + " FROM " + "table";
			$r = str40;
			return $r;
		}($this)) + " WHERE " + "column";
		$r = str39;
		return $r;
	}(this)) + " LIKE " + "'" + ("" + "L" + "_" + "n" + "_" + "on") + "'");
	console.log((function($this) {
		var $r;
		var this20;
		{
			var str41;
			str41 = (function($this) {
				var $r;
				var str42;
				str42 = (function($this) {
					var $r;
					var str43 = "" + "SELECT *" + " FROM " + "table";
					$r = str43;
					return $r;
				}($this)) + " WHERE " + "column";
				$r = str42;
				return $r;
			}($this)) + " BETWEEN " + zcale.sys.db.SqlTools.evalValue(10) + " AND " + zcale.sys.db.SqlTools.evalValue(20) + ")";
			this20 = str41;
		}
		$r = this20;
		return $r;
	}(this)));
	console.log((function($this) {
		var $r;
		var this21;
		{
			var this22;
			var this23;
			var this24;
			var str44 = "" + "SELECT " + zcale.sys.db.SqlTools.joinColumns(["t1.column1","t1.column2","t2.column1"]);
			this24 = str44;
			var str45 = this24 + " FROM " + "table1";
			this23 = str45;
			var str46 = Std.string(this23) + " AS " + "t1";
			this22 = str46;
			var str47 = Std.string(this22) + ", " + "table2";
			this21 = str47;
		}
		$r = (function($this) {
			var $r;
			var str48 = Std.string(this21) + " AS " + "t2";
			$r = str48;
			return $r;
		}($this));
		return $r;
	}(this)));
	console.log((function($this) {
		var $r;
		var this25;
		{
			var this26;
			var this27;
			var this28;
			var str49 = "" + "SELECT " + zcale.sys.db.SqlTools.joinColumns(["table1.column1","table1.column2","table2.column1"]);
			this28 = str49;
			var str50 = this28 + " FROM " + "table1";
			this27 = str50;
			this26 = this27;
			var str51 = this26 + " INNER JOIN " + "table2";
			this25 = str51;
		}
		$r = (function($this) {
			var $r;
			var str52 = this25 + " ON " + "table1.table2_id" + "=" + "table2.table2_id";
			$r = str52;
			return $r;
		}($this));
		return $r;
	}(this)));
	console.log((function($this) {
		var $r;
		var this29;
		{
			var this30;
			var this31;
			var this32;
			var str53 = "" + "SELECT " + zcale.sys.db.SqlTools.joinColumns(["column1","column2"]);
			this32 = str53;
			var str54 = this32 + " FROM " + "table1";
			this31 = str54;
			var str55 = Std.string(this31) + " UNION ";
			this30 = str55;
			var str56 = this30 + "SELECT " + zcale.sys.db.SqlTools.joinColumns(["column1","column2"]);
			this29 = str56;
		}
		$r = (function($this) {
			var $r;
			var str57 = this29 + " FROM " + "table2";
			$r = str57;
			return $r;
		}($this));
		return $r;
	}(this)));
};
String.__name__ = true;
Array.__name__ = true;
zcale.sys.db.tests.SqlTest.main();
})();
