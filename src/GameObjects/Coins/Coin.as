package GameObjects.Coins 
{
	import flash.display.MovieClip;
	import GameObjects.GameObj;
	import GameObjects.Player;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Coin extends GameObj 
	{
		// -- Properties -- //
		
		public var Value:int = 1;
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Coin(art:MovieClip=null) 
		{
			super(art);
			
		}
		
		// -- Methods -- //
		
		override public function onCollide(other:GameObj):void 
		{
			if (_destroyed) return;
			
			if (other is Player)
			{
				UserStats.Money += Value;
				destroy();
			}
		}
	}

}