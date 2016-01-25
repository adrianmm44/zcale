package zcale.xml.node;

import zcale.Indenting;
import zcale.patterns.Event;
import zcale.patterns.EventListeners;

class BabyNode<T>
{
	public var parent 		 : ElderNode<Dynamic>;
	
	private var self 		 : T;
	private var listeners 	 : EventListeners<T>;
	private var indenting	 : Indenting;
	private var useIndenting : Bool = true;
	private var output 		 : String;
		
	public function new( self : T )
	{
		this.self = self;
		this.listeners = new EventListeners( self );
		this.indenting = new Indenting();		
	}
	
	private function getIndenting() : String
	{
		return ( useIndenting ) ? "\n" + indenting.toString() : "";
	}
	
	public function toString() : String
	{
		output = "";
		listeners.dispatch( Event.TO_STRING );
		return output;
	}
}