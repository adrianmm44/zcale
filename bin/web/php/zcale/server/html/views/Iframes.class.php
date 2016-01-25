<?php

class zcale_server_html_views_Iframes {
	public function __construct() {
		if(!php_Boot::$skip_constructor) {
		$this->iframes = new _hx_array(array());
	}}
	public $iframes;
	public function addIframe($url) {
		$this->iframes->push($url);
		return $this;
	}
	public function toString() {
		$html = "";
		$width = Math::floor(100 / $this->iframes->length) - 1;
		{
			$_g = 0;
			$_g1 = $this->iframes;
			while($_g < $_g1->length) {
				$iframeUrl = $_g1[$_g];
				++$_g;
				$html .= "\x0A\x09" . "<iframe src=\"" . _hx_string_or_null($iframeUrl) . "\" style=\"width:" . Std::string($width) . "%; height:100%; margin:0px; padding:0px; border:1px solid;\"></iframe>";
				unset($iframeUrl);
			}
		}
		return ltrim($html);
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
