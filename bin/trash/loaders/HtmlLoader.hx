/////////////////////////////////////////////////////////////////////////////////////////////////////

package hxf.core.loaders;

import hxf.core.Registry;

class HtmlLoader 
#if flash
	extends hxf.core.loaders.htmlLoader.targets.ClientHtmlLoader
#elseif jquery
	extends hxf.core.loaders.htmlLoader.targets.ClientHtmlLoader
#elseif js
	extends hxf.core.loaders.htmlLoader.targets.ClientHtmlLoader
#elseif ( neko || php || macro )
	extends hxf.core.loaders.htmlLoader.targets.SystemHtmlLoader
#else
	#error "target unknown"
#end
#if debug
	implements hxf.core.loaders.interfaces.ILoader
#end
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
		
	public function new( reg : Registry )
	{
		super( this, reg );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////