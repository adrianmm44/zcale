<?php

class zcale_server_html_views_HtmlIndex implements zcale_core_boot_ITracer{
	public function __construct() {
		if(!php_Boot::$skip_constructor) {
		$this->traces = "";
		$this->target = 0;
		$this->html = new zcale_server_Html(null);
	}}
	public $title;
	public $target;
	public $mainFilePath;
	public $html;
	public $traces;
	public function set_title($value) {
		return $this->title = $this->html->head->title = $value;
	}
	public function setHtmlIndex() {
		$this->html->body->addFirst($this->getTraces());
	}
	public function setJsIndex() {
		$this->html->body->addFirst($this->getTraces());
		$this->html->addScript($this->mainFilePath, null);
	}
	public function setFlashIndex() {
		$this->html->head->addStyle("html, body { margin: 0px auto; padding: 0px; height: 100%; }");
		$this->html->addSwfObject($this->mainFilePath, "flashContent", "100%", "100%", null);
		$this->html->body->add("<div id=\"flashContent\"></div>");
	}
	public function setIframesIndex() {
		$iframes = new zcale_server_html_views_Iframes();
		$params = zcale_core_path_targets_ServerPath::get_PARAMS();
		$params->remove("run");
		$phpUrl = _hx_string_or_null(zcale_core_path_targets_ServerPath::get_ROOT_URL()) . _hx_string_or_null(zcale_core_path_targets_ServerPath::get_RELATIVE()) . "?" . _hx_string_or_null(zcale_PathTools::paramsToString($params));
		$jsUrl = _hx_string_or_null(zcale_core_path_targets_ServerPath::get_ROOT_URL()) . "?run=" . "js" . "&/#!" . _hx_string_or_null(zcale_core_path_targets_ServerPath::get_RELATIVE()) . "?" . _hx_string_or_null(zcale_PathTools::paramsToString($params));
		$flashUrl = _hx_string_or_null(zcale_core_path_targets_ServerPath::get_ROOT_URL()) . "?run=" . "fl" . "&/#!" . _hx_string_or_null(zcale_core_path_targets_ServerPath::get_RELATIVE()) . "?" . _hx_string_or_null(zcale_PathTools::paramsToString($params));
		$iframes->addIframe($phpUrl)->addIframe($jsUrl)->addIframe($flashUrl);
		$this->html->head->addStyle("html, body { height: 100%; }");
		$this->html->body->add($iframes->toString());
	}
	public function getTraces() {
		return "<xmp id=\"" . "traces" . "\">" . _hx_string_or_null($this->traces) . "</xmp>" . "\x0A";
	}
	public function trace($str) {
		$this->traces .= "\x0A" . Std::string($str);
	}
	public function toString() {
		$this->html->head->title = $this->title;
		if($this->target === 1 && $this->mainFilePath !== null) {
			$this->setJsIndex();
		} else {
			if($this->target === 2 && $this->mainFilePath !== null) {
				$this->setFlashIndex();
			} else {
				if($this->target === 3) {
					$this->setIframesIndex();
				} else {
					$this->setHtmlIndex();
				}
			}
		}
		return $this->html->toString();
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
	static $__properties__ = array("set_title" => "set_title");
	function __toString() { return $this->toString(); }
}
