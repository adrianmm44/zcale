<?php

class zcale_sys_db_Table {
	public function __construct($self, $name) {
		if(!php_Boot::$skip_constructor) {
		$this->_self = $self;
		$this->_name = $name;
		$this->_columns = new _hx_array(array());
	}}
	public $_self;
	public $_name;
	public $_columns;
	public $_values;
	public function addColumn($col) {
		$this->_columns->push($col);
		return $this->_self;
	}
	public function getKeys() {
		$keys = new _hx_array(array());
		{
			$_g = 0;
			$_g1 = $this->_columns;
			while($_g < $_g1->length) {
				$column = $_g1[$_g];
				++$_g;
				if($column->get_value() !== null) {
					$keys->push($column->toString());
				}
				unset($column);
			}
		}
		return $keys;
	}
	public function getValues() {
		$values = new _hx_array(array());
		{
			$_g = 0;
			$_g1 = $this->_columns;
			while($_g < $_g1->length) {
				$column = $_g1[$_g];
				++$_g;
				if($column->get_value() !== null) {
					$values->push($column->get_value());
				}
				unset($column);
			}
		}
		return $values;
	}
	public function setValues($row) {
		$this->_values = $row;
		return $this->_self;
	}
	public function toString() {
		return $this->_name;
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
