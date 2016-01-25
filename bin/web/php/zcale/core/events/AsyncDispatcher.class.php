<?php

class zcale_core_events_AsyncDispatcher extends zcale_core_events_EventDispatcher {
	public function __construct($instance, $eventData) {
		if(!php_Boot::$skip_constructor) {
		parent::__construct($instance,$eventData);
		$this->asyncData = $eventData;
		$this->asyncKeys = new zcale_core_events_AsyncKeys();
		$this->error = new zcale_core_events_ErrorManager($eventData);
	}}
	public $asyncKeys;
	public $asyncData;
	public $error;
	public function dispatchError($eventData, $instance, $methodName = null, $errorMessage = null) {
		if($errorMessage === null) {
			$this->asyncData->error = $eventData->error;
			$this->error->addCrumb($instance, $methodName);
		} else {
			$this->error->setError($instance, $methodName, $errorMessage);
		}
		$this->dispatch($this->asyncKeys->error);
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
	function __toString() { return 'zcale.core.events.AsyncDispatcher'; }
}
