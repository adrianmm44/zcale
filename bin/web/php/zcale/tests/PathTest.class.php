<?php

class zcale_tests_PathTest {
	public function __construct(){}
	static function main() {
		zcale_Core::boot(_hx_qtype("zcale.tests.PathTest"), array(new _hx_lambda(array(), "zcale_tests_PathTest_0"), 'execute'), null);
	}
	function __toString() { return 'zcale.tests.PathTest'; }
}
function zcale_tests_PathTest_0() {
	{
		$str = "";
		$str .= "\x0A Path.DIR: " . _hx_string_or_null(zcale_core_path_targets_ServerPath::get_DIR());
		$str .= "\x0A Path.URL:      " . _hx_string_or_null(zcale_core_path_targets_ServerPath::get_URL());
		$str .= "\x0A Path.ROOT_URL:  " . _hx_string_or_null(zcale_core_path_targets_ServerPath::get_ROOT_URL());
		$str .= "\x0A Path.ROOT_DIR: " . _hx_string_or_null(zcale_core_path_targets_ServerPath::get_ROOT_DIR());
		$str .= "\x0A Path.FILE_DIR: " . _hx_string_or_null(zcale_core_path_targets_ServerPath::get_FILE_DIR());
		$str .= "\x0A Path.RELATIVE: " . _hx_string_or_null(zcale_core_path_targets_ServerPath::get_RELATIVE());
		$str .= "\x0A Path.PARAMS_STRING: " . _hx_string_or_null(zcale_core_path_targets_ServerPath::get_PARAMS_STRING());
		$str .= "\x0A PathTools.paramsToString( Path.PARAMS ): " . _hx_string_or_null(zcale_PathTools::paramsToString(zcale_core_path_targets_ServerPath::get_PARAMS()));
		zcale_Core::trace($str);
	}
}
