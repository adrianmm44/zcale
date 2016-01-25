<?php

class zcale_core_web_ModuleLoader implements zcale_core_events_interfaces_IAsyncDispatcher{
	public function __construct() {
		if(!php_Boot::$skip_constructor) {
		$this->modules = new _hx_array(array());
		$this->eventKeys = new zcale_core_events_AsyncKeys();
		$this->eventData = new zcale_core_events_AsyncData();
		$this->event = new zcale_core_events_AsyncDispatcher($this, $this->eventData);
	}}
	public $modules;
	public $currentModule;
	public $eventKeys;
	public $eventData;
	public $event;
	public function exclude($classPath) {
		zcale_core_web_ModuleLoader::$loadedModules->push($classPath);
	}
	public function load($moduleSequence) {
		{
			$_g = 0;
			while($_g < $moduleSequence->length) {
				$path = $moduleSequence[$_g];
				++$_g;
				if(zcale_core_web_ModuleLoader_0($this, $_g, $moduleSequence, $path) === true && $path !== _hx_array_get((new _hx_array(array("zcale.Core", "zcale.core"))), 0) && Lambda::has(zcale_core_web_ModuleLoader::$loadedModules, $path) === false) {
					$this->modules->push($path);
				}
				unset($path);
			}
		}
		$this->loadNextModule();
	}
	public function loadNextModule() {
		if($this->modules->length > 0) {
			$this->currentModule = $this->modules->pop();
			$this->executeModule($this->currentModule);
		} else {
			$this->event->dispatch($this->eventKeys->complete);
		}
	}
	public function executeModule($classPath) {
		$cls = Type::resolveClass($classPath);
		if((is_object($_t = Type::typeof($cls)) && !($_t instanceof Enum) ? $_t !== ValueType::$TNull : $_t != ValueType::$TNull)) {
			try {
				Reflect::callMethod($cls, Reflect::field($cls, "main"), (new _hx_array(array())));
			}catch(Exception $__hx__e) {
				$_ex_ = ($__hx__e instanceof HException) ? $__hx__e->e : $__hx__e;
				$error = $_ex_;
				{
				}
			}
			zcale_core_web_ModuleLoader::$loadedModules->push($classPath);
			$this->loadNextModule();
		} else {
			$this->event->dispatchError($this->eventData, $this, "executeModule", "Class not found: " . _hx_string_or_null($classPath));
		}
	}
	public function onLoadComplete($loader) {
		$loader->event->removeAllListeners();
		zcale_core_web_ModuleLoader::$loadedModules->push($this->currentModule);
		$this->loadNextModule();
	}
	public function onLoadError($loader) {
		$loader->event->removeAllListeners();
		$this->event->dispatchError($loader->eventData, $this, "load", null);
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
	static $loadedModules;
	function __toString() { return 'zcale.core.web.ModuleLoader'; }
}
zcale_core_web_ModuleLoader::$loadedModules = (new _hx_array(array()));
function zcale_core_web_ModuleLoader_0(&$__hx__this, &$_g, &$moduleSequence, &$path) {
	{
		$str = null;
		{
			$str1 = zcale_PathTools::lastElement($path, ".");
			$str = _hx_substr($str1, 0, 1);
		}
		return _hx_deref(new EReg("^[A-Z]+\$", ""))->match($str);
	}
}
