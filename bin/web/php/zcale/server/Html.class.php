<?php

class zcale_server_Html {
	public function __construct($title = null) {
		if(!php_Boot::$skip_constructor) {
		$this->head = new zcale_server_html_Head($title);
		$this->body = new zcale_server_html_Body();
		$this->scripts = new _hx_array(array());
		$this->swfobjects = new _hx_array(array());
	}}
	public $head;
	public $body;
	public $scripts;
	public $swfobjects;
	public function addScript($path, $code = null) {
		if($code === null) {
			$code = "";
		}
		{
			$item = _hx_anonymous(array("path" => zcale_PathTools::removeFrontDelimiter($path, null), "code" => $code));
			$this->scripts->push($item);
		}
		return $this;
	}
	public function addSwfObject($path, $id, $width, $height, $flashvars = null) {
		{
			$item = _hx_anonymous(array("path" => $path, "id" => $id, "width" => Std::string($width), "height" => Std::string($height), "flashvars" => $flashvars));
			$this->swfobjects->push($item);
		}
		return $this;
	}
	public function toString() {
		$html = "<!DOCTYPE html>";
		$html .= "\x0A" . "<html lang=\"" . "en" . "\">";
		$html .= _hx_string_or_null($this->head->toString());
		{
			$_g = 0;
			$_g1 = $this->scripts;
			while($_g < $_g1->length) {
				$script = $_g1[$_g];
				++$_g;
				if($script->path !== null) {
					$this->body->add("<script type=\"text/javascript\" src=\"" . _hx_string_or_null($script->path) . "\"></script>");
				} else {
					$this->body->add("<script type=\"text/javascript\">" . _hx_string_or_null($script->code) . "</script>");
				}
				unset($script);
			}
		}
		if($this->swfobjects->length > 0) {
			$this->body->add("<script type=\"text/javascript\" src=\"" . "/js" . "swfobject.js\"></script>");
			$this->body->add("<script type=\"text/javascript\">");
			{
				$_g2 = 0;
				$_g11 = $this->swfobjects;
				while($_g2 < $_g11->length) {
					$swfobject = $_g11[$_g2];
					++$_g2;
					$this->body->add("\x09" . "swfobject.embedSWF(\"" . _hx_string_or_null($swfobject->path) . "\", \"" . _hx_string_or_null($swfobject->id) . "\", \"" . _hx_string_or_null($swfobject->width) . "\", \"" . _hx_string_or_null($swfobject->height) . "\", \"" . "9" . "\", \"" . "/swf" . "expressInstall.swf\", " . _hx_string_or_null(haxe_Json::phpJsonEncode($swfobject->flashvars, null, null)) . " );");
					unset($swfobject);
				}
			}
			$this->body->add("</script>");
		}
		$html .= _hx_string_or_null($this->body->toString());
		$html .= "\x0A" . "</html>";
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
