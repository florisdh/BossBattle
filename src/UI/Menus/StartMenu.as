package UI.Menus 
{
	import flash.display.SimpleButton;
	import flash.media.Sound;

	/**
	 * ...
	 * @author FDH
	 */
	public class StartMenu extends Menu 
	{
		// -- Events -- //
		
		public static const START:String = "Start";
		
		// -- Vars -- //
		var sountTrack:Sound = new Aud_soundtrack.wav();
		
		private var _startButton:SimpleButton;
		
		// -- Construct -- //
		
		public function StartMenu() 
		{
			super();
			sountTrack.play();
			
			addChild(new Art_Startscherm());
			addButton(new Art_Startbutton(), 250, 350, START);
		}
		
	}

}