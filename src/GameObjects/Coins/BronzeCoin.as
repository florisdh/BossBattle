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
			super(new Art_Coinbronze());
			Value = 10;
		}
		
	}

}