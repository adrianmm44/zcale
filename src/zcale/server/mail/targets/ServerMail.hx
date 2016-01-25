/////////////////////////////////////////////////////////////////////////////////////////////////////////

package hxf.core.system.mail.targets;

import hxf.core.tools.TextTools;
import hxf.core.tools.MathTools;
import hxf.core.remote.events.RemoteDispatcher;

class ServerMail extends RemoteDispatcher
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////

	public function new( sub : Dynamic, reg : Dynamic )
	{
		super( sub, reg );
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public function send( args : { to 	   	 : Array<String>, 
								   from    	 : String,
								   subject 	 : String,
								   htmlMsg	 : String,
								   ?cc     	 : Array<String>,
								   ?bcc    	 : Array<String>,
								   ?replyTo	 : String,
								   ?errorTo  : String,
								   ?priority : Int,
								   ?company  : String } ) : Void
	{
		if( args.replyTo == null ){
			args.replyTo = args.from;
		}
		
		if( args.errorTo == null ){
			args.errorTo = args.replyTo;
		}
				
		if( args.priority == null ){
			args.priority = 3;
		}
		
		var to 		: String = setEmailAddresses( args.to  );
		var cc 		: String = setEmailAddresses( args.cc  );
		var bcc 	: String = setEmailAddresses( args.bcc );
		var subject : String = args.subject;
		var message : String = args.htmlMsg;
		var envFrom : String = '-f' + TextTools.unWrap( args.errorTo, "<",">");
		var headers : String = 'MIME-Version: 1.0' + "\r\n";
				
		headers += 'Content-type: text/html; charset=iso-8859-1' + "\r\n";
		headers += 'Date: ' 		+ Date.now().toString()   + "\r\n";
		headers += 'Message-ID: <'  + MathTools.getUniqueId() + '-' + TextTools.unWrap( args.from, "<",">") + '>' + "\r\n";
		headers += 'To: ' 			+ to 	 	   	+ "\r\n";
		headers += 'From: ' 		+ args.from 	+ "\r\n";
		headers += 'Reply-To: ' 	+ args.replyTo  + "\r\n";
		headers += 'Return-Path: ' 	+ args.errorTo  + "\r\n";		
		headers += 'X-Priority: ' 	+ args.priority + "\r\n";
				
		if( cc.length > 0 ){
			headers += 'Cc: ' + cc + "\r\n";
		}
		
		if( bcc.length > 0 ){
			headers += 'Bcc: ' + bcc + "\r\n";
		}
		
		if( args.company != null ){
			headers += 'Organization: ' + args.company 	+ "\r\n";
		}
		
		message = TextTools.removeSuperfluousSpace( message );
		message = TextTools.wordWrap(  message, 70, "\r\n" );
		
		try
		{
			eventData().remoteData = sendMail( subject, message, headers, envFrom );
			
			dispatchEvent( eventType().complete );
		}
		catch( errorMessage : Dynamic )
		{			
			dispatchError( eventData().error, this, "send", errorMessage );
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function sendMail( subject : String, 
							   message : String, 
							   headers : String, 
							   envFrom : String ) : Bool
	{
		return false; // this method needs to be overridden
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private function setEmailAddresses( ?addresses : Array<String> ) : String
	{
		var str : String = "";
		
		if( addresses != null )
		{
			for( address in addresses )
			{
				str += address + ", ";
			}
			
			str = str.substr( 0, str.lastIndexOf(",") );
		}
		
		return str;
	}
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////