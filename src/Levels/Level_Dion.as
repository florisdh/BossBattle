package Levels 
{
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	import GameObjects.Bosses.Boss;
	import GameObjects.Bosses.Boss_Dion;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Level_Dion extends Level 
	{
		
		public function Level_Dion(engine:Engine) 
		{
			//var spawnPos:Vector3D = new Vector3D(580, -400);
			var spawnPos:Vector3D = new Vector3D(540, -100);
			var targetPos:Vector3D = new Vector3D(spawnPos.x, 350);
			
			super(engine, new art_bgdion(), new Boss_Dion(spawnPos, targetPos));
		}
		
	}

}