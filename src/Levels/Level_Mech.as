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
			var spawnPos:Vector3D = new Vector3D(580, -400);
			var targetPos:Vector3D = new Vector3D(spawnPos.x, 250);
			
			super(engine, new art_dildo(), new Boss_Mech(spawnPos, targetPos));
		}
		
	}

}