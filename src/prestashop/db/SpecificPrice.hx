package prestashop.db;

import zcale.sys.db.Table;
import zcale.sys.db.ColumnTypes;

private typedef Self = SpecificPrice;

class SpecificPrice extends Table<Self>
{
	public var id_product : IntType<Self>;
	public var reduction  : Decimal<Self>;
	
	public function new( prefix : String )
	{
		super( this, prefix + "specific_price" );
		
		id_product = new IntType( this, "id_product", 10 );
		reduction  = new Decimal( this, "reduction", 20.6 );
	}
}