package UI.Menus 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author FDH
	 */
	public class DeathMenu extends Menu 
	{
		public static const MAINMENU:String = "MAINMENU";
		
		public function DeathMenu() 
		{
			super();
			addButton(new TempArt_BackBtn(), 100, 100, MAINMENU);			
		}
	}
}