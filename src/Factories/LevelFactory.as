package Factories 
{
	import Levels.Level;
	import Levels.Level_Tiki;
	/**
	 * ...
	 * @author FDH
	 */
	public class LevelFactory extends Factory 
	{
		// -- Types -- //
		
		public static const LEVEL_1:int = 0;
		
		// -- Construct -- //
		
		public function LevelFactory() 
		{
		}
		
		// -- Methods -- //
		
		override public function create(type:int, engine:Engine):*
		{
			switch (type) 
			{
				case LEVEL_1:
					return new Level_Tiki(engine);
				break;
				default:
					return null;
			}
		}
	}

}