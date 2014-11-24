package GameObjects.Bosses 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Boss_Tiki extends Boss 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Boss_Tiki() 
		{
			super(new Art_Tiki());
			_art.x = -_art.width;
			_art.y = -_art.height / 2;
		}
		
	}

}