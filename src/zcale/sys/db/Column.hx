package zcale.sys.db;

@:access( zcale.sys.db.Table )

class Column<T:Table<Dynamic>,V>
{
	@:isVar
	public var value( get, set ) : V;
	
	private var table  	: T;
	private var name   	: String;
	private var refName : String;
	private var alias  	: String;
	private var type   	: String;	
	private var length 	: Null<Float>;
	private var isInt  	: Bool;
	private var isFloat : Bool;
	
	public function new( 
		table 	 : T, 
		name 	 : String, 
		?type 	 : String, 
		?length  : Null<Float>, 
		?isInt 	 : Bool, 
		?isFloat : Bool )
	{
		this.table 	 = table;
		this.name	 = name;
		this.refName = name;
		this.type  	 = type;
		this.length  = length;
		this.isInt 	 = isInt;
		this.isFloat = isFloat;
		
		table.addColumn( this );
	}
	
	private function get_value() : V
	{
		var v : Dynamic = null;
		if( table._values != null ){
			if( table._values.exists( refName ))
			{
				if( isInt ){
					v = Std.parseInt( table._values.get( refName ));
				}
				else if( isFloat ){
					v = Std.parseFloat( table._values.get( refName ));
				}
				else{
					v = table._values.get( refName );
				}
			}
		}
		else{
			v = value;
		}
		return v;
	}
	
	private function set_value( v : V ) : V
	{
		if( table._values != null && table._values.exists( name )){
			table._values.set( name, v );
		}
		return value = v;
	}
		
	public function set( v : V ) : T
	{
		value = v;
		return table;
	}
	
	public function as( alias : String ) : Column<T,V>
	{
		this.alias 	 = alias;
		this.refName = alias;
		return this;
	}
	
	public function toString() : String
	{
		var str = table.toString() + "." + name;
		if( alias != null ){
			str += " AS " + alias;
		}
		return str;
	}
}