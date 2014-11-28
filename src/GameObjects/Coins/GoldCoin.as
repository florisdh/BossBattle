package GameObjects.Coins 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class GoldCoin extends Coin 
	{
		
		public function GoldCoin() 
		{
			super(new TempArt_GoldCoin());
			Value = 100;
		}
		
	}

}