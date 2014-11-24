package GameObjects 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	
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
			
			_velo = new Vector3D(0, -30);
		}
		
		// -- Methods -- //
		
		// -- Overrides -- //
		
	}

}