<?php

class zcale_core_boot_targets_ServerBoot implements zcale_core_patterns_ISingleton, zcale_core_boot_IBoot{
	public function __construct() {
		if(!php_Boot::$skip_constructor) {
		$this->completed = false;
		$this->printHtml = true;
		$this->eventKeys = new zcale_core_events_AsyncKeys();
		$this->eventData = new zcale_core_events_AsyncData();
		$this->event = new zcale_core_events_AsyncDispatcher($this, $this->eventData);
	}}
	public $printHtml;
	public $completed;
	public $eventKeys;
	public $eventData;
	public $event;
	public $tracer;
	public $index;
	public function boot($mainClass) {
		if($this->completed === false) {
			$this->index = new zcale_server_html_views_HtmlIndex();
			$this->index->mainFilePath = "/" . _hx_string_or_null(zcale_core_boot_targets_ServerBoot_0($this, $mainClass));
			$this->index->set_title(zcale_PathTools::lastElement($this->index->mainFilePath, null));
			$this->tracer = $this->index;
			$this->init();
		} else {
			$this->event->dispatch($this->eventKeys->complete);
		}
	}
	public function init() {
		$this->completed = true;
		$params = zcale_core_path_targets_ServerPath::get_PARAMS();
		if($params->exists("remoteData") === true) {
			$this->printHtml = false;
			$this->remoteCall($params->get("remoteData"));
		} else {
			if($params->exists("run") === true) {
				$_g = $params->get("run");
				switch($_g) {
				case "js":{
					$this->index->target = 1;
					$this->index->mainFilePath = "/js" . _hx_string_or_null($this->index->mainFilePath) . ".js";
				}break;
				case "fl":{
					$this->index->target = 2;
					$this->index->mainFilePath = "/swf" . _hx_string_or_null($this->index->mainFilePath) . ".swf";
				}break;
				case "tt":{
					$this->index->target = 3;
				}break;
				default:{
					$this->event->dispatch($this->eventKeys->complete);
				}break;
				}
			} else {
				$this->event->dispatch($this->eventKeys->complete);
			}
		}
		if($this->printHtml === true) {
			Sys::hprint($this->index->toString());
		}
	}
	public function remoteCall($callData) {
		$call = haxe_Json::phpJsonDecode($callData);
		$remote = new zcale_core_web_httpRemote_targets_ServerHttpRemote($this->eventData);
		$remote->event->addListener($remote->eventKeys->complete, (isset($this->onRemoteComplete) ? $this->onRemoteComplete: array($this, "onRemoteComplete")));
		$remote->event->addListener($remote->eventKeys->error, (isset($this->onRemoteError) ? $this->onRemoteError: array($this, "onRemoteError")));
		$remote->call($call->classPath, $call->methodName, $call->arguments);
	}
	public function onRemoteComplete($remote) {
		Sys::hprint(zcale_core_boot_targets_ServerBoot_1($this, $remote));
	}
	public function onRemoteError($remote) {
		$remote->event->error->addCrumb($this, "remoteCall");
		Sys::hprint(zcale_core_boot_targets_ServerBoot_2($this, $remote));
	}
	public function trace($str) {
		$this->tracer->trace($str);
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
	static $instance;
	static function getInstance() {
		if(zcale_core_boot_targets_ServerBoot::$instance === null) {
			zcale_core_boot_targets_ServerBoot::$instance = new zcale_core_boot_targets_ServerBoot();
		}
		return zcale_core_boot_targets_ServerBoot::$instance;
	}
	function __toString() { return 'zcale.core.boot.targets.ServerBoot'; }
}
function zcale_core_boot_targets_ServerBoot_0(&$__hx__this, &$mainClass) {
	{
		$s = Type::getClassName($mainClass);
		return str_replace(".", "/", $s);
	}
}
function zcale_core_boot_targets_ServerBoot_1(&$__hx__this, &$remote) {
	{
		$obj = zcale_core_events_AsyncData::toObject($remote->eventData);
		return haxe_Json::phpJsonEncode($obj, null, null);
	}
}
function zcale_core_boot_targets_ServerBoot_2(&$__hx__this, &$remote) {
	{
		$obj = zcale_core_events_AsyncData::toObject($remote->eventData);
		return haxe_Json::phpJsonEncode($obj, null, null);
	}
}
