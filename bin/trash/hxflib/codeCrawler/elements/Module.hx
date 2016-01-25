/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxflib.codeCrawler.elements;

import hxf.core.events.EventDispatcher;
import hxf.core.loaders.TextLoader;
import hxf.core.tools.PathTools;

import hxflib.codeCrawler.Code;
import hxflib.codeCrawler.elements.Module;
import hxflib.codeCrawler.elements.overall.Comment;
import hxflib.codeCrawler.elements.module.Package;
import hxflib.codeCrawler.elements.module.Import;
import hxflib.codeCrawler.elements.module.MetaData;
import hxflib.codeCrawler.elements.types.Typedef;
import hxflib.codeCrawler.elements.types.BodyElement;
import hxflib.codeCrawler.elements.types.ClassType;
import hxflib.codeCrawler.elements.types.Interface;
import hxflib.codeCrawler.elements.types.EnumType;
import hxflib.codeCrawler.elements.macro.IfElseMacro;
import hxflib.codeCrawler.elements.access.PrivateAccess;
import hxflib.codeCrawler.interfaces.ICodeElement;

class Module extends CodeElement
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var code 	: Code;
	public var pkg 		: Package;
	public var name 	: String;
	public var type 	: String;
	public var path( get, null ) : String;
	public var filePath : String;	
	public var imports 	: Array<Import>;
	public var classes  : Array<BodyElement>;
	
	public var printComments : Bool = true;	
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new( reg : Dynamic, filePath : String )
	{
		super( this, reg );
				
		this.filePath = filePath;
		name = PathTools.fileName( filePath );
		
		if( name.indexOf(".") > 0 ){
			name = name.substr( 0, name.lastIndexOf(".") );
		}
		
		imports = new Array();
		classes = new Array();
				
		this.addPotentialElement( new Comment( 		  registry ) );
		this.addPotentialElement( new IfElseMacro( 	  registry ) );
		this.addPotentialElement( new Package( 		  registry ) );
		this.addPotentialElement( new Import(  		  registry ) );
		this.addPotentialElement( new ClassElement(   registry ) );
		this.addPotentialElement( new Interface( 	  registry ) );
		this.addPotentialElement( new EnumElement( 	  registry ) );
		this.addPotentialElement( new Typedef( 		  registry ) );
		this.addPotentialElement( new MetaData( 	  registry ) );
		this.addPotentialElement( new PrivateElement( registry ) );
		
		this.addEventListener( eventType().parsePackage, onParsePackage );
		this.addEventListener( eventType().complete, 	 onParseComplete );
		
		modules.openModule( this );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function parse() : Void
	{
		var loader = new TextLoader();		
		loader.addEventListener( loader.eventType().complete, onLoadComplete );
		loader.addEventListener( loader.eventType().error, 	  onLoadError );
		loader.load( filePath );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onLoadComplete( loader : TextLoader ) : Void
	{
		code = new Code( loader.eventData().text );
		
		startParse();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onLoadError( loader : TextLoader ) : Void
	{
		dispatchError( loader.eventData().error, this, "parse" );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onParsePackage( module : Module ) : Void
	{
		modules.registerModule( get_path() );
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function onParseComplete( module : Module ) : Void
	{
		modules.closeModule();
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	private function get_path() : String
	{
		if( pkg.packagePath.length > 0 )
		{
			return pkg.packagePath + "." + name;
		}
		else {
			return name;
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public override function toString() : String
	{
		syntax = "";
		
		for( element in registeredElements )
		{
			if( Std.is( element, Comment ) == false )
			{
				syntax += element.toString();
			}
			else if( printComments == true )
			{
				syntax += element.toString();
			}
		}
		
		return syntax;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////