package zcale.settings;

class MainSettings 
{	                                          
	public static inline var flashTargetName : String = "flash";
	public static inline var flashOutputPath : String = "/swf";
	public static inline var flashExtension  : String = ".swf";
	public static inline var flashVersion    : String = "9";
	                                         
	public static inline var jsTargetName 	 : String = "js";
	public static inline var jsOutputPath 	 : String = "/js";
	public static inline var jsExtension  	 : String = ".js";	
	public static inline var jqueryName   	 : String = "jquery";
	
	public static inline var nekoTargetName  : String = "neko";
	public static inline var nekoOutputPath	 : String = "/neko";
	public static inline var nekoExtension 	 : String = ".n";
	                                         
	public static inline var phpTargetName 	 : String = "php";
	public static inline var phpOutputPath 	 : String = "/php";
	public static inline var phpExtension  	 : String = ".php";
	public static inline var phpVersion  	 : String = "5.1.0";
		
	public static inline var macroTargetName : String = "macro";
	
	
	#if flash
		public static inline var targetName : String = flashTargetName;
	#elseif js
		public static inline var targetName : String = jsTargetName;
	#elseif neko
		public static inline var targetName : String = nekoTargetName;
	#elseif php
		public static inline var targetName : String = phpTargetName;
	#else
		#error "target unknown"
	#end
	
		
	#if flash
		public static inline var targetOutputPath : String = flashOutputPath;
	#elseif js
		public static inline var targetOutputPath : String = jsOutputPath;
	#elseif neko
		public static inline var targetOutputPath : String = nekoOutputPath;
	#elseif php
		public static inline var targetOutputPath : String = phpOutputPath;
	#else
		#error "target unknown"
	#end
	
		
	#if flash
		public static inline var targetExtension : String = flashExtension;
	#elseif js
		public static inline var targetExtension : String = jsExtension;
	#elseif neko
		public static inline var targetExtension : String = nekoExtension;
	#elseif php
		public static inline var targetExtension : String = phpExtension;
	#else
		#error "target unknown"
	#end
}