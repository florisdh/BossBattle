package GameObjects.Bosses 
{
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Boss_Mech extends Boss 
	{
		
		public function Boss_Mech(spawn:Vector3D, readyPos:Vector3D) 
		{
			super(new Art_MechMonster_Anmations(), spawn, readyPos);
			
			Health.MaxHealth = 5000;
			Health.Health = Health.MaxHealth;
			
		}
		
	}

}