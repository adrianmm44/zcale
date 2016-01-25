<?php

class zcale_sys_db_tests_DatabaseTest {
	public function __construct() {
		if(!php_Boot::$skip_constructor) {
		$this->db = new zcale_sys_db_Database("zcale");
		$this->cnx = sys_db_Mysql::connect(_hx_anonymous(array("host" => "localhost", "user" => "root", "pass" => "root", "database" => $this->db->name, "port" => null, "socket" => null)));
	}}
	public $db;
	public $cnx;
	public function run() {
		$this->selectRecords();
		$this->cnx->close();
	}
	public function createDatabase() {
		$sql = null;
		{
			$this1 = null;
			{
				$this2 = null;
				$this2 = zcale_sys_db_tests_DatabaseTest_0($this, $sql, $this1, $this2);
				{
					$str1 = null;
					{
						$s = null;
						{
							$s1 = $this2;
							$s = str_replace("CREATE DATABASE", "CREATE DATABASE IF NOT EXISTS", $s1);
						}
						$str1 = str_replace("CREATE TABLE", "CREATE TABLE IF NOT EXISTS", $s);
					}
					$this1 = $str1;
				}
			}
			$sql = $this1;
		}
		$this->cnx->request($sql);
		Sys::hprint("<br/>Database " . Std::string($this->db) . " created: " . _hx_string_or_null($sql));
	}
	public function createTable() {
		$naw = new zcale_sys_db_tests_zcale_Naw();
	}
	public function insertRecords() {
		$t1 = _hx_deref(new zcale_sys_db_tests_zcale_Naw())->voornaam->set("Adrian")->naam->set("Martinez")->straat->set("Bolacaciahof 25")->postcode->set("1324AL")->plaats->set("Almere");
		$t2 = _hx_deref(new zcale_sys_db_tests_zcale_Naw())->voornaam->set("Esmee")->naam->set("Riemens")->straat->set("Bolacaciahof 25")->postcode->set("1234AL")->plaats->set("Almere");
		$t3 = _hx_deref(new zcale_sys_db_tests_zcale_Naw())->voornaam->set("Esmee")->naam->set("Riemens")->straat->set("Somewhere")->postcode->set("???????")->plaats->set("Almere");
		$sql = null;
		{
			$this1 = null;
			{
				$this2 = null;
				{
					$this3 = null;
					{
						$this4 = zcale_sys_db__Sql_MainOperation_Impl_::insert("", $t1, $t1->getKeys());
						$v = $t1->getValues();
						{
							$str = _hx_string_or_null($this4) . " VALUES (" . _hx_string_or_null(zcale_sys_db_SqlTools::joinValues($v)) . ")";
							$this3 = $str;
						}
					}
					$v1 = $t2->getValues();
					{
						$str1 = _hx_string_or_null($this3) . ",(" . _hx_string_or_null(zcale_sys_db_SqlTools::joinValues($v1)) . ")";
						$this2 = $str1;
					}
				}
				$v2 = $t3->getValues();
				{
					$str2 = _hx_string_or_null($this2) . ",(" . _hx_string_or_null(zcale_sys_db_SqlTools::joinValues($v2)) . ")";
					$this1 = $str2;
				}
			}
			$sql = $this1;
		}
		$this->cnx->request($sql);
		Sys::hprint("<br/>Records inserted in " . Std::string($t1) . ": " . _hx_string_or_null($sql));
	}
	public function deleteRecords() {
		$naw = new zcale_sys_db_tests_zcale_Naw();
		$sql = null;
		{
			$this1 = null;
			{
				$this2 = null;
				{
					$this3 = null;
					$this3 = zcale_sys_db_tests_DatabaseTest_1($this, $naw, $sql, $this1, $this2, $this3);
					{
						$str1 = _hx_string_or_null($this3) . " WHERE " . Std::string($naw->straat);
						$this2 = $str1;
					}
				}
				{
					$str2 = _hx_string_or_null($this2) . "=" . _hx_string_or_null(zcale_sys_db_SqlTools::evalValue("Somewhere"));
					$this1 = $str2;
				}
			}
			$sql = $this1;
		}
		$this->cnx->request($sql);
		Sys::hprint("<br/>Records deleted in " . Std::string($naw) . ": " . _hx_string_or_null($sql));
	}
	public function selectRecords() {
		$naw = new zcale_sys_db_tests_zcale_Naw();
		$sql = null;
		{
			$this1 = null;
			{
				$this2 = null;
				{
					$this3 = null;
					$this3 = zcale_sys_db_tests_DatabaseTest_2($this, $naw, $sql, $this1, $this2, $this3);
					{
						$str1 = _hx_string_or_null($this3) . " WHERE " . Std::string($naw->voornaam);
						$this2 = $str1;
					}
				}
				{
					$str2 = _hx_string_or_null($this2) . "=" . _hx_string_or_null(zcale_sys_db_SqlTools::evalValue("Esmee"));
					$this1 = $str2;
				}
			}
			$sql = $this1;
		}
		if(null == $this->cnx) throw new HException('null iterable');
		$__hx__it = $this->cnx->request($sql);
		while($__hx__it->hasNext()) {
			$row = $__hx__it->next();
			$naw->setValues($row);
			$str3 = _hx_string_or_null($naw->voornaam->get_value()) . " " . _hx_string_or_null($naw->naam->get_value()) . " woont op de " . _hx_string_or_null($naw->straat->get_value()) . ", " . _hx_string_or_null($naw->postcode->get_value()) . " in " . _hx_string_or_null($naw->plaats->get_value()) . "<br/>";
			Sys::hprint($str3);
			unset($str3);
		}
		Sys::hprint("<br/>Records selected from " . Std::string($naw) . ": " . _hx_string_or_null($sql));
	}
	public function updateRecords() {
		$naw = new zcale_sys_db_tests_zcale_Naw();
		$sql = null;
		{
			$this1 = null;
			{
				$this2 = null;
				{
					$this3 = null;
					{
						$this4 = null;
						$this4 = zcale_sys_db_tests_DatabaseTest_3($this, $naw, $sql, $this1, $this2, $this3, $this4);
						{
							$str1 = _hx_string_or_null($this4) . " SET " . Std::string($naw->naam) . "=" . _hx_string_or_null(zcale_sys_db_SqlTools::evalValue("Martinez Martinez"));
							$this3 = $str1;
						}
					}
					{
						$str2 = _hx_string_or_null($this3) . " WHERE " . Std::string($naw->naam);
						$this2 = $str2;
					}
				}
				{
					$str3 = _hx_string_or_null($this2) . "=" . _hx_string_or_null(zcale_sys_db_SqlTools::evalValue("Martinez"));
					$this1 = $str3;
				}
			}
			$sql = $this1;
		}
		$this->cnx->request($sql);
		Sys::hprint("<br/>Record updated in " . Std::string($naw) . ": " . _hx_string_or_null($sql));
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
	static function main() {
		_hx_deref(new zcale_sys_db_tests_DatabaseTest())->run();
	}
	function __toString() { return 'zcale.sys.db.tests.DatabaseTest'; }
}
function zcale_sys_db_tests_DatabaseTest_0(&$__hx__this, &$sql, &$this1, &$this2) {
	{
		$str = _hx_string_or_null("CREATE") . " DATABASE " . Std::string($__hx__this->db);
		return $str;
	}
}
function zcale_sys_db_tests_DatabaseTest_1(&$__hx__this, &$naw, &$sql, &$this1, &$this2, &$this3) {
	{
		$str = _hx_string_or_null("DELETE") . " FROM " . Std::string($naw);
		return $str;
	}
}
function zcale_sys_db_tests_DatabaseTest_2(&$__hx__this, &$naw, &$sql, &$this1, &$this2, &$this3) {
	{
		$str = _hx_string_or_null(_hx_string_or_null("") . "SELECT *") . " FROM " . Std::string($naw);
		return $str;
	}
}
function zcale_sys_db_tests_DatabaseTest_3(&$__hx__this, &$naw, &$sql, &$this1, &$this2, &$this3, &$this4) {
	{
		$str = "UPDATE " . Std::string($naw);
		return $str;
	}
}
