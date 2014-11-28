package GameObjects.Coins 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class BronzeCoin extends Coin 
	{
		
		public function BronzeCoin() 
		{
			super(new TempArt_BronzeCoin());
			Value = 10;
		}
		
	}

}