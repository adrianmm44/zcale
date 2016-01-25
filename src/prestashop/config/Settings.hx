package prestashop.config;

class Settings
{
	public static var DB_SERVER( 		 get, never ) : String;
	public static var DB_NAME( 			 get, never ) : String;
	public static var DB_USER( 			 get, never ) : String;
	public static var DB_PASSWD( 		 get, never ) : String;
	public static var DB_PREFIX( 		 get, never ) : String;
	/*/
	public static var MYSQL_ENGINE( 	 get, never ) : String;
	public static var PS_CACHING_SYSTEM( get, never ) : String;
	public static var PS_CACHE_ENABLED(  get, never ) : String;
	public static var MEDIA_SERVER_1( 	 get, never ) : String;
	public static var MEDIA_SERVER_2( 	 get, never ) : String;
	public static var MEDIA_SERVER_3( 	 get, never ) : String;
	public static var COOKIE_KEY( 		 get, never ) : String;
	public static var COOKIE_IV( 		 get, never ) : String;
	public static var PS_CREATION_DATE(  get, never ) : String;
	public static var PS_VERSION( 		 get, never ) : String;
	public static var RIJNDAEL_KEY( 	 get, never ) : String;
	public static var RIJNDAEL_IV( 		 get, never ) : String;
	/*/
	
	@:extern
	private static inline function get( constant : String ) : String
	{
		return untyped __php__( constant );
	}
	
	private static inline function get_DB_SERVER() 		   : String { return get("_DB_SERVER_"); }
	private static inline function get_DB_NAME() 		   : String { return get("_DB_NAME_"); }
	private static inline function get_DB_USER() 		   : String { return get("_DB_USER_"); }
	private static inline function get_DB_PASSWD() 		   : String { return get("_DB_PASSWD_"); }
	private static inline function get_DB_PREFIX() 		   : String { return get("_DB_PREFIX_"); }
	/*/
	private static inline function get_MYSQL_ENGINE() 	   : String { return get("_MYSQL_ENGINE_"); }
	private static inline function get_PS_CACHING_SYSTEM() : String { return get("_PS_CACHING_SYSTEM_"); }
	private static inline function get_PS_CACHE_ENABLED()  : String { return get("_PS_CACHE_ENABLED_"); }
	private static inline function get_MEDIA_SERVER_1()    : String { return get("_MEDIA_SERVER_1_"); }
	private static inline function get_MEDIA_SERVER_2()    : String { return get("_MEDIA_SERVER_2_"); }
	private static inline function get_MEDIA_SERVER_3()    : String { return get("_MEDIA_SERVER_3_"); }
	private static inline function get_COOKIE_KEY() 	   : String { return get("_COOKIE_KEY_"); }
	private static inline function get_COOKIE_IV() 		   : String { return get("_COOKIE_IV_"); }
	private static inline function get_PS_CREATION_DATE()  : String { return get("_PS_CREATION_DATE_"); }
	private static inline function get_PS_VERSION() 	   : String { return get("_PS_VERSION_"); }
	private static inline function get_RIJNDAEL_KEY() 	   : String { return get("_RIJNDAEL_KEY_"); }
	private static inline function get_RIJNDAEL_IV() 	   : String { return get("_RIJNDAEL_IV_"); }
	/*/
}