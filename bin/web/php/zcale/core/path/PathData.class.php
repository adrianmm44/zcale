<?php

class zcale_core_path_PathData {
	public function __construct() {
		;
	}
	public $url;
	public $rootUrl;
	public $fullPath;
	public $rootPath;
	public $filePath;
	public $relativePath;
	public $params;
	public $paramsString;
	public function __call($m, $a) {
		if(isset($this->$m) && is_callable($this->$m))
			return call_user_func_array($this->$m, $a);
		else if(isset($this->__dynamics[$m]) && is_callable($this->__dynamics[$m]))
			return call_user_func_array($this->__dynamics[$m], $a);
		else if('toString' == $m)
			return $this->__toString();
		else
			throw new HException('Unable to call <'.$m.'>');
	}
	function __toString() { return 'zcale.core.path.PathData'; }
}
