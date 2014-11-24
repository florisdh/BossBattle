package Levels 
{
	import flash.display.MovieClip;
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
			super(engine, new Art_Background(), new Boss_Tiki());
			
			// Set Boss Position
			_boss.x = engine.Parent.stage.width / 2;
			_boss.y = _boss.height / 2 - 200;
		}
		
	}

}