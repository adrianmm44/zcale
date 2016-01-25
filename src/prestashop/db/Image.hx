package prestashop.db;

import zcale.sys.db.Table;
import zcale.sys.db.ColumnTypes;

private typedef Self = Image;

class Image extends Table<Image>
{
	public var id_product : IntType<Self>;
	public var id_image   : IntType<Self>;
	public var position   : SmallInt<Self>;
	public var cover 	  : TinyInt<Self>;
	
	public function new( prefix : String )
	{
		super( this, prefix + "image" );
		
		id_product = new IntType(  this, "id_product", 10 );
		id_image   = new IntType(  this, "id_image", 10 );
		position   = new SmallInt( this, "position", 2 ) ;
		cover 	   = new TinyInt(  this, "cover", 1 );
	}
}