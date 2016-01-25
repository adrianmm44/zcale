<?php

class zcale_sys_db_tests_zcale_Naw extends zcale_sys_db_Table {
	public function __construct() {
		if(!php_Boot::$skip_constructor) {
		parent::__construct($this,"naw");
		$this->id = new zcale_sys_db_Column($this, "id", "INT", 11, true, null);
		$this->voornaam = new zcale_sys_db_Column($this, "voornaam", "VARCHAR", 255, null, null);
		$this->tussenvoegsel = new zcale_sys_db_Column($this, "tussenvoegsel", "VARCHAR", 50, null, null);
		$this->naam = new zcale_sys_db_Column($this, "naam", "VARCHAR", 255, null, null);
		$this->straat = new zcale_sys_db_Column($this, "straat", "VARCHAR", 255, null, null);
		$this->postcode = new zcale_sys_db_Column($this, "postcode", "VARCHAR", 6, null, null);
		$this->plaats = new zcale_sys_db_Column($this, "plaats", "VARCHAR", 255, null, null);
	}}
	public $id;
	public $voornaam;
	public $tussenvoegsel;
	public $naam;
	public $straat;
	public $postcode;
	public $plaats;
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
	function __toString() { return 'zcale.sys.db.tests.zcale.Naw'; }
}
