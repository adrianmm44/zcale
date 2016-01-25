package prestashop.db;

import zcale.sys.db.Table;
import zcale.sys.db.ColumnTypes;

private typedef Self = ProductLang;

class ProductLang extends Table<Self>
{
	public var id_product    : IntType<Self>;
	public var name 	     : Varchar<Self>;
	public var description   : Text<Self>;
	public var link_rewrite  : Varchar<Self>;
	public var available_now : Varchar<Self>;
	
	public function new( prefix : String )
	{
		super( this, prefix + "product_lang" );
		
		id_product    = new IntType( this, "id_product", 10 );
		name	      = new Varchar( this, "name", 128 );
		description   = new Text( 	 this, "description" );
		link_rewrite  = new Varchar( this, "link_rewrite" );
		available_now = new Varchar( this, "available_now" );
	}
}