package zcale.seo.productFeed.interfaces;

interface IProductField
{
	public function exists() : Bool;
	public function isset()  : Bool;
	public function toXml()  : Xml;
}