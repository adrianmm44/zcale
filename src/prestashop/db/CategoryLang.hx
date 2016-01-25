package prestashop.db;

import zcale.sys.db.Table;
import zcale.sys.db.ColumnTypes;

private typedef Self = CategoryLang;

class CategoryLang extends Table<Self>
{
	public var id_category 	: IntType<Self>;
	public var name 		: Varchar<Self>;
	public var link_rewrite : Varchar<Self>;
		
	public function new( prefix : String )
	{
		super( this, prefix + "category_lang" );
		
		id_category  = new IntType( this, "id_category", 10 );
		name 		 = new Varchar( this, "name", 128 );
		link_rewrite = new Varchar( this, "link_rewrite", 128 );
	}
}