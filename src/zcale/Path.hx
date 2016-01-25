package zcale;

#if ( flash || js )
	typedef Path = zcale.core.path.targets.ClientPath;
#elseif ( neko || php || macro )
	typedef Path = zcale.core.path.targets.ServerPath;
#else
	#error "unknown target";
#end