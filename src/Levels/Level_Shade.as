package Levels 
{
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	import GameObjects.Bosses.Boss;
	import GameObjects.Bosses.Boss_Shade;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Level_Shade extends Level 
	{
		
		public function Level_Shade(engine:Engine) 
		{
			var spawnPos:Vector3D = new Vector3D(300, -400);
			var targetPos:Vector3D = new Vector3D(spawnPos.x, 150);
			
			super(engine, new Art_Background_Shade(), new Boss_Shade(spawnPos, targetPos));
		}
		
	}

}