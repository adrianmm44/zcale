<?php

interface zcale_core_web_scriptLoader_IScriptLoader extends zcale_core_events_interfaces_IAsyncDispatcher{
	function load($filePath);
}
