<?php

class zcale_PathTools {
	public function __construct(){}
	static function firstElement($path, $delimiter = null) {
		if($delimiter === null) {
			$delimiter = "/";
		}
		$path = zcale_PathTools::removeFrontDelimiter($path, $delimiter);
		if(_hx_index_of($path, $delimiter, null) > -1) {
			$path = _hx_substr($path, 0, _hx_index_of($path, $delimiter, null));
		}
		return $path;
	}
	static function lastElement($path, $delimiter = null) {
		if($delimiter === null) {
			$delimiter = "/";
		}
		$path = zcale_PathTools::removeEndDelimiter($path, $delimiter);
		return _hx_substr($path, _hx_last_index_of($path, $delimiter, null) + 1, null);
	}
	static function removeFirstElement($path, $delimiter = null) {
		if($delimiter === null) {
			$delimiter = "/";
		}
		$path = zcale_PathTools::removeFrontDelimiter($path, $delimiter);
		if(_hx_index_of($path, $delimiter, null) > -1) {
			$path = _hx_substr($path, _hx_index_of($path, $delimiter, null), null);
			if($path === $delimiter) {
				$path = "";
			}
		} else {
			if(strlen($path) > 0) {
				$path = "";
			}
		}
		return $path;
	}
	static function removeLastElement($path, $delimiter = null) {
		if($delimiter === null) {
			$delimiter = "/";
		}
		$path = zcale_PathTools::removeEndDelimiter($path, $delimiter);
		if(_hx_index_of($path, $delimiter, null) > -1) {
			$path = _hx_substr($path, 0, _hx_last_index_of($path, $delimiter, null));
		} else {
			if(strlen($path) > 0) {
				$path = "";
			}
		}
		return $path;
	}
	static function removeFrontDelimiter($path, $delimiter = null) {
		if($delimiter === null) {
			$delimiter = "/";
		}
		if(_hx_substr($path, 0, 1) === $delimiter) {
			$path = _hx_substr($path, 1, null);
		}
		return $path;
	}
	static function removeEndDelimiter($path, $delimiter = null) {
		if($delimiter === null) {
			$delimiter = "/";
		}
		if(_hx_substr($path, -1, null) === $delimiter) {
			$path = _hx_substr($path, 0, -1);
		}
		return $path;
	}
	static function hasExtension($path, $delimiter = null) {
		if($delimiter === null) {
			$delimiter = "/";
		}
		$source = zcale_PathTools::lastElement($path, $delimiter);
		return _hx_index_of($source, ".", null) > -1;
	}
	static function removeExtension($path, $delimiter = null) {
		if($delimiter === null) {
			$delimiter = "/";
		}
		if(zcale_PathTools::hasExtension($path, $delimiter)) {
			$path = _hx_substr($path, 0, _hx_last_index_of($path, ".", null));
		}
		return $path;
	}
	static function splitPath($path, $delimiter = null) {
		if($delimiter === null) {
			$delimiter = "/";
		}
		$path = zcale_PathTools::removeFrontDelimiter($path, $delimiter);
		$path = zcale_PathTools::removeEndDelimiter($path, $delimiter);
		return _hx_explode($delimiter, $path);
	}
	static function joinPath($array, $delimiter = null) {
		if($delimiter === null) {
			$delimiter = "/";
		}
		$path = $array->join($delimiter);
		if(strlen($path) > 0) {
			$path = _hx_string_or_null($delimiter) . _hx_string_or_null($path);
		}
		return $path;
	}
	static function cleanPath($path, $delimiter = null) {
		if($delimiter === null) {
			$delimiter = "/";
		}
		$doubleDelimiter = _hx_string_or_null($delimiter) . _hx_string_or_null($delimiter);
		while(_hx_index_of($path, $doubleDelimiter, null) > -1) {
			if($doubleDelimiter === "") {
				$path = implode(str_split ($path), $delimiter);
			} else {
				$path = str_replace($doubleDelimiter, $delimiter, $path);
			}
		}
		return $path;
	}
	static function paramsToString($params) {
		$str = "";
		if(null == $params) throw new HException('null iterable');
		$__hx__it = $params->keys();
		while($__hx__it->hasNext()) {
			$key = $__hx__it->next();
			$str .= _hx_string_or_null($key) . "=" . _hx_string_or_null($params->get($key)) . "&";
		}
		if(strlen($str) > 0) {
			$str = _hx_substr($str, 0, -1);
		}
		return $str;
	}
	function __toString() { return 'zcale.PathTools'; }
}
