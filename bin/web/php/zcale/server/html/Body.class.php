<?php

class zcale_server_html_Body {
	public function __construct() {
		if(!php_Boot::$skip_constructor) {
		$this->content = "";
	}}
	public $content;
	public function add($html) {
		$this->content .= "\x0A\x09" . _hx_string_or_null($html);
		return $this;
	}
	public function addFirst($html) {
		$this->content = "\x0A\x09" . _hx_string_or_null($html) . _hx_string_or_null($this->content);
		return $this;
	}
	public function toString() {
		$html = "\x0A" . "<body>";
		$html .= _hx_string_or_null($this->content);
		$html .= "\x0A" . "</body>";
		return $html;
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
