<?php

class sys_net_Host {
	public function __construct(){}
	static function localhost() {
		return $_SERVER["HTTP_HOST"];
	}
	function __toString() { return 'sys.net.Host'; }
}
