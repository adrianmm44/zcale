package zcale.macros.php;

class ServerParams 
{	
	public static var PHP_SELF( 			get, null ) : String;
	public static var GATEWAY_INTERFACE( 	get, null ) : String;
	public static var SERVER_ADDR( 			get, null ) : String;
	public static var SERVER_NAME( 			get, null ) : String;
	public static var SERVER_SOFTWARE( 		get, null ) : String;
	public static var SERVER_PROTOCOL( 		get, null ) : String;
	public static var REQUEST_METHOD( 		get, null ) : String;
	public static var REQUEST_TIME( 		get, null ) : String;
	public static var REQUEST_TIME_FLOAT( 	get, null ) : String;
	public static var QUERY_STRING( 		get, null ) : String;
	public static var DOCUMENT_ROOT( 		get, null ) : String;
	public static var HTTP_ACCEPT( 			get, null ) : String;
	public static var HTTP_ACCEPT_CHARSET( 	get, null ) : String;
	public static var HTTP_ACCEPT_ENCODING( get, null ) : String;
	public static var HTTP_ACCEPT_LANGUAGE( get, null ) : String;
	public static var HTTP_CONNECTION( 		get, null ) : String;
	public static var HTTP_HOST( 			get, null ) : String;
	public static var HTTP_REFERER( 		get, null ) : String;
	public static var HTTP_USER_AGENT( 		get, null ) : String;
	public static var HTTPS( 				get, null ) : String;
	public static var REMOTE_ADDR( 			get, null ) : String;
	public static var REMOTE_HOST( 			get, null ) : String;
	public static var REMOTE_PORT( 			get, null ) : String;
	public static var REMOTE_USER( 			get, null ) : String;
	public static var REDIRECT_REMOTE_USER( get, null ) : String;
	public static var SCRIPT_FILENAME( 		get, null ) : String;
	public static var SERVER_ADMIN( 		get, null ) : String;
	public static var SERVER_PORT( 			get, null ) : String;
	public static var SERVER_SIGNATURE( 	get, null ) : String;
	public static var PATH_TRANSLATED( 		get, null ) : String;
	public static var SCRIPT_NAME( 			get, null ) : String;
	public static var REQUEST_URI( 			get, null ) : String;
	public static var PHP_AUTH_DIGEST( 		get, null ) : String;
	public static var PHP_AUTH_USER( 		get, null ) : String;
	public static var PHP_AUTH_PW( 			get, null ) : String;
	public static var AUTH_TYPE( 			get, null ) : String;
	public static var PATH_INFO( 			get, null ) : String;
	public static var ORIG_PATH_INFO( 		get, null ) : String;
	
	@:extern
	public static inline function get( param : String ) : String
	{
		return untyped __var__("_SERVER", param );
	}
	
	private static inline function get_PHP_SELF()			  : String { return get("PHP_SELF"); }
	private static inline function get_GATEWAY_INTERFACE() 	  : String { return get("GATEWAY_INTERFACE"); }
	private static inline function get_SERVER_ADDR()		  : String { return get("SERVER_ADDR"); }
	private static inline function get_SERVER_NAME()		  : String { return get("SERVER_NAME"); }
	private static inline function get_SERVER_SOFTWARE()	  : String { return get("SERVER_SOFTWARE"); }
	private static inline function get_SERVER_PROTOCOL()	  : String { return get("SERVER_PROTOCOL"); }
	private static inline function get_REQUEST_METHOD() 	  : String { return get("REQUEST_METHOD"); }
	private static inline function get_REQUEST_TIME() 		  : String { return get("REQUEST_TIME"); }
	private static inline function get_REQUEST_TIME_FLOAT()   : String { return get("REQUEST_TIME_FLOAT"); }
	private static inline function get_QUERY_STRING() 		  : String { return get("QUERY_STRING"); }
	private static inline function get_DOCUMENT_ROOT() 		  : String { return get("DOCUMENT_ROOT"); }
	private static inline function get_HTTP_ACCEPT()		  : String { return get("HTTP_ACCEPT"); }
	private static inline function get_HTTP_ACCEPT_CHARSET()  : String { return get("HTTP_ACCEPT_CHARSET"); }
	private static inline function get_HTTP_ACCEPT_ENCODING() : String { return get("HTTP_ACCEPT_ENCODING"); }
	private static inline function get_HTTP_ACCEPT_LANGUAGE() : String { return get("HTTP_ACCEPT_LANGUAGE"); }
	private static inline function get_HTTP_CONNECTION()	  : String { return get("HTTP_CONNECTION"); }
	private static inline function get_HTTP_HOST() 			  : String { return get("HTTP_HOST"); }
	private static inline function get_HTTP_REFERER() 		  : String { return get("HTTP_REFERER"); }
	private static inline function get_HTTP_USER_AGENT()	  : String { return get("HTTP_USER_AGENT"); }
	private static inline function get_HTTPS() 				  : String { return get("HTTPS"); }
	private static inline function get_REMOTE_ADDR()		  : String { return get("REMOTE_ADDR"); }
	private static inline function get_REMOTE_HOST()		  : String { return get("REMOTE_HOST"); }
	private static inline function get_REMOTE_PORT()		  : String { return get("REMOTE_PORT"); }
	private static inline function get_REMOTE_USER() 		  : String { return get("REMOTE_USER"); }
	private static inline function get_REDIRECT_REMOTE_USER() : String { return get("REDIRECT_REMOTE_USER"); }
	private static inline function get_SCRIPT_FILENAME() 	  : String { return get("SCRIPT_FILENAME"); }
	private static inline function get_SERVER_ADMIN() 		  : String { return get("SERVER_ADMIN"); }
	private static inline function get_SERVER_PORT() 		  : String { return get("SERVER_PORT"); }
	private static inline function get_SERVER_SIGNATURE() 	  : String { return get("SERVER_SIGNATURE"); }
	private static inline function get_PATH_TRANSLATED() 	  : String { return get("PATH_TRANSLATED"); }
	private static inline function get_SCRIPT_NAME() 		  : String { return get("SCRIPT_NAME"); }
	private static inline function get_REQUEST_URI() 		  : String { return get("REQUEST_URI"); }
	private static inline function get_PHP_AUTH_DIGEST() 	  : String { return get("PHP_AUTH_DIGEST"); }
	private static inline function get_PHP_AUTH_USER() 		  : String { return get("PHP_AUTH_USER"); }
	private static inline function get_PHP_AUTH_PW() 		  : String { return get("PHP_AUTH_PW"); }
	private static inline function get_AUTH_TYPE() 			  : String { return get("AUTH_TYPE"); }
	private static inline function get_PATH_INFO() 			  : String { return get("PATH_INFO"); }
	private static inline function get_ORIG_PATH_INFO() 	  : String { return get("ORIG_PATH_INFO"); }
}