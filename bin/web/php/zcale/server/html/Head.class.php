<?php

class zcale_server_html_Head {
	public function __construct($title = null) {
		if(!php_Boot::$skip_constructor) {
		$this->style = "";
		$this->title = $title;
	}}
	public $title;
	public $style;
	public function addStyle($str) {
		$this->style .= "\x0A\x09\x09" . _hx_string_or_null($str);
		return $this;
	}
	public function toString() {
		$html = "\x0A" . "<head>";
		if($this->title !== null) {
			$html .= "\x0A\x09" . "<title>" . _hx_string_or_null($this->title) . "</title>" . "\x0A";
		}
		$html .= "\x0A\x09" . "<meta charset=\"" . "utf-8" . "\"/>";
		if(strlen($this->style) > 0) {
			$html .= "\x0A\x0A\x09" . "<style type=\"text/css\">" . _hx_string_or_null($this->style) . "\x0A\x09" . "</style>";
		}
		return _hx_string_or_null($html) . "\x0A" . "</head>";
	}
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
	function __toString() { return $this->toString(); }
}
