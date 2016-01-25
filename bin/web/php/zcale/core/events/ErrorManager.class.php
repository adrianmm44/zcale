<?php

class zcale_core_events_ErrorManager {
	public function __construct($eventData) {
		if(!php_Boot::$skip_constructor) {
		$this->data = $eventData;
	}}
	public $data;
	public function setError($instance, $methodName, $errorMessage) {
		$this->data->error->classPath = Type::getClassName(Type::getClass($instance));
		$this->data->error->methodName = $methodName;
		$this->data->error->message = Std::string($errorMessage);
		$this->data->error->crumbs = new _hx_array(array());
		$this->data->error->crumbs->push(_hx_anonymous(array("classPath" => $this->data->error->classPath, "methodName" => $this->data->error->methodName)));
	}
	public function addCrumb($instance, $methodName = null) {
		$classPath = Type::getClassName(Type::getClass($instance));
		$this->data->error->crumbs->push(_hx_anonymous(array("classPath" => $classPath, "methodName" => $methodName)));
	}
	public function toString() {
		if($this->data->error->message === null) {
			$this->data->error->message = "no error message available";
		}
		$str = "Error: " . _hx_string_or_null($this->data->error->message);
		{
			$_g = 0;
			$_g1 = $this->data->error->crumbs;
			while($_g < $_g1->length) {
				$crumb = $_g1[$_g];
				++$_g;
				$str .= "\x0A- " . _hx_string_or_null($crumb->classPath);
				if($crumb->methodName !== null) {
					$str .= " -> " . _hx_string_or_null($crumb->methodName);
				}
				unset($crumb);
			}
		}
		return _hx_string_or_null($str) . "\x0A" . _hx_string_or_null(Date::now()->toString());
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
