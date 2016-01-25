package zcale.sys.db;

class Database
{
	public var name : String;
	
	//private var info : DatabaseInfo;
	
	public function new( name : String )
	{
		this.name = name;
		// this.info = new DatabaseInfo();
	}
		
	public function toString() : String
	{
		return name;
	}
}
/*/
private class DatabaseInfo
{
	public var encoding  : String = "utf8";
	public var collation : String = "utf8_general_ci";
}
/*/