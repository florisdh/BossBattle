package Interfaces 
{
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author FDH
	 */
	public interface IKeyInputHandler 
	{
		function onKeyDown(e:KeyboardEvent):void;
		function onKeyUp(e:KeyboardEvent):void;
	}
	
}