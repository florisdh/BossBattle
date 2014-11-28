package Factories 
{
	import GameObjects.Coins.BronzeCoin;
	import GameObjects.Coins.GoldCoin;
	import GameObjects.Coins.SilverCoin;
	/**
	 * ...
	 * @author FDH
	 */
	public class CoinFactory extends Factory 
	{
		// -- Types -- //
		
		public static const GOLDCOIN:int = 0;
		public static const SILVERCOIN:int = 0;
		public static const BRONZECOIN:int = 0;
		
		// -- Construct -- //
		
		public function CoinFactory() 
		{
			super();
		}
		
		// -- Overrides -- //
		
		override public function create(type:int, engine:Engine):* 
		{
			switch (type)
			{
				case GOLDCOIN:
					return new GoldCoin();
				break;
				case SILVERCOIN:
					return new SilverCoin();
				break;
				case BRONZECOIN:
					return new BronzeCoin();
				break;
			}
		}
	}

}