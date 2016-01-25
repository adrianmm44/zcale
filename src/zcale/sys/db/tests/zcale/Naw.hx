package zcale.sys.db.tests.zcale;

import zcale.sys.db.Table;
import zcale.sys.db.ColumnTypes;

class Naw extends Table<Naw>
{
	public var id			 : IntType<Naw>;
	public var voornaam		 : Varchar<Naw>;
    public var tussenvoegsel : Varchar<Naw>;
	public var naam			 : Varchar<Naw>;    
    public var straat		 : Varchar<Naw>;
    public var postcode		 : Varchar<Naw>;
    public var plaats		 : Varchar<Naw>;
	
	public function new()
	{
		super( this, 'naw');
		
		id 			  = new IntType( this, "id" );
		voornaam	  = new Varchar( this, "voornaam" );
		tussenvoegsel = new Varchar( this, "tussenvoegsel", 50 );
		naam		  = new Varchar( this, "naam" );
		straat		  = new Varchar( this, "straat" );
		postcode	  = new Varchar( this, "postcode", 6 );
		plaats		  = new Varchar( this, "plaats" );
	}
}