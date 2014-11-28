package GameObjects.Bosses 
{
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Boss_Shade extends Boss 
	{
		
		public function Boss_Shade(spawn:Vector3D, readyPos:Vector3D) 
		{
			super(new Shade_Animations(), spawn, readyPos);
			
			Health.MaxHealth = 10000;
		}
		
	}

}