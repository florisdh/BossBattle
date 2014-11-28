package GameObjects.Bosses 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Boss_Dion extends Boss 
	{
		
		public function Boss_Dion(spawn:Vector3D, readyPos:Vector3D) 
		{
			super(new Art_Dion(), spawn, readyPos);
			
			Health.MaxHealth = 1500;
			Health.Health = Health.MaxHealth;
		}
		
		override public function update(e:Event = null):void 
		{
			super.update(e);
			
		}
		
	}

}