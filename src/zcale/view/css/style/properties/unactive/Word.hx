
class Word
{	
	public function wordBreak( v : String ) : Style // Specifies line breaking rules for non-CJK scripts 3
	{
		return this;
	}
	
	public function wordSpacing( v : String ) : Style // Increases or decreases the space between words in a text 1
	{
		return this;
	}
	
	public function wordWrap( v : String ) : Style // Allows long, unbreakable words to be broken and wrap to the next line 3
	{
		return this;
	}
}