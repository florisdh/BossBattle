package Levels 
{
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	import GameObjects.Bosses.Boss;
	import GameObjects.Bosses.Boss_Mech;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Level_Mech extends Level 
	{
		
		public function Level_Mech(engine:Engine) 
		{
			var spawnPos:Vector3D = new Vector3D(640, -400);
			var targetPos:Vector3D = new Vector3D(spawnPos.x, 150);
			
			super(engine, new Art_Background(), new Boss_Mech(spawnPos, targetPos));
		}
		
	}

}