package Factories 
{
	import GameObjects.Coins.BronzeCoin;
	import GameObjects.Coins.Coin;
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
		public static const SILVERCOIN:int = 1;
		public static const BRONZECOIN:int = 2;
		
		// -- Construct -- //
		
		public function CoinFactory() 
		{
			super();
		}
		
		// -- Overrides -- //
		
		override public function create(type:int, engine:Engine):* 
		{
			var newCoin:Coin;
			
			switch (type)
			{
				case GOLDCOIN:
					newCoin = new GoldCoin();
				break;
				case SILVERCOIN:
					newCoin = new SilverCoin();
				break;
				case BRONZECOIN:
					newCoin = new BronzeCoin();
				break;
			}
			
			if (!newCoin) return null;
			
			engine.addObject(newCoin, 1);
			
			return newCoin;
		}
	}

}