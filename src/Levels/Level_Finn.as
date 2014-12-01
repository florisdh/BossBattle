package Levels 
{
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	import GameObjects.Bosses.Boss;
	import GameObjects.Bosses.Boss_Finn;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Level_Finn extends Level 
	{
		
		public function Level_Finn(engine:Engine) 
		{
			var spawnPos:Vector3D = new Vector3D(550, -400);
			var targetPos:Vector3D = new Vector3D(spawnPos.x, 250);
			
			super(engine, new art_bgfinn(), new Boss_Finn(spawnPos, targetPos));
		}
		
	}

}