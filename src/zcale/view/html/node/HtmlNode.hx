package zcale.view.html.node;

import zcale.types.ChainType;
import zcale.xml.node.Attribute;
import zcale.xml.node.ElderNode;
import zcale.view.angular.AngularDirectives;
import zcale.types.mixed.StringOrArray;

typedef ClassAttribute<T> = ChainType<T,StringOrArray>;

class HtmlNode<T> extends ElderNode<T> {
	
	public var id( 	  get, never ) : Attribute<T>;
	public var cls 				   : ClassAttribute<T>;	
	public var style( get, never ) : Attribute<T>;
	public var title( get, never ) : Attribute<T>;
	public var role(  get, never ) : Attribute<T>;
	public var ng( 	  get, never ) : AngularDirectives<T>;
	
	public function new( tagName : String, autoClose : Bool = false ) {
		
		super( tagName, autoClose );
		get("id").set( null );
		get("class").set( null );
		cls = new ClassAttribute( self );
	}
	
	private function get_id() : Attribute<T> {
		
		return this.get("id");
	}
	
	private function get_style() : Attribute<T> {
		
		return this.get("style");
	}
	
	private function get_title() : Attribute<T> {
		
		return this.get("title");
	}
	
	private function get_role() : Attribute<T> {
		
		return this.get("role");
	}
	
	private function get_ng() : AngularDirectives<T> {
		
		return this;
	}
	
	public function data( attr : String ) : Attribute<T> {
		
		return this.get("data-" + attr );
	}
	
	public override function toString() : String {
		
		if( cls.value != null ) {
			if( cls.value.isString() ) {
				get("class").set( cls.value );
			}
			else {
				get("class").set( cls.value.toArray().join(" ") );
			}
		}
		return nodeToString();
	}
}