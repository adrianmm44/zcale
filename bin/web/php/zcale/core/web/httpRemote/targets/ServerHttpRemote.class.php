<?php

class zcale_core_web_httpRemote_targets_ServerHttpRemote implements zcale_core_web_httpRemote_IHttpRemote{
	public function __construct($eventData) {
		if(!php_Boot::$skip_constructor) {
		$this->eventData = $eventData;
		$this->eventKeys = new zcale_core_events_AsyncKeys();
		$this->event = new zcale_core_events_AsyncDispatcher($this, $eventData);
	}}
	public $eventData;
	public $eventKeys;
	public $event;
	public function call($classPath, $methodName, $args) {
		$cls = null;
		$errorMessage = "";
		try {
			$cls = Type::createInstance(Type::resolveClass($classPath), (new _hx_array(array())));
			$cls->event->addListener($cls->eventKeys->complete, (isset($this->onCallComplete) ? $this->onCallComplete: array($this, "onCallComplete")));
			$cls->event->addListener($cls->eventKeys->error, (isset($this->onCallError) ? $this->onCallError: array($this, "onCallError")));
			try {
				Reflect::callMethod($cls, Reflect::field($cls, $methodName), $args);
			}catch(Exception $__hx__e) {
				$_ex_ = ($__hx__e instanceof HException) ? $__hx__e->e : $__hx__e;
				$error = $_ex_;
				{
					$errorMessage = "Call method " . _hx_string_or_null($methodName) . " failed in " . _hx_string_or_null($classPath);
				}
			}
		}catch(Exception $__hx__e) {
			$_ex_ = ($__hx__e instanceof HException) ? $__hx__e->e : $__hx__e;
			$error1 = $_ex_;
			{
				$errorMessage = "Not found class " . _hx_string_or_null($classPath);
			}
		}
		if(strlen($errorMessage) > 0) {
			$this->event->dispatchError($this->eventData, $this, "call", $errorMessage);
		}
	}
	public function onCallComplete($cls) {
		$this->eventData = $cls->eventData;
		$this->event->dispatch($this->eventKeys->complete);
	}
	public function onCallError($cls) {
		$this->event->dispatchError($cls->eventData, $this, "call", null);
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
	function __toString() { return 'zcale.core.web.httpRemote.targets.ServerHttpRemote'; }
}
