package prestashop.db;

import zcale.sys.db.Table;
import zcale.sys.db.ColumnTypes;

private typedef Self = ImageType;

class ImageType extends Table<Self>
{
	public var id_image_type : IntType<Self>;
	public var name 		 : Varchar<Self>;
	
	public function new( prefix : String )
	{
		super( this, prefix + "image_type" );
		
		id_image_type = new IntType( this, "id_image_type", 10 );
		name 		  = new Varchar( this, "name", 64 );
	}
}