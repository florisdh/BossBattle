package Factories 
{
	import Levels.Level;
	import Levels.Level_Dion;
	import Levels.Level_Tiki;
	/**
	 * ...
	 * @author FDH
	 */
	public class LevelFactory extends Factory 
	{
		// -- Types -- //
		
		public static const LEVEL_TIKI:int = 0;
		public static const LEVEL_DION:int = 1;
		
		public static const LEVELS_AMOUNT:int = 2;
		
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
				case LEVEL_DION:
					return new Level_Dion(engine);
				break;
				default:
					return null;
			}
		}
	}

}