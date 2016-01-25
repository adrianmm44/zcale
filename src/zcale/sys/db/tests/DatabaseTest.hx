package zcale.sys.db.tests;

import sys.db.Connection;
import zcale.sys.db.Sql;
import zcale.sys.db.tests.Zcale;
import zcale.sys.db.tests.zcale.Naw;

class DatabaseTest
{
	public static function main()
	{
		new DatabaseTest().run();				
	}
	
	private var db  : Zcale;
	private var cnx : Connection;
	
	public function new()
	{
		db  = new Zcale();
		cnx = db.connect();
	}
	
	public function run() : Void
	{
		// createDatabase();
		// createTable();
		// insertRecords();
		// deleteRecords();
		selectRecords();
		// updateRecords();
		cnx.close();
	}
	
	private function createDatabase() : Void
	{
		var sql : String = Sql.query
			.create
			.database( db )
			.ifNotExists();
		
		cnx.request( sql );
				
		Sys.print("<br/>Database " + db + " created: " + sql );
	}
	
	private function createTable() : Void
	{
		var naw  = new Naw();		
		// var sql = Sql.query.create.table( t1.getSql() ).ifNotExists();
		// trace( sql );		
		// db.connect().request( Sql.query.create.table( t1.getSql() ).ifNotExists() );
	}
	
	private function insertRecords() : Void
    {
        var t1 = new Naw()
			.voornaam.set("Adrian")
			.naam.set("Martinez")
			.straat.set("Bolacaciahof 25")
			.postcode.set("1324AL")
			.plaats.set("Almere");
		
		var t2 = new Naw()
			.voornaam.set("Esmee")
			.naam.set("Riemens")
			.straat.set("Bolacaciahof 25")
			.postcode.set("1234AL")
			.plaats.set("Almere");
		
		var t3 = new Naw()
			.voornaam.set("Esmee")
			.naam.set("Riemens")
			.straat.set("Somewhere")
			.postcode.set("???????")
			.plaats.set("Almere");
		
		var sql : String = Sql.query
			.insert( t1, t1.getKeys() )
			.values( t1.getValues() )
			.values( t2.getValues() )
			.values( t3.getValues() );
		
		cnx.request( sql );
		
		Sys.print("<br/>Records inserted in " + t1 + ": " + sql );
    }

	private function deleteRecords() : Void
    {
        var naw = new Naw();
        var sql : String = Sql.query
			.delete.from( naw )
			.where( naw.straat )
			.is("Somewhere");
		
		cnx.request( sql );
		
		Sys.print("<br/>Records deleted in " + naw + ": " + sql );
    }
		
    private function selectRecords() : Void
    {
        var naw = new Naw();
		var sql : String = Sql.query
			.selectAll
			.from( naw )
			.where( naw.voornaam )
			.is("Esmee");
		
		for( row in cnx.request( sql ) )
		{
			naw.setValues( row );
						
			var str = 
				naw.voornaam.value + " " + 
				naw.naam.value+ " woont op de " + 
				naw.straat.value + ", " + 
				naw.postcode.value + " in " + 
				naw.plaats.value + "<br/>";
			
			Sys.print( str );
		}
		Sys.print("<br/>Records selected from " + naw + ": " + sql );
    }
	
    private function updateRecords() : Void
    {
        var naw = new Naw();
        var sql : String = Sql.query
			.update( naw )
			.set( naw.naam, "Martinez Martinez")
			.where( naw.naam )
			.is("Martinez");
		
		cnx.request( sql );
		
		Sys.print("<br/>Record updated in " + naw + ": " + sql );
    }
}