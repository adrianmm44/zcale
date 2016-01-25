/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.dom.node;

#if flash
	typedef Render<T:ChildNode<T>> = zcale.dom.node.render.FlashRender<T>;
#elseif js
	typedef Render<T:ChildNode<T>> = zcale.dom.node.render.JsRender<T>;
#elseif ( neko || php )
	typedef Render<T:ChildNode<T>> = zcale.dom.node.render.HtmlRender<T>;
#else
	#error "unknown target";
#end

/////////////////////////////////////////////////////////////////////////////////////////////////////////