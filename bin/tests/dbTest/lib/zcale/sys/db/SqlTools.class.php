<?php

class zcale_sys_db_SqlTools {
	public function __construct(){}
	static function joinColumns($columns) {
		$str = "";
		{
			$_g = 0;
			while($_g < $columns->length) {
				$column = $columns[$_g];
				++$_g;
				$str .= ", " . Std::string($column);
				unset($column);
			}
		}
		return _hx_substr($str, 2, null);
	}
	static function joinValues($values) {
		$str = "";
		{
			$_g = 0;
			while($_g < $values->length) {
				$v = $values[$_g];
				++$_g;
				$str .= "," . _hx_string_or_null(zcale_sys_db_SqlTools::evalValue($v));
				unset($v);
			}
		}
		return _hx_substr($str, 1, null);
	}
	static function evalValue($v) {
		$str = null;
		if(Std::is($v, _hx_qtype("String"))) {
			$str = "'" . Std::string($v) . "'";
		} else {
			$str = Std::string($v);
		}
		return $str;
	}
	function __toString() { return 'zcale.sys.db.SqlTools'; }
}
