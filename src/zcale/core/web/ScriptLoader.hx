package zcale.core.web;

#if flash
	typedef ScriptLoader = zcale.core.web.scriptLoader.targets.FlashScriptLoader;
#elseif js
	typedef ScriptLoader = zcale.core.web.scriptLoader.targets.JsScriptLoader;
#elseif ( neko || php || macro )
	typedef ScriptLoader = zcale.core.web.scriptLoader.targets.SystemScriptLoader;
#else
	#error "unknown target";
#end