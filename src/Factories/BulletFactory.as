package Factories 
{
	import GameObjects.Bullets.Bullet;
	import GameObjects.Bullets.PlayerBullet;
	/**
	 * ...
	 * @author FDH
	 */
	public class BulletFactory extends Factory 
	{
		// -- Types -- //
		
		public static const BULLET_PLAYER:int = 0;
		public static const BULLET_BOSS_ICE:int = 1;
		
		// -- Construct -- //
		
		public function BulletFactory() 
		{
			super();
		}
		
		// -- Methods -- //
		
		override public function create(type:int, engine:Engine):*
		{
			var newBullet:Bullet;
			
			// Select Bullet
			switch (type) 
			{
				case BULLET_PLAYER:
					newBullet = new PlayerBullet();
				break;
				default:
					return null;
			}
			
			// Add Bullet
			engine.addObject(newBullet);
			
			return newBullet;
		}
	}

}