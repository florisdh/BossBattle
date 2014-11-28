package UI.Menus 
{
	import flash.display.SimpleButton;
	/**
	 * ...
	 * @author FDH
	 */
	public class StartMenu extends Menu 
	{
		// -- Events -- //
		
		public static const START:String = "Start";
		
		// -- Vars -- //
		
		private var _startButton:SimpleButton;
		
		// -- Construct -- //
		
		public function StartMenu() 
		{
			super();
			addChild(new Art_Startscherm());
			addButton(new Art_Startbutton(), 250, 350, START);
		}
		
	}

}