package zcale.core.path.targets;

import sys.net.Host;
import haxe.web.Request;
import haxe.ds.StringMap;
import zcale.macros.php.ServerParams;

using zcale.tools.PathTools;
using zcale.types.helpers.StringHelper;

class ServerPath
{
	public static var DIR( 			 get, never ) : String;
	public static var URL( 			 get, never ) : String;	
	public static var ROOT_URL( 	 get, never ) : String;	
	public static var ROOT_DIR( 	 get, never ) : String;	
	//public static var FILE_DIR( 	 get, never ) : String;
	public static var RELATIVE(  	 get, never ) : String;
	public static var PARAMS( 		 get, never ) : StringMap<String>;
	public static var PARAMS_STRING( get, never ) : String;
	
	private static var dir 			: String;	
	private static var url 			: String;	
	private static var rootUrl 		: String;	
	private static var rootDir 		: String;
	private static var fileDir 		: String;
	private static var relativePath : String;
	private static var params 		: StringMap<String>;
	private static var paramsString : String;
	
	private static function get_DIR() : String
	{
		if( dir == null ){
			dir = ROOT_DIR + RELATIVE;
		}		
		return dir;
	}
		
	private static function get_URL() : String
	{
		if( url == null ){
			url = ROOT_URL + RELATIVE + PARAMS_STRING;
		}
		return url;
	}
	
	private static function get_ROOT_URL() : String
	{
		if( rootUrl == null )
		{
			var protocol  : String = "http://"; //default value
			var localhost : String = Host.localhost();
			#if php
				protocol = ServerParams.SERVER_PROTOCOL;
				protocol = protocol.substr( 0 , protocol.indexOf('/') ).toLowerCase() + '://';
			#end
			rootUrl = protocol + localhost + get_FILE_DIR();
		}
		return rootUrl;
	}
	
	private static function get_ROOT_DIR() : String
	{
		if( rootDir == null ){
			rootDir = Sys.getCwd().removeEndDelimiter();
		}
		return rootDir;
	}
	
	private static function get_FILE_DIR() : String
	{
		if( fileDir == null ){
			#if php
				fileDir = ROOT_DIR.substr( ServerParams.DOCUMENT_ROOT.length );
			#else
				var newPath : String = "";
				var uriPath : String = Request.getURI();
			
				while( ROOT_DIR.contains( newPath + uriPath.firstElement()) && uriPath.length > 0 )
				{
					newPath += uriPath.firstElement();
					uriPath =  uriPath.removeFirstElement();
				}
			
				if( ROOT_DIR.endsWith(  newPath )){
					fileDir = newPath;
				}
				else {
					fileDir = "";
				}
			#end
		}		
		return fileDir;
	}
	
	private static function get_RELATIVE() : String
	{
		if( relativePath == null ){
			relativePath = Request.getURI();
			relativePath = relativePath.substr( get_FILE_DIR().length );
		}
		return relativePath;
	}
	
	private static function get_PARAMS() : StringMap<String>
	{
		if( params == null ){
			params = Request.getParams();
		}		
		return params;
	}
	
	private static function get_PARAMS_STRING() : String
	{
		if( paramsString == null ){
			#if php
				paramsString = php.Web.getParamsString();
			#else
				paramsString = PathTools.paramsToString( PARAMS );
			#end	
			if( paramsString.length > 0 ){
				paramsString = "?" + paramsString;
			}
		}
		return paramsString;
	}
}