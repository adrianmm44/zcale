/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.dom.node;

#if flash
	typedef Element = Dynamic;
#elseif js
	typedef Element = js.html.Element;
#elseif ( neko || php )
	typedef Element = Dynamic;
#else
	#error "unknown target";
#end

/////////////////////////////////////////////////////////////////////////////////////////////////////////