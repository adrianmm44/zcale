<?php

class zcale_core_path_targets_ServerPath {
	public function __construct(){}
	static $dir;
	static $url;
	static $rootUrl;
	static $rootDir;
	static $fileDir;
	static $relativePath;
	static $params;
	static $paramsString;
	static function get_DIR() {
		if(zcale_core_path_targets_ServerPath::$dir === null) {
			zcale_core_path_targets_ServerPath::$dir = _hx_string_or_null(zcale_core_path_targets_ServerPath::get_ROOT_DIR()) . _hx_string_or_null(zcale_core_path_targets_ServerPath::get_RELATIVE());
		}
		return zcale_core_path_targets_ServerPath::$dir;
	}
	static function get_URL() {
		if(zcale_core_path_targets_ServerPath::$url === null) {
			zcale_core_path_targets_ServerPath::$url = _hx_string_or_null(zcale_core_path_targets_ServerPath::get_ROOT_URL()) . _hx_string_or_null(zcale_core_path_targets_ServerPath::get_RELATIVE()) . _hx_string_or_null(zcale_core_path_targets_ServerPath::get_PARAMS_STRING());
		}
		return zcale_core_path_targets_ServerPath::$url;
	}
	static function get_ROOT_URL() {
		if(zcale_core_path_targets_ServerPath::$rootUrl === null) {
			$protocol = "http://";
			$localhost = sys_net_Host::localhost();
			$protocol = $_SERVER["SERVER_PROTOCOL"];
			$protocol = _hx_string_or_null(strtolower(_hx_substr($protocol, 0, _hx_index_of($protocol, "/", null)))) . "://";
			zcale_core_path_targets_ServerPath::$rootUrl = _hx_string_or_null($protocol) . _hx_string_or_null($localhost) . _hx_string_or_null(zcale_core_path_targets_ServerPath::get_FILE_DIR());
		}
		return zcale_core_path_targets_ServerPath::$rootUrl;
	}
	static function get_ROOT_DIR() {
		if(zcale_core_path_targets_ServerPath::$rootDir === null) {
			zcale_core_path_targets_ServerPath::$rootDir = zcale_PathTools::removeEndDelimiter(Sys::getCwd(), null);
		}
		return zcale_core_path_targets_ServerPath::$rootDir;
	}
	static function get_FILE_DIR() {
		if(zcale_core_path_targets_ServerPath::$fileDir === null) {
			zcale_core_path_targets_ServerPath::$fileDir = _hx_substr(zcale_core_path_targets_ServerPath::get_ROOT_DIR(), strlen($_SERVER["DOCUMENT_ROOT"]), null);
		}
		return zcale_core_path_targets_ServerPath::$fileDir;
	}
	static function get_RELATIVE() {
		if(zcale_core_path_targets_ServerPath::$relativePath === null) {
			zcale_core_path_targets_ServerPath::$relativePath = haxe_web_Request::getURI();
			zcale_core_path_targets_ServerPath::$relativePath = _hx_substr(zcale_core_path_targets_ServerPath::$relativePath, strlen(zcale_core_path_targets_ServerPath::get_FILE_DIR()), null);
		}
		return zcale_core_path_targets_ServerPath::$relativePath;
	}
	static function get_PARAMS() {
		if(zcale_core_path_targets_ServerPath::$params === null) {
			zcale_core_path_targets_ServerPath::$params = haxe_web_Request::getParams();
		}
		return zcale_core_path_targets_ServerPath::$params;
	}
	static function get_PARAMS_STRING() {
		if(zcale_core_path_targets_ServerPath::$paramsString === null) {
			zcale_core_path_targets_ServerPath::$paramsString = php_Web::getParamsString();
			if(strlen(zcale_core_path_targets_ServerPath::$paramsString) > 0) {
				zcale_core_path_targets_ServerPath::$paramsString = "?" . _hx_string_or_null(zcale_core_path_targets_ServerPath::$paramsString);
			}
		}
		return zcale_core_path_targets_ServerPath::$paramsString;
	}
	static $__properties__ = array("get_PARAMS_STRING" => "get_PARAMS_STRING","get_PARAMS" => "get_PARAMS","get_RELATIVE" => "get_RELATIVE","get_FILE_DIR" => "get_FILE_DIR","get_ROOT_DIR" => "get_ROOT_DIR","get_ROOT_URL" => "get_ROOT_URL","get_URL" => "get_URL","get_DIR" => "get_DIR");
	function __toString() { return 'zcale.core.path.targets.ServerPath'; }
}
