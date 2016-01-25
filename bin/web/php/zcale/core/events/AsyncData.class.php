<?php

class zcale_core_events_AsyncData extends zcale_core_events_EventData {
	public function __construct() {
		if(!php_Boot::$skip_constructor) {
		parent::__construct();
		$this->error = _hx_anonymous(array("crumbs" => (new _hx_array(array()))));
	}}
	public $error;
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
	static function toObject($eventData) {
		$object = _hx_anonymous(array());
		{
			$_g = 0;
			$_g1 = Reflect::fields($eventData);
			while($_g < $_g1->length) {
				$fieldName = $_g1[$_g];
				++$_g;
				{
					$value = Reflect::field($eventData, $fieldName);
					$object->{$fieldName} = $value;
					unset($value);
				}
				unset($fieldName);
			}
		}
		return $object;
	}
	static function fromObject($eventData, $object) {
		$_g = 0;
		$_g1 = Reflect::fields($object);
		while($_g < $_g1->length) {
			$fieldName = $_g1[$_g];
			++$_g;
			{
				$value = Reflect::field($object, $fieldName);
				$eventData->{$fieldName} = $value;
				unset($value);
			}
			unset($fieldName);
		}
	}
	function __toString() { return 'zcale.core.events.AsyncData'; }
}
