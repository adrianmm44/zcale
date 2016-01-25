
class Transition
{	
	public function transition( v : String ) : Style // A shorthand property for setting the four transition properties 3
	{
		return this;
	}
	
	public function transitionProperty( v : String ) : Style // Specifies the name of the CSS property the transition effect is for 3
	{
		return this;
	}
	
	public function transitionDuration( v : String ) : Style // Specifies how many seconds or milliseconds a transition effect takes to complete 3
	{
		return this;
	}
	
	public function transitionTimingFunction( v : String ) : Style // Specifies the speed curve of the transition effect 3
	{
		return this;
	}
	
	public function transitionDelay( v : String ) : Style // Specifies when the transition effect will start 3
	{
		return this;
	}
}