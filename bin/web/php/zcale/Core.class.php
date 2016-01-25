<?php

class zcale_Core {
	public function __construct(){}
	static $bootstrap;
	static function boot($mainClass, $onComplete, $onError = null) {
		zcale_Core::$bootstrap = zcale_core_boot_targets_ServerBoot::getInstance();
		zcale_Core::$bootstrap->event->addListener(zcale_Core::$bootstrap->eventKeys->complete, array(new _hx_lambda(array(&$mainClass, &$onComplete, &$onError), "zcale_Core_0"), 'execute'));
		zcale_Core::$bootstrap->event->addListener(zcale_Core::$bootstrap->eventKeys->error, array(new _hx_lambda(array(&$mainClass, &$onComplete, &$onError), "zcale_Core_1"), 'execute'));
		zcale_Core::$bootstrap->boot($mainClass);
	}
	static function bootModules($mainClass, $modules, $onComplete, $onError = null) {
		zcale_Core::boot($mainClass, array(new _hx_lambda(array(&$mainClass, &$modules, &$onComplete, &$onError), "zcale_Core_2"), 'execute'), array(new _hx_lambda(array(&$mainClass, &$modules, &$onComplete, &$onError), "zcale_Core_3"), 'execute'));
	}
	static function trace($str) {
		zcale_Core::$bootstrap->trace($str);
	}
	function __toString() { return 'zcale.Core'; }
}
function zcale_Core_0(&$mainClass, &$onComplete, &$onError, $cls) {
	{
		zcale_Core::$bootstrap->event->removeAllListeners();
		call_user_func($onComplete);
	}
}
function zcale_Core_1(&$mainClass, &$onComplete, &$onError, $cls1) {
	{
		zcale_Core::$bootstrap->event->removeAllListeners();
		call_user_func_array($onError, array($cls1->event->error->toString()));
	}
}
function zcale_Core_2(&$mainClass, &$modules, &$onComplete, &$onError) {
	{
		$loader = new zcale_core_web_ModuleLoader();
		$loader->exclude($modules[0]);
		$loader->event->addListener($loader->eventKeys->complete, array(new _hx_lambda(array(&$loader, &$mainClass, &$modules, &$onComplete, &$onError), "zcale_Core_4"), 'execute'));
		$loader->event->addListener($loader->eventKeys->error, array(new _hx_lambda(array(&$loader, &$mainClass, &$modules, &$onComplete, &$onError), "zcale_Core_5"), 'execute'));
		$loader->load($modules);
	}
}
function zcale_Core_3(&$mainClass, &$modules, &$onComplete, &$onError, $errorMessage) {
	{
		if($onError !== null) {
			call_user_func_array($onError, array($errorMessage));
		}
	}
}
function zcale_Core_4(&$loader, &$mainClass, &$modules, &$onComplete, &$onError, $cls) {
	{
		$loader->event->removeAllListeners();
		call_user_func($onComplete);
	}
}
function zcale_Core_5(&$loader, &$mainClass, &$modules, &$onComplete, &$onError, $cls1) {
	{
		$loader->event->removeAllListeners();
		if($onError !== null) {
			call_user_func_array($onError, array($loader->event->error->toString()));
		}
	}
}
