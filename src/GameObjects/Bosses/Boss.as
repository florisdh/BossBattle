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
		
		// 0: Idle, 1:Move, 2:Attack, 3: Attack2
		private var _state:int = 0;
		
		protected var _tagetPos:Vector3D;
		
		// -- Construct -- //
		
		public function Boss(art:MovieClip=null) 
		{
			super(art);
			MoveSpeed = 6;
		}
		
		// -- Methods -- //
		
		override public function update(e:Event = null):void 
		{
			// Move To Target Pos
			if (_tagetPos)
			{
				var dis:Number = Vector3D.distance(_tagetPos, Position);
				
				// Apply Smooth Movement
				super.update();
				
				// Reached
				if (dis < MoveSpeed)
				{
					Position = _tagetPos.clone();
					_moveDir.scaleBy(0);
					_tagetPos = null;
				}
			}
		}
		
		public function set TargetPos(newVal:Vector3D):void 
		{
			// Calculate Movement velo to target
			_tagetPos = newVal;
			_moveDir = _tagetPos.subtract(Position);
			_moveDir.normalize();
		}
		
	}

}