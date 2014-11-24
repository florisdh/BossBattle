package Interfaces 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author FDH
	 */
	public interface IStartable 
	{
		function start(e:Event = null):void;
		function stop(e:Event = null):void;
	}
	
}