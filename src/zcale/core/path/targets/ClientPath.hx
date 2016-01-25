package zcale.core.path.targets;

#if flash
	import flash.external.ExternalInterface;
#elseif js
	import js.Browser;
#end
import haxe.ds.StringMap;

using zcale.tools.PathTools;
using zcale.types.helpers.StringHelper;

class ClientPath
{	
	public static inline var HASHBANG : String = "#!";
	
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
			dir = ROOT_DIR + RELATIVE.removeFrontDelimiter();
		}
		return dir;
	}
		
	private static function get_URL() : String
	{
		if( url == null ){
			#if flash
				url = ExternalInterface.call('function(){ return window.location.href; }');
			#elseif js
				url = Browser.location.href;
			#end
		}
		return url;
	}
	
	private static function get_ROOT_URL() : String
	{
		if( rootUrl == null )
		{
			var url : String = URL;
			if( url.contains( HASHBANG )){
				rootUrl = url.substr( 0, url.indexOf( HASHBANG ) + HASHBANG.length );
			}
			else {
				rootUrl = ROOT_DIR;
			}
		}
		return rootUrl;
	}
				
	private static function get_ROOT_DIR() : String
	{
		if( rootDir == null ){
			#if flash
				rootDir = ExternalInterface.call('function(){ return window.location.protocol + "//" + window.location.host; }');
			#elseif js
				rootDir = Browser.location.protocol + '//' + Browser.location.host;
			#end
			rootDir += get_FILE_DIR();
		}
		return rootDir;
	}
		
	private static function get_FILE_DIR() : String
	{
		if( fileDir == null ){
			#if flash
				fileDir = ExternalInterface.call('function(){ return window.location.pathname; }');
			#elseif js
				fileDir = Browser.location.pathname;
			#end
		}
		return fileDir;
	}
		
	private static function get_RELATIVE() : String
	{
		if( relativePath == null )
		{
			relativePath = '';
			var url : String = ClientPath.URL;
			
			if( url.contains( HASHBANG )){
				relativePath = url.substr( url.indexOf( HASHBANG ) + HASHBANG.length );
				
				if( relativePath.contains('?')){
					relativePath = relativePath.substr( 0, relativePath.indexOf('?'));
				}
			}
		}
		return relativePath;
	}
		
	private static function get_PARAMS() : StringMap<String>
	{
		if( params == null )
		{
			var map = new StringMap<String>();
			var str = paramsString.substr( 1 );						
			if( str.contains('='))
			{
				for( element in str.split('&'))
				{
					var name  : String = element.substr( 0, element.indexOf('='));
					var value : String = element.substr( element.indexOf('=') + 1 );
					map.set( name, value );
				}
			}
			params = map;
		}
		return params;
	}
	
	private static function get_PARAMS_STRING() : String
	{
		if( paramsString == null )
		{
			var str : String = paramsString = '';
			var url : String = URL;
			if( url.contains( HASHBANG )){
				str = url.substr( url.indexOf( HASHBANG ));
				
				if( str.contains('?')){
					paramsString = str.substr( str.indexOf('?'));
				}
			}
		}	
		return paramsString;
	}
}