package zcale.events;

import haxe.ds.StringMap;
import zcale.types.ArrayType;

class EventListeners<T>
{
	private var user : T;
	private var listeners : StringMap<ArrayType<(T->Void)>>;
	
	public function new( user : T )
	{
		this.user = user;
		this.listeners = new StringMap();
	}
	
	public function add( event : String, listener : (T->Void) ) : T {
		
		if( listeners.exists( event ) == false ) {
			listeners.set( event, [] );
		}
		listeners.get( event ).add( listener );
		return user;
	}
	
	public function addFront( event : String, listener : (T->Void) ) : T {
		
		if( listeners.exists( event ) == false ) {
			listeners.set( event, [] );
		}
		listeners.get( event ).addFront( listener );
		return user;
	}
	
	public function remove( event : String, listener : (T->Void) ) : T {
		
		if( listeners.exists( event )) {
			listeners.get( event ).remove( listener );
		}
		return user;
	}
	
	public function removeAll() : T {
		
		listeners = new StringMap();
		return user;
	}
		
	public function dispatch( event : String ) : T {
		
		if( listeners.exists( event )) {
			for ( listener in listeners.get( event )) {
				listener( user );
			}
		}
		return user;
	}
}