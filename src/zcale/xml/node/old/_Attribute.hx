package zcale.xml.node;

import haxe.ds.StringMap;

class Attribute<T>
{
	private var node  : T;
	private var attrs : StringMap<String>;
	private var name  : String;
	
	public var value( default, null ) : String;
	
	public function new( node : T, attrs : StringMap<String>, name : String, ?value : String )
	{
		this.node  = node;
		this.attrs = attrs;
		this.name  = name;
		this.value = value;
		this.attrs.set( name, value );
	}
	
	public function set( v : String ) : T
	{
		value = v;
		attrs.set( name, v );
		return node;
	}
}