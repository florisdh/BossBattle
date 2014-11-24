package GameObjects 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Bullet extends GameObj 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		protected var _velo:Vector3D;
		
		// -- Construct -- //
		
		public function Bullet(art:MovieClip=null) 
		{
			super(art);
			
		}
		
		// -- Methods -- //
		
		override public function update(e:Event = null):void 
		{
			_position = _position.add(_velo);
			
			// Apply Pos
			x = _position.x;
			y = _position.y;
			
			if (y < -height) destroy();
		}
		
	}

}