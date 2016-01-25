/////////////////////////////////////////////////////////////////////////////////////////////////////////

package zcale.dom.node.interfaces;

@:autoBuild( zcale.macros.dom.node.GlobalAttrsBuilder.build() )
	
interface IGlobalAttrs
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var id( 	default, set ) : String;
	public var cls( default, set ) : String;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////