package zcale.sys.db;

import zcale.sys.db.Column;
import zcale.types.StringType.DynamicObject;

private typedef ColumnType  = Dynamic;
private typedef ColumnValue = Dynamic;

class Table<T>
{
	// private vars are prefixed with an underscore so they do not conflict with the vars of the sub class
	
	private var _self 	 : T;
	private var _name    : String;
	private var _columns : Array<Column<ColumnType,ColumnValue>>;
	private var _values  : DynamicObject;
	
	public function new( self : T, name : String )
	{
		_self	 = self;
		_name 	 = name;
		_columns = new Array();
	}
	
	private function addColumn( col : Column<ColumnType,ColumnValue> ) : T
	{
		_columns.push( col );
		return _self;
	}
	
	public function getKeys() : Array<String>
	{
		var keys = new Array<String>();
		for( column in _columns )
		{
			if( column.value != null ){
				keys.push( column.toString() );
			}
		}
		return keys;
	}
	
	public function getValues() : Array<Dynamic>
	{
		var values = new Array<Dynamic>();
		for( column in _columns )
		{
			if( column.value != null ){
				values.push( column.value );
			}
		}
		return values;
	}
	
	public function setValues( row : Dynamic ) : T
	{
		_values = row;
		return _self;
	}
	
	public function toString() : String
	{
		return _name;
	}
}