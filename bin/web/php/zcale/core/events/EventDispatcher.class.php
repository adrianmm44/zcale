<?php

class zcale_core_events_EventDispatcher {
	public function __construct($instance, $eventData) {
		if(!php_Boot::$skip_constructor) {
		$this->instance = $instance;
		$this->eventData = $eventData;
		$this->listeners = new _hx_array(array());
	}}
	public $instance;
	public $eventData;
	public $listeners;
	public function addListener($eventKey, $eventListener) {
		if($this->listeners[$eventKey] === null) {
			$this->listeners[$eventKey] = new _hx_array(array());
		}
		_hx_array_get($this->listeners, $eventKey)->push($eventListener);
	}
	public function removeListener($eventKey, $eventListener) {
		if($this->listeners[$eventKey] !== null) {
			_hx_array_get($this->listeners, $eventKey)->remove($eventListener);
		}
	}
	public function removeAllListeners() {
		$this->listeners = new _hx_array(array());
	}
	public function dispatch($eventKey) {
		if($this->listeners[$eventKey] !== null) {
			$this->eventData->eventKey = $eventKey;
			{
				$_g = 0;
				$_g1 = $this->listeners[$eventKey];
				while($_g < $_g1->length) {
					$eventListener = $_g1[$_g];
					++$_g;
					call_user_func_array($eventListener, array($this->instance));
					unset($eventListener);
				}
			}
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
	function __toString() { return 'zcale.core.events.EventDispatcher'; }
}
