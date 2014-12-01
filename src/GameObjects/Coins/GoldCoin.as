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
			super(new Art_Coingold());
			Value = 100;
		}
		
	}

}