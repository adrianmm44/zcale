package zcale.xml.node;

import haxe.ds.StringMap;
import zcale.patterns.Event;

class ChildNode<T> extends BabyNode<T>
{
	private var tagName 	 : String;
	private var attrs   	 : StringMap<String>;
	private var params  	 : Array<String>;
	private var autoCloseTag : Bool;
		
	public function new( self : T, ?tagName : String, autoCloseTag : Bool = true )
	{
		super( self );		
		this.tagName = tagName;
		this.attrs 	 = new StringMap();
		this.params  = new Array();
		this.autoCloseTag = autoCloseTag;
		this.listeners.add( Event.TO_STRING, onHeadToString );
		this.listeners.add( Event.TO_STRING, onBodyToString );
	}
	
	public function get( attr : String ) : String
	{
		return attrs.get( attr );
	}
	
	public function set( attr : String, value : String ) : T
	{
		attrs.set( attr, value );
		return self;
	}
	
	private function onHeadToString( self : T ) : Void
	{
		var str = "\n" + indenting.toString() + "<" + tagName;
		
		for( key in attrs.keys() )
		{
			if( attrs.get( key ) != null ){
				str += " " + key + '="' + attrs.get( key ) + '"';
			}			
		}
		for( param in params )
		{
			str += " " + param;
		}
		output += str;
	}
	
	private function onBodyToString( self : T ) : Void
	{
		output += ( autoCloseTag ) ? "/>" : "></" + tagName + ">";
	}
}