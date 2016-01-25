import zcale.build.Builder;

import zcale.sys.db.Sql;

class Test {
	
	private static var builder : Builder;
	private static var testDir : String  = "bin/tests/";
	
	public static function main() {
		
		builder = Builder.getInstance();
		
		//Tests:	
		buildTest();
		//xmlTest();
		//htmlTest();
		//cssTest();
		
		// database
		
		// sqlTest();
		// dbTest();
		
		// angularTest();
		
		builder.buildHxml();
		
		// var pathTest = builder.create.webProject('zcale.tests.PathTest');
		// pathTest.createHtAccess = true;
		// var databaseTest = builder.create.macroProject("zcale.sys.db.tests.DatabaseTest");
		// .addProject( pathTest )
		// .addProject( builder.create.macroProject('zcale.tests.PathToolsTest'));
	}
	
	private static function buildTest() : Void {
		
		builder.add([
			Builder.project.js("dir1.ClassName", "outputPath")
		]);
	}
	
	private static function xmlTest() : Void {
		
		builder.add([ 
			Builder.project.xml("zcale.xml.tests.XmlTest", testDir + "xmlTest" )
				.createIndex.set( true )
		]);
	}
	
	private static function htmlTest() : Void {		
		builder.add([
			Builder.project.html("zcale.view.html.tests.HtmlTest", testDir + "htmlTest" )
		]);
	}
	
	private static function cssTest() : Void {		
		builder.add([
			Builder.project.css("zcale.view.css.tests.CssTest", testDir + "cssTest" )
				.browsers.stateOfArt()
		]);
	}
	
	private static function sqlTest() : Void {		
		builder
			.addProject( Builder.project.js("zcale.sys.db.tests.SqlTest", "bin" )
				
			)
			.addProject( Builder.project.buildMacro("zcale.sys.db.tests.SqlTest") 
		);
	}
	
	private static function dbTest() : Void {
		
		var dbTest = Builder.project.php("zcale.sys.db.tests.DatabaseTest", testDir + "dbTest");
		
		builder.addProject( dbTest );
	}
	
	private static function angularTest() : Void {
		
		var ngTestDir : String = testDir + "angularTest";
		var ngLibName : String = "angular.haxe";
		
		//var ngTest = Builder.project.html("zcale.js.angular.tests.AngularTest", testDir + "angularTest").browsers.modern();
		//project.php("zcale.sys.db.tests.DatabaseTest", testDir + "dbTest");
		builder
		.addProject(  
			Builder.project.html("zcale.js.angular.tests.AngularTest", ngTestDir )
				.browsers.modern()
		)
		.addProject(
			Builder.project.js("zcale.js.angular.tests.AngularTestJs", ngTestDir )
				.libs.add( ngLibName )
		)
		;
	}
}