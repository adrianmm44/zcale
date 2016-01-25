package prestashop.db;

import zcale.sys.db.Table;
import zcale.sys.db.ColumnTypes;

private typedef Self = Product;

class Product extends Table<Self>
{
	public var id_product 		   : IntType<Self>;
	public var id_category_default : IntType<Self>;
	public var id_manufacturer 	   : IntType<Self>;
	public var ean13 			   : Varchar<Self>;	
	public var price 	  		   : Decimal<Self>;
	public var unit_price_ratio    : Decimal<Self>;
	public var reference 		   : Varchar<Self>;
	public var out_of_stock 	   : IntType<Self>;
	public var available_for_order : TinyInt<Self>;
	public var condition  		   : EnumType<Self>;
	
	public function new( pefix : String )
	{
		super( this, pefix + "product" );
		
		id_product 			= new IntType(  this, "id_product", 10 );
		id_category_default = new IntType(  this, "id_category_default", 10 );
		id_manufacturer 	= new IntType( 	this, "id_manufacturer", 10 );
		ean13				= new Varchar( 	this, "ean13", 13 );
		price	   			= new Decimal(  this, "price", 20.6 );
		unit_price_ratio	= new Decimal(  this, "unit_price_ratio", 20.6 );
		reference			= new Varchar( 	this, "reference", 32 );
		out_of_stock 		= new IntType(  this, "out_of_stock", 10 );
		available_for_order = new TinyInt(  this, "available_for_order", 1 );
		condition  			= new EnumType( this, "condition" );
	}
}