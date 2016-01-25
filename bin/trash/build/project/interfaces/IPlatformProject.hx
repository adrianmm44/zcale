package zcale.build.project.interfaces;

interface IPlatformProject<T> extends IProject<T>
{
	public var createIndex 	: Bool;
	public var createAssets : Bool;
}