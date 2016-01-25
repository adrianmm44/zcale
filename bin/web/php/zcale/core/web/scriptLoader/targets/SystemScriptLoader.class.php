<?php

class zcale_core_web_scriptLoader_targets_SystemScriptLoader implements zcale_core_web_scriptLoader_IScriptLoader{
	public function __construct() {
		if(!php_Boot::$skip_constructor) {
		$this->eventKeys = new zcale_core_events_AsyncKeys();
		$this->eventData = new zcale_core_events_AsyncData();
		$this->event = new zcale_core_events_AsyncDispatcher($this, $this->eventData);
	}}
	public $filePath;
	public $eventKeys;
	public $eventData;
	public $event;
	public function load($filePath) {
		if(Lambda::has(zcale_core_web_scriptLoader_targets_SystemScriptLoader::$loadedScripts, $filePath) === false) {
			$classPath = null;
			{
				$s = zcale_PathTools::removeLastElement($filePath, null);
				$classPath = str_replace("/", ".", $s);
			}
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
				zcale_core_web_scriptLoader_targets_SystemScriptLoader::$loadedScripts->push($filePath);
				$this->event->dispatch($this->eventKeys->complete);
			} else {
				$this->event->dispatchError($this->eventData, $this, "load", "Class not found: " . _hx_string_or_null($classPath));
			}
		} else {
			$this->event->dispatch($this->eventKeys->complete);
		}
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
	static $loadedScripts;
	function __toString() { return 'zcale.core.web.scriptLoader.targets.SystemScriptLoader'; }
}
zcale_core_web_scriptLoader_targets_SystemScriptLoader::$loadedScripts = (new _hx_array(array()));
