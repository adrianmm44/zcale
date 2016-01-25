/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.core.web;



#if flash
	typedef WebTools = zcale.core.web.webTools.targets.FlashWebTools;
#elseif js
	typedef WebTools = zcale.core.web.webTools.targets.JsWebTools;
#elseif php
	typedef WebTools = zcale.core.web.webTools.targets.PhpWebTools;
#elseif macro
	typedef WebTools = zcale.core.web.webTools.targets.SystemWebTools;
#else
	#error "unknown target";
#end

/////////////////////////////////////////////////////////////////////////////////////////////////////////