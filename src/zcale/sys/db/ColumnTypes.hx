package zcale.sys.db;

// Text types

@:forward
abstract Char<T>( Column<T,String> ) // Holds a fixed length string (can contain letters, numbers, and special characters). The fixed size is specified in parenthesis. Can store up to 255 characters
{
	@:extern
	public inline function new( table : T, name : String )
	{
		this = new Column( table, name );
	}
}

@:forward
abstract Varchar<T>( Column<T,String> ) // Holds a variable length string (can contain letters, numbers, and special characters). The maximum size is specified in parenthesis. Can store up to 255 characters. Note: If you put a greater value than 255 it will be converted to a TEXT type
{
	@:extern
	public inline function new( table : T, name : String, length : Int = 255 )
	{
		this = new Column( table, name, "VARCHAR", length );
	}
}

@:forward
abstract TinyText<T>( Column<T,String> ) // Holds a string with a maximum length of 255 characters
{
	@:extern
	public inline function new( table : T, name : String )
	{
		this = new Column( table, name );
	}
}

@:forward
abstract Text<T>( Column<T,String> ) // Holds a string with a maximum length of 65,535 characters
{
	@:extern
	public inline function new( table : T, name : String )
	{
		this = new Column( table, name );
	}
}

@:forward
abstract Blob<T>( Column<T,String> ) // For BLOBs (Binary Large OBjects). Holds up to 65,535 bytes of data
{
	@:extern
	public inline function new( table : T, name : String )
	{
		this = new Column( table, name );
	}
}

@:forward
abstract MediumText<T>( Column<T,String> ) // Holds a string with a maximum length of 16,777,215 characters
{
	@:extern
	public inline function new( table : T, name : String )
	{
		this = new Column( table, name );
	}
}

@:forward
abstract MediumBlob<T>( Column<T,String> ) // For BLOBs (Binary Large OBjects). Holds up to 16,777,215 bytes of data
{
	@:extern
	public inline function new( table : T, name : String )
	{
		this = new Column( table, name );
	}
}

@:forward
abstract LongText<T>( Column<T,String> ) // Holds a string with a maximum length of 4,294,967,295 characters
{
	@:extern
	public inline function new( table : T, name : String )
	{
		this = new Column( table, name );
	}
}

@:forward
abstract LongBlob<T>( Column<T,String> ) // For BLOBs (Binary Large OBjects). Holds up to 4,294,967,295 bytes of data
{
	@:extern
	public inline function new( table : T, name : String )
	{
		this = new Column( table, name );
	}
}

@:forward
abstract EnumType<T>( Column<T,String> ) // Let you enter a list of possible values. You can list up to 65535 values in an ENUM list. If a value is inserted that is not in the list, a blank value will be inserted. Note: The values are sorted in the order you enter them. You enter the possible values in this format: ENUM('X','Y','Z')
{
	@:extern
	public inline function new( table : T, name : String )
	{
		this = new Column( table, name );
	}
}

@:forward
abstract Set<T>( Column<T,String> ) // Similar to ENUM except that SET may contain up to 64 list items and can store more than one choice
{
	@:extern
	public inline function new( table : T, name : String )
	{
		this = new Column( table, name );
	}
}

// Number types

@:forward
abstract TinyInt<T>( Column<T,Null<Int>> ) // 128 to 127 normal. 0 to 255 UNSIGNED*. The maximum number of digits may be specified in parenthesis
{
	@:extern
	public inline function new( table : T, name : String, length : Int = 4 )
	{
		this = new Column( table, name, length, true );
	}
}

@:forward
abstract SmallInt<T>( Column<T,Null<Int>> ) // 32768 to 32767 normal. 0 to 65535 UNSIGNED*. The maximum number of digits may be specified in parenthesis
{
	@:extern
	public inline function new( table : T, name : String, length : Int = 6 )
	{
		this = new Column( table, name, length, true );
	}
}

@:forward
abstract MediumInt<T>( Column<T,Null<Int>> ) // 8388608 to 8388607 normal. 0 to 16777215 UNSIGNED*. The maximum number of digits may be specified in parenthesis
{
	@:extern
	public inline function new( table : T, name : String, ?length : Int = 9 )
	{
		this = new Column( table, name, length, true );
	}
}

@:forward
abstract IntType<T>( Column<T,Null<Int>> ) // 2147483648 to 2147483647 normal. 0 to 4294967295 UNSIGNED*. The maximum number of digits may be specified in parenthesis
{
	@:extern
	public inline function new( table : T, name : String, length : Int = 11 )
	{
		this = new Column( table, name, "INT", length, true );
	}
}

@:forward
abstract BigInt<T>( Column<T,Null<Int>> ) // 9223372036854775808 to 9223372036854775807 normal. 0 to 18446744073709551615 UNSIGNED*. The maximum number of digits may be specified in parenthesis
{
	@:extern
	public inline function new( table : T, name : String, ?length : Int = 20 )
	{
		this = new Column( table, name, length, true );
	}
}

@:forward
abstract FloatType<T>( Column<T,Null<Float>> ) // A small number with a floating decimal point. The maximum number of digits may be specified in the size parameter. The maximum number of digits to the right of the decimal point is specified in the d parameter
{
	@:extern
	public inline function new( table : T, name : String, ?length : Null<Float> )
	{
		this = new Column( table, name, length, false, true );
	}
}

@:forward
abstract Double<T>( Column<T,Null<Float>> ) // A large number with a floating decimal point. The maximum number of digits may be specified in the size parameter. The maximum number of digits to the right of the decimal point is specified in the d parameter
{
	@:extern
	public inline function new( table : T, name : String, ?length : Null<Float> )
	{
		this = new Column( table, name, length, false, true );
	}
}

@:forward
abstract Decimal<T>( Column<T,Null<Float>> ) // A DOUBLE stored as a string , allowing for a fixed decimal point. The maximum number of digits may be specified in the size parameter. The maximum number of digits to the right of the decimal point is specified in the d parameter
{
	@:extern
	public inline function new( table : T, name : String, length : Null<Float> = 10 )
	{
		this = new Column( table, name, "DECIMAL", length, false, true );
	}
}

// Date types

@:forward
abstract DateType<T>( Column<T,Date> ) // A date. Format: YYYY-MM-DD, Note: The supported range is from '1000-01-01' to '9999-12-31'
{
	@:extern
	public inline function new( table : T, name : String )
	{
		this = new Column( table, name );
	}
}

@:forward
abstract DateTime<T>( Column<T,Date> ) // *A date and time combination. Format: YYYY-MM-DD HH:MI:SS, Note: The supported range is from '1000-01-01 00:00:00' to '9999-12-31 23:59:59'
{
	@:extern
	public inline function new( table : T, name : String )
	{
		this = new Column( table, name );
	}
}

@:forward
abstract TimeStamp<T>( Column<T,Date> ) // abstract DateTime extends Column // *A date and time combination. Format: YYYY-MM-DD HH:MI:SS, Note: The supported range is from '1000-01-01 00:00:00' to '9999-12-31 23:59:59'
{
	@:extern
	public inline function new( table : T, name : String )
	{
		this = new Column( table, name );
	}
}

@:forward
abstract Time<T>( Column<T,Date> ) // A time. Format: HH:MI:SS, Note: The supported range is from '-838:59:59' to '838:59:59'
{
	@:extern
	public inline function new( table : T, name : String )
	{
		this = new Column( table, name );
	}
}

@:forward
abstract Year<T>( Column<T,Date> ) // A year in two-digit or four-digit format., Note: Values allowed in four-digit format: 1901 to 2155. Values allowed in two-digit format: 70 to 69, representing years from 1970 to 2069
{
	@:extern
	public inline function new( table : T, name : String )
	{
		this = new Column( table, name );
	}
}