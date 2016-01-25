
//import zcale.Path;
import zcale.types.*;
import zcale.types.chains.*;
import zcale.types.mixed.*;

class TestTypes {
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public static function main() {
		
		new TestTypes()
			//.testArrayType()			
			//.testStringChain()
			//.testArrayChain()
			//.testBoolChain()
			//.testFloatString()
			//.testString()
			//.testPath()
			;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var array  : ArrayType<String>;	
	private var path   : String;
	
	public function new(){}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function testArrayType() : TestTypes {
		
		array = ["a","b","c"];
		var array2 = array;
		var array3 = getArray();
		setArray( array );
		return this;
	}
	
	private function getArray() : Array<String> {
		
		return array;
	}
	
	private function setArray( a : Array<String> ) : Void {
		
		array = a;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function testStringChain() : TestTypes {
		
		var str = new StringChain( this );
		str.set("abc");
		trace( str );
		trace( str.value );
		trace( str.isset() );
		return this;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function testArrayChain() : TestTypes {
		
		var array = new ArrayChain( this );
		array.set(["a","b","c"]);
		trace( array );
		return this;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function testBoolChain() : TestTypes {
		
		var bool = new BoolChain( this );
		bool.set( true );
		
		if( bool ) {
			trace( bool.value );
		}
		trace( bool.isTrue() );
		trace( bool.isFalse() );
		return this;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	public function testFloatString() : TestTypes {
		
		setFloatString( 123 );
		setFloatString("abc");
		return this;
	}
	
	private function setFloatString( v : FloatString ) : Void {
		
		if( v.isString() ) {
			trace( v );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}