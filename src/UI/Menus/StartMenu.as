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
		public static const UPGRADE:String = "Upgrade";
		
		// -- Vars -- //
		
		private var _startButton:SimpleButton;
		
		// -- Construct -- //
		
		public function StartMenu() 
		{
			super();
			addChild(new Art_Startscherm());
			addButton(new TempArt_Menu_StartButton(), 100, 100, START);
			addButton(new TempArt_Menu_UpgradeBtn(), 100, 200, UPGRADE);
		}
		
	}

}