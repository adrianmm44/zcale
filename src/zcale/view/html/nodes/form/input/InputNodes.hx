package zcale.view.html.nodes.form.input;

import zcale.view.html.nodes.form.FormNodes;

class InputText extends Input
{
	public function new( name : String )
	{
		super( name, Input.TEXT );
	}
}

class InputPassword extends Input
{
	public function new( name : String )
	{
		super( name, Input.PASSWORD );
	}
}

class InputRadio extends Input
{
	public function new( name : String )
	{
		super( name, Input.RADIO );
	}
}

class InputCheckbox extends Input
{
	public function new( name : String )
	{
		super( name, Input.CHECKBOX );
	}
}

class InputTel extends Input
{
	public function new( name : String )
	{
		super( name, Input.TEL );
	}
}

class InputSubmit extends Input
{
	public function new( name : String )
	{
		super( name, Input.SUBMIT );
	}
}

/*/
button
checkbox
color
date
datetime
datetime-local
email
file
hidden
image
month
number
password
radio
range
reset
search
submit
tel
text
time
url
week
/*/