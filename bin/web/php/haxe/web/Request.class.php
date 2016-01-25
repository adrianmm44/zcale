<?php

class haxe_web_Request {
	public function __construct(){}
	static function getParams() {
		return php_Web::getParams();
	}
	static function getURI() {
		return php_Web::getURI();
	}
	function __toString() { return 'haxe.web.Request'; }
}
