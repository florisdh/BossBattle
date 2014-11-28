package GameObjects.Bosses 
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Boss_PingBear extends Boss 
	{
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Boss_PingBear(spawn:Vector3D, readyPos:Vector3D) 
		{
			super(new Art_Pingbear(), spawn, readyPos);
			
			Health.MaxHealth = 500;
			
			_art.x = -_art.width / 2;
			_art.y = -_art.height / 2;
			
			_stateSwitchTimer.delay = 4000;
		}
		
		// -- Methods -- //
		
		override protected function onStateSwitch(e:TimerEvent):void 
		{
			
		}
		
	}

}