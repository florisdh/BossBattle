package Factories 
{
	import Levels.Level;
	import Levels.Level_Dion;
	import Levels.Level_Finn;
	import Levels.Level_Mech;
	import Levels.Level_PingBear;
	import Levels.Level_Shade;
	import Levels.Level_Tiki;
	/**
	 * ...
	 * @author FDH
	 */
	public class LevelFactory extends Factory 
	{
		// -- Types -- //
		
		public static const LEVEL_TIKI:int = 0;
		public static const LEVEL_PINGBEAR:int = 1;
		public static const LEVEL_DION:int = 2;
		public static const LEVEL_FINN:int = 3;
		public static const LEVEL_MECH:int = 4;
		public static const LEVEL_SHADE:int = 5;
		
		public static const LEVELS_AMOUNT:int = 6;
		
		// -- Construct -- //
		
		public function LevelFactory() 
		{
		}
		
		// -- Methods -- //
		
		override public function create(type:int, engine:Engine):*
		{
			switch (type) 
			{
				case LEVEL_TIKI:
					return new Level_Tiki(engine);
				break;
				case LEVEL_PINGBEAR:
					return new Level_PingBear(engine);
				break;
				case LEVEL_DION:
					return new Level_Dion(engine);
				break;
				case LEVEL_FINN:
					return new Level_Finn(engine);
				break;
				case LEVEL_MECH:
					return new Level_Mech(engine);
				break;
				case LEVEL_SHADE:
					return new Level_Shade(engine);
				break;
				default:
					return null;
			}
		}
	}

}