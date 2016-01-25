<?php

class zcale_sys_db__Sql_MainOperation_Impl_ {
	public function __construct(){}
	static function insert($this1, $table, $columns = null) {
		$str = "INSERT INTO " . Std::string($table);
		if($columns !== null) {
			$str .= " (" . _hx_string_or_null(zcale_sys_db_SqlTools::joinColumns($columns)) . ")";
		}
		return $str;
	}
	function __toString() { return 'zcale.sys.db._Sql.MainOperation_Impl_'; }
}
