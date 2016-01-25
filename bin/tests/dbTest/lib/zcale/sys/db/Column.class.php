<?php

class zcale_sys_db_Column {
	public function __construct($table, $name, $type = null, $length = null, $isInt = null, $isFloat = null) {
		if(!php_Boot::$skip_constructor) {
		$this->table = $table;
		$this->name = $name;
		$this->refName = $name;
		$this->type = $type;
		$this->length = $length;
		$this->isInt = $isInt;
		$this->isFloat = $isFloat;
		$table->addColumn($this);
	}}
	public $value;
	public $table;
	public $name;
	public $refName;
	public $alias;
	public $type;
	public $length;
	public $isInt;
	public $isFloat;
	public function get_value() {
		$v = null;
		if($this->table->_values !== null) {
			if(_hx_has_field($this->table->_values, $this->refName)) {
				if($this->isInt) {
					$v = Std::parseInt(Reflect::field($this->table->_values, $this->refName));
				} else {
					if($this->isFloat) {
						$v = Std::parseFloat(Reflect::field($this->table->_values, $this->refName));
					} else {
						$v = Reflect::field($this->table->_values, $this->refName);
					}
				}
			}
		} else {
			$v = $this->value;
		}
		return $v;
	}
	public function set_value($v) {
		if($this->table->_values !== null && _hx_has_field($this->table->_values, $this->name)) {
			$this->table->_values->{$this->name} = $v;
		}
		return $this->value = $v;
	}
	public function set($v) {
		$this->set_value($v);
		return $this->table;
	}
	public function has($alias) {
		$this->alias = $alias;
		$this->refName = $alias;
		return $this;
	}
	public function toString() {
		$str = _hx_string_or_null($this->table->toString()) . "." . _hx_string_or_null($this->name);
		if($this->alias !== null) {
			$str .= " AS " . _hx_string_or_null($this->alias);
		}
		return $str;
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
	static $__properties__ = array("set_value" => "set_value","get_value" => "get_value");
	function __toString() { return $this->toString(); }
}
