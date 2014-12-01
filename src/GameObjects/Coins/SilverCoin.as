package GameObjects.Coins 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class SilverCoin extends Coin 
	{
		
		public function SilverCoin() 
		{
			super(new Art_Coinsilver());
			Value = 50;
		}
		
	}

}