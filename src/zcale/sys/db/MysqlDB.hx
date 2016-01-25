package zcale.sys.db;

@:forward
abstract MysqlDB( Database )
{
	@:extern
	public inline function new( name : String )
	{
		this = new Database( name );
	}
	
	@:extern
	public inline function connect(
		host	: String = "localhost",
		user 	: String = "root", 
		pass	: String = "root",
		?port	: Null<Int>,
		?socket	: String ) : sys.db.Connection
	{
		return sys.db.Mysql.connect({ 
			host 	 : host,
			user 	 : user, 
			pass 	 : pass,
			database : this.name,
			port 	 : port,
			socket 	 : socket 
		});
	}
}