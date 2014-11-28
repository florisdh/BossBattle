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
			super(new art_coingoud());
			Value = 100;
		}
		
	}

}