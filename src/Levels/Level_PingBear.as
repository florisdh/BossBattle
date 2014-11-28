package Levels 
{
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	import GameObjects.Bosses.Boss;
	import GameObjects.Bosses.Boss_PingBear;
	import GameObjects.Bosses.Boss_Tiki;
	import GameObjects.Player;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Level_PingBear extends Level 
	{
		
		public function Level_PingBear(engine:Engine) 
		{
			var spawnPos:Vector3D = new Vector3D(640, -400);
			var targetPos:Vector3D = new Vector3D(spawnPos.x, 150);
			
			super(engine, new Art_Background(), new Boss_PingBear(spawnPos, targetPos));
		}
		
	}

}