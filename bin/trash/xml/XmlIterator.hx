/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxf.core.xml;

import hxf.core.xml.XmlData;
import hxf.core.interfaces.IIterator;

class XmlIterator implements IIterator
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////
		
	public var current 		  : XmlData;
	
	private var currentLevel  : Int;
	private var previousLevel : Int;
	private var xmlHierarchy  : List<Iterator<Xml>>;
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function new(){}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function parse( str : String ) : Void
	{		
		current   	  = new XmlData( Xml.parse( str ).firstChild() );
		currentLevel  = 0;
		previousLevel = 0;
		
		xmlHierarchy  = new List();
		xmlHierarchy.push( current.node.iterator() );
	}	
			
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function hasNext() : Bool
	{		
		previousLevel = currentLevel;
		
		if( hasNextNode() == true )
		{			
			setCurrentNode();
			
			return true;
		}
		else {
			return false;
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function hasNextNode() : Bool
	{
		var result : Bool;
		
		while( xmlHierarchy.isEmpty() == false && xmlHierarchy.first().hasNext() == false )
		{
			xmlHierarchy.pop();
			currentLevel--;
		}
		
		if( xmlHierarchy.isEmpty() == false &&  xmlHierarchy.first().hasNext() == true )
		{
			result = true;
			
			current.node = xmlHierarchy.first().next();
			
			if( current.node.nodeType == Xml.Element )
			{
				xmlHierarchy.push( current.node.iterator() );
				currentLevel++;
			}
			else if( current.node.nodeType == Xml.PCData && StringTools.trim( current.node.nodeValue ).length == 0 )
			{
				result = hasNextNode();
			}
		}
		else {
			result = false;
		}
		
		return result;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function setCurrentNode() : Void
	{
		current = new XmlData( current.node );
		current.levelChange = previousLevel - currentLevel;
		
		if( current.levelChange < 0 )
		{
			current.isChild = true;
		}
		else if( current.levelChange == 0 )
		{
			current.isSibling = true;
		}
		else if( current.levelChange > 0 )
		{
			current.isParent = true;
			current.levelChange++;
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
		
	public function next() : Xml
	{		
		return current.node;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////