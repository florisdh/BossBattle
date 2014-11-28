package UI.Menus 
{
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;

	/**
	 * ...
	 * @author FDH
	 */
	public class StartMenu extends Menu 
	{
		// -- Events -- //
		
		public static const START:String = "Start";
		
		// -- Vars -- //
		var _sountTrack:Sound = new Aud_soundtrack();
		
		private var _startButton:SimpleButton;
		
		// -- Construct -- //
		
		public function StartMenu() 
		{
			super();
			soundLoop();
			
			addChild(new Art_Startscherm());
			addButton(new Art_Startbutton(), 250, 350, START);
			
		}
		

		
		private function soundLoop():void
		{
			var chanel:SoundChannel = _sountTrack.play();
			chanel.addEventListener(Event.SOUND_COMPLETE,soundComplete)

		}
		
		private function soundComplete(e:Event):void 
		{
			SoundChannel(e.target).removeEventListener(e.type, soundComplete);
			soundLoop();
		}
		
	}

}