package GameObjects.Bosses {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	import GameObjects.GameObj;
	import GameObjects.MovingGameObj;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Boss extends MovingGameObj 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		protected var _tagetPos:Vector3D;
		
		// -- Construct -- //
		
		public function Boss(art:MovieClip=null) 
		{
			super(art);
			//_art.x = -_art.width / 2;
			//_art.y = -_art.height / 2;
		}
		
		// -- Methods -- //
		
		override public function update(e:Event = null):void 
		{
			// Move To Target Pos
			if (_tagetPos)
			{
				var dis:Number = Vector3D.distance(_tagetPos, Position);
				
				// Reached
				if (dis < MoveSpeed)
				{
					Position = _tagetPos.clone();
					_tagetPos = null;
				}
				
				// Move to 
				
			}
		}
		
	}

}