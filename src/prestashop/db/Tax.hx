package prestashop.db;

import zcale.sys.db.Table;
import zcale.sys.db.ColumnTypes;

private typedef Self = Tax;

class Tax extends Table<Self>
{
	public var id_tax : IntType<Self>;
	public var rate   : Decimal<Self>;
	
	public function new( prefix : String )
	{
		super( this, prefix + "tax" );
		
		id_tax = new IntType( this, "id_tax", 10 );
		rate   = new Decimal( this, "rate", 10.3 );
	}
}