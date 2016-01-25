/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.core.web;

import zcale.core.events.AsyncData;

#if ( flash || js )
	typedef HttpRemote<T:AsyncData> = zcale.core.web.httpRemote.targets.ClientHttpRemote<T>;
#elseif ( neko || php || macro )
	typedef HttpRemote<T:AsyncData> = zcale.core.web.httpRemote.targets.ServerHttpRemote<T>;
#else
	#error "unknown target";
#end

/////////////////////////////////////////////////////////////////////////////////////////////////////////