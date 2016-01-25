package prestashop.db;

import zcale.sys.db.Table;
import zcale.sys.db.ColumnTypes;

private typedef Self = Manufacturer;

class Manufacturer extends Table<Self>
{
	public var id_manufacturer : IntType<Self>;
	public var name 		   : Varchar<Self>;
	
	public function new( prefix : String )
	{
		super( this, prefix + "manufacturer" );
		
		id_manufacturer = new IntType( this, "id_manufacturer", 10 );
		name 			= new Varchar( this, "name", 64 );
	}
}