package GameObjects.Bosses 
{
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Boss_Finn extends Boss 
	{
		
		public function Boss_Finn(spawn:Vector3D, readyPos:Vector3D) 
		{
			super(new Art_FINN(), spawn, readyPos);
			Health.MaxHealth = 3000;
		}
		
	}

}