package zcale.sys.db;

//import zcale.sys.db.IColumn;

using StringTools;

class Sql
{
	public static var query(   get, never ) : MainOperation;
	public static var pattern( get, never ) : Pattern;
	
	@:extern
	private static inline function get_query() : MainOperation
	{
		return new MainOperation("");
	}
	@:extern
	private static inline function get_pattern() : Pattern
	{
		return new Pattern("");
	}
}

class SqlTools
{	
	public static function joinColumns( columns : Array<Dynamic> ) : String
	{
		var str = "";
		for( column in columns ){
			str += ", " + column;
		}
		return str.substr( 2 );
	}
		
	public static function joinValues( values : Array<Dynamic> ) : String
	{
		var str = "";
		for( v in values ){
			str += "," + evalValue( v );
		}
		return str.substr( 1 );
	}
	
	public static function evalValue( v : Dynamic ) : String
	{
		var str : String;
		if( Std.is( v, String )){
			str = "'" + v + "'";
		}
		else{
			str = Std.string( v );
		}
		return str;
	}
}

abstract SqlString( String )
{
	@:extern 
	public inline function new( str : String )
	{
		this = str;
	}
	@:to
	@:extern 
	public inline function toString() : String
	{
		return this;
	}
}

@:forward
abstract MainOperation( SelectOperation )
{
	public var create( 	  get, never ) : Create;
	public var delete(	  get, never ) : Delete;
	public var deleteAll( get, never ) : Delete;
	public var showColumns( get, never ) : Select;
	
	@:extern
	public inline function new( str : String )
	{
		this = new SelectOperation( str );
	}	
	@:extern
	private inline function get_create() : Create
	{
		return new Create("CREATE");
	}
		
	public function insert( table : Dynamic, ?columns : Array<Dynamic> ) : InsertOperation
	{
		var str = "INSERT INTO " + table;
		if( columns != null ){
			str += " (" + SqlTools.joinColumns( columns ) + ")";
		}
		return new InsertOperation( str );
	}
	@:extern
	public inline function update( table : Dynamic ) : UpdateOperation1
	{
		return new UpdateOperation1("UPDATE " + table );
	}
	@:extern
	private inline function get_delete() : Delete
	{
		return new Delete("DELETE");
	}
	@:extern
	private inline function get_deleteAll() : Delete
	{
		return new Delete("DELETE *");
	}
	@:extern
	private inline function get_showColumns() : Select
	{
		return new Select("SHOW COLUMNS");
	}
}

abstract SelectOperation( String )
{
	public var selectAll( get, never ) : Select;

	@:extern
	public inline function new( str : String )
	{
		this = str;
	}	
	@:extern
	public inline function select( columns : Array<Dynamic> ) : Select
	{
		return new Select( this + "SELECT " + SqlTools.joinColumns( columns ));
	}
	@:extern
	public inline function selectDistinct( columns : Array<Dynamic> ) : Select
	{
		return new Select( this + "SELECT DISTINCT " + SqlTools.joinColumns( columns ));
	}	
	@:extern 
	private inline function get_selectAll() : Select
	{
		return new Select( this + "SELECT *");
	}
}

@:forward
abstract WhereOperation( SqlString )
{
	@:extern
	public inline function new( str : String )
	{
		this = new SqlString( str );
	}	
	@:extern
	public inline function where( column : Dynamic ) : Operator
	{
		return new Operator( this + " WHERE " + column );
	}
}

abstract Create( String )
{
	@:extern
	public inline function new( str : String )
	{
		this = str;
	}
	@:extern
	public inline function database( db : Dynamic ) : CreateString
	{
		return new CreateString( this + " DATABASE " + db );
	}
	@:extern
	public inline function table( sql : String ) : CreateString
	{
		return new CreateString( this + " TABLE " + sql );
	}
}

@:forward
abstract CreateString( SqlString )
{
	@:extern 
	public inline function new( str : String )
	{
		this = new SqlString( str );
	}
	@:extern 
	public inline function ifNotExists() : SqlString
	{
		return new SqlString( this.toString()
			.replace("CREATE DATABASE", "CREATE DATABASE IF NOT EXISTS")
			.replace("CREATE TABLE", 	"CREATE TABLE IF NOT EXISTS"));
	}
}

@:forward
abstract Select( SqlString )
{
	@:extern
	public inline function new( str : String )
	{
		this = new SqlString( str );
	}	
	@:extern
	public inline function from( table : Dynamic ) : Select2
	{
		return new Select2( this + " FROM " + table );
	}
}

@:forward
abstract Delete( SqlString )
{
	@:extern
	public inline function new( str : String )
	{
		this = new SqlString( str );
	}	
	@:extern
	public inline function from( table : Dynamic ) : WhereOperation
	{
		return new WhereOperation( this + " FROM " + table );
	}
}

@:forward
abstract Select2( Select3 )
{	
	@:extern
	public inline function new( str : String )
	{
		this = new Select3( str );
	}	
	@:extern
	public inline function as( alias : String ) : Select2
	{
		return new Select2( this + " AS " + alias );
	}
	@:extern
	public inline function from( table : Dynamic ) : Select2
	{
		return new Select2( this + ", " + table );
	}
}

@:forward
abstract Select3( WhereOperation )
{
	public var join( 	 get, never ) : Join;
	public var orderBy(  get, never ) : OrderByOperation1;
	public var union( 	 get, never ) : SelectOperation;
	public var unionAll( get, never ) : SelectOperation;
	
	@:extern
	public inline function new( str : String )
	{
		this = new WhereOperation( str );
	}
	@:extern
	public inline function limit( length : Int ) : SqlString
	{
		return new SqlString( this + " LIMIT " + Std.string( length ));
	}
	@:extern
	private inline function get_orderBy() : OrderByOperation1
	{
		return new OrderByOperation1( this + " ORDER BY " );
	}
	@:extern
	private inline function get_join() : Join
	{
		return new Join( this.toString() );
	}
	@:extern
	private inline function get_union() : SelectOperation
	{
		return new SelectOperation( this + " UNION ");
	}
	@:extern
	private inline function get_unionAll() : SelectOperation
	{
		return new SelectOperation( this + " UNION ALL ");
	}
}

abstract Join( String )
{
	@:extern
	public inline function new( str : String )
	{
		this = str;
	}
	@:extern
	public inline function inner( table : Dynamic ) : Join2
	{
		return new Join2( this + " INNER JOIN " + table );
	}
	@:extern
	public inline function left( table : Dynamic ) : Join2
	{
		return new Join2( this + " LEFT JOIN " + table );
	}
	@:extern
	public inline function right( table : Dynamic ) : Join2
	{
		return new Join2( this + " RIGHT JOIN " + table );
	}
	@:extern
	public inline function full( table : Dynamic ) : Join2
	{
		return new Join2( this + " FULL JOIN " + table );
	}
}

@:forward
abstract Join2( SqlString )
{
	@:extern
	public inline function new( str : String )
	{
		this = new SqlString( str );
	}
	@:extern
	public inline function on( column1 : Dynamic, column2 : Dynamic ) : Select3
	{
		return new Select3( this + " ON " + column1 + "=" + column2 );
	}
}

@:forward
abstract InsertOperation( SqlString )
{
	@:extern
	public inline function new( str : String )
	{
		this = new SqlString( str );
	}
	@:extern
	public inline function values( v : Array<Dynamic> ) : InsertOperation2
	{
		return new InsertOperation2( this + " VALUES (" + SqlTools.joinValues( v ) + ")");
	}
}

@:forward
abstract InsertOperation2( SqlString )
{
	@:extern
	public inline function new( str : String )
	{
		this = new SqlString( str );
	}
	@:extern
	public inline function values( v : Array<Dynamic> ) : InsertOperation2
	{
		return new InsertOperation2( this + ",(" + SqlTools.joinValues( v ) + ")");
	}
	@:to
	@:extern
	public inline function toString() : String
	{
		return this.toString();
	}
}

@:forward
abstract UpdateOperation1( SqlString )
{
	@:extern
	public inline function new( str : String )
	{
		this = new SqlString( str );
	}
	@:extern
	public inline function set( column : Dynamic, value : Dynamic ) : UpdateOperation2
	{
		return new UpdateOperation2( this + " SET " + column + "=" + SqlTools.evalValue( value ));
	}
	@:to
	@:extern
	public inline function toString() : String
	{
		return this.toString();
	}
}

@:forward
abstract UpdateOperation2( WhereOperation )
{
	@:extern
	public inline function new( str : String )
	{
		this = new WhereOperation( str );
	}
	@:extern
	public inline function set( column : Dynamic, value : Dynamic ) : UpdateOperation2
	{
		return new UpdateOperation2( this + "," + column + "=" + SqlTools.evalValue( value ) );
	}
	@:to
	@:extern 
	public inline function toString() : String
	{
		return this.toString();
	}
}

abstract Operator( String )
{
	public var like( 	get, never ) : Like;
	public var notLike( get, never ) : Like;
	
	@:extern
	public inline function new( str : String )
	{
		this = str;
	}	
	@:extern
	public inline function is( v : Dynamic ) : AndOrOperation
	{
		return new AndOrOperation( this + "=" + SqlTools.evalValue( v ));
	}
	@:extern 
	public inline function isNot( v : Dynamic ) : AndOrOperation
	{
		return new AndOrOperation( this + "<>" + SqlTools.evalValue( v ));
	}	
	@:extern
	public inline function isGreaterThan( v : Dynamic ) : AndOrOperation
	{
		return new AndOrOperation( this + ">" + SqlTools.evalValue( v ));
	}	
	@:extern
	public inline function isLessThan( v : Dynamic ) : AndOrOperation
	{
	 	return new AndOrOperation( this + "<" + SqlTools.evalValue( v ));
	}	
	@:extern
	public inline function isGreaterOrEqual( v : Dynamic ) : AndOrOperation
	{
		return new AndOrOperation( this + ">=" + SqlTools.evalValue( v ));
	}	
	@:extern
	public inline function isLessOrEqual( v : Dynamic ) : AndOrOperation
	{
		return new AndOrOperation( this + "<=" + SqlTools.evalValue( v ));
	}	
	@:extern
	public inline function inRange( values : Array<Dynamic> ) : AndOrOperation
	{
		return new AndOrOperation( this + " IN (" + SqlTools.joinValues( values ) + ")");
	}
	@:extern
	public inline function notInRange( values : Array<Dynamic> ) : AndOrOperation
	{
		return new AndOrOperation( this + " NOT IN (" + SqlTools.joinValues( values ) + ")");
	}
	@:extern
	public inline function between( v1 : Dynamic, v2 : Dynamic ) : AndOrOperation
	{
		return new AndOrOperation( this + " BETWEEN " + SqlTools.evalValue( v1 ) + " AND " + SqlTools.evalValue( v2 ) + ")");
	}
	@:extern
	public inline function notBetween( v1 : Dynamic, v2 : Dynamic ) : AndOrOperation
	{
		return new AndOrOperation( this + " NOT BETWEEN " + SqlTools.evalValue( v1 ) + " AND " + SqlTools.evalValue( v2 ) + ")");
	}	
	@:extern
	private inline function get_like() : Like
	{
		return new Like( this + " LIKE ");
	}
	@:extern
	private inline function get_notLike() : Like
	{
		return new Like( this + " NOT LIKE ");
	}
}

abstract Like( String )
{
	@:extern
	public inline function new( str : String )
	{
		this = str;
	}
	@:extern
	public inline function pattern( v : Pattern ) : AndOrOperation
	{
		return new AndOrOperation( this + "'" + v + "'" );
	}
	@:extern
	public inline function contains( str : String ) : AndOrOperation
	{
		return new AndOrOperation( this + "'%" + str + "%'" );
	}
	@:extern
	public inline function startsWith( str : String ) : AndOrOperation
	{
		return new AndOrOperation( this + "'" + str + "%'" );
	}
	@:extern
	public inline function endsWith( str : String ) : AndOrOperation
	{
		return new AndOrOperation( this + "'%" + str + "'" );
	}
}

abstract Pattern( String )
{
	public var anyChar(    get, never ) : Pattern;
	public var zeroOrMore( get, never ) : Pattern;
	
	@:extern
	public inline function new( str : String = "" )
	{
		this = str;
	}
	@:extern
	public inline function chars( str : String ) : Pattern 
	{		
		return new Pattern( this + str );
	}
	@:extern
	public inline function range( chars : String ) : Pattern
	{
		return new Pattern(  this + "[" + chars + "]" );
	}	
	@:extern
	public inline function notRange( chars : String ) : Pattern
	{
		return new Pattern(  this + "[^" + chars + "]" );
	}
	@:extern
	private inline function get_anyChar() : Pattern
	{
		return new Pattern( this + "_" );
	}	
	@:extern
	private inline function get_zeroOrMore() : Pattern
	{
		return new Pattern( this + "%" );
	}
	@:extern
	public inline function toString() : String
	{
		return this;
	}
}

@:forward
abstract AndOrOperation( SqlString )
{
	@:extern
	public inline function new( str : String )
	{
		this = new SqlString( str );
	}
	@:extern
	public inline function and( column : Dynamic ) : Operator
	{
		return new Operator( this + " AND " + column );
	}
	@:extern
	public inline function or( column : Dynamic ) : Operator
	{
		return new Operator( this + " OR " + column );
	}
	@:to
	@:extern 
	public inline function toString() : String
	{
		return this;
	}
}

@:forward
abstract OrderByOperation1( SqlString )
{
	@:extern
	public inline function new( str : String )
	{
		this = new SqlString( str );
	}
	@:extern
	public inline function asc( column : Dynamic ) : OrderByOperation2
	{
		return new OrderByOperation2( this + column + " ASC");
	}
	@:extern
	public inline function desc( column : Dynamic ) : OrderByOperation2
	{
		return new OrderByOperation2( this + column + " DESC");
	}
}

@:forward
abstract OrderByOperation2( SqlString )
{
	@:extern
	public inline function new( str : String )
	{
		this = new SqlString( str );
	}
	@:extern
	public inline function asc( column : Dynamic ) : SqlString
	{
		return new SqlString( this + ", " + column + " ASC");
	}
	@:extern
	public inline function desc( column : Dynamic ) : SqlString
	{
		return new SqlString( this + ", " + column + " DESC");
	}
}