package GameObjects 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	import GameObjects.Bosses.Boss;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class PlayerBullet extends Bullet 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function PlayerBullet() 
		{
			super(new TempArt_Player_Projectile());
			_art.x = -_art.width / 2;
			_art.y = -_art.height / 2;
			
			Damage = 5;
			
			_velo = new Vector3D(0, -30);
		}
		
		// -- Methods -- //
		
		// -- Overrides -- //
		
		override public function onCollide(other:GameObj):void 
		{
			if (other is Boss)
			{
				(other as Boss).Health.damage(Damage);
				destroy();
			}
		}
	}

}