package Levels 
{
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	import GameObjects.Bosses.Boss;
	import GameObjects.Bosses.Boss_Tiki;
	import GameObjects.Player;
	
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
			
			super(engine, new Art_Background1(), new Boss_Tiki(spawnPos, targetPos));
		}
		
	}

}