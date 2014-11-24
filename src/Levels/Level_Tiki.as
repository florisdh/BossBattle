package Levels 
{
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	import GameObjects.Bosses.Boss;
	import GameObjects.Bosses.Boss_Tiki;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Level_Tiki extends Level 
	{
		
		public function Level_Tiki(engine:Engine) 
		{
			var spawnPos:Vector3D = new Vector3D(580, -400);
			var targetPos:Vector3D = new Vector3D(spawnPos.x, 150);
			
			super(engine, new Art_Background(), new Boss_Tiki(spawnPos, targetPos));
			
		}
		
	}

}