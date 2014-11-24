package GameObjects 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class MovingGameObj extends GameObj 
	{
		// -- Properties -- 
		
		// Movement
		public var MoveSpeed:Number = 10;
		public var Acceleration:Number = 3;
		public var BrakeSpeed:Number = 3;
		
		// -- Vars -- //
		
		// Velocity to be applied this update
		protected var _velo:Vector3D = new Vector3D();
		
		// Movement Direction
		protected var _moveDir:Vector3D = new Vector3D();
		
		// -- Construct -- //
		
		public function MovingGameObj(art:MovieClip=null) 
		{
			super(art);
			
		}
		
		// -- Methods -- //
		
		override public function update(e:Event = null):void 
		{
			if (!_started) return;
			
			// Move Horizontal
			if (_moveDir.x != 0)
			{
				// Accelerate Horizontal
				if (Math.abs(_velo.x) < MoveSpeed)
					_velo.x += Acceleration * _moveDir.x;
				
				// Corrent Speed & Hold
				else _velo.x = MoveSpeed * _moveDir.x;
			}
			else
			{
				// Break
				if (Math.abs(_velo.x) > BrakeSpeed)
					_velo.x += _velo.x < 0 ? BrakeSpeed : -BrakeSpeed;
				
				// Stop
				else _velo.x = 0;
			}
			
			// Move Vertical
			if (_moveDir.y != 0)
			{
				// Accelerate Vertical
				if (Math.abs(_velo.y) < MoveSpeed)
					_velo.y += Acceleration * _moveDir.y;
				
				// Corrent Speed & Hold
				else _velo.y = MoveSpeed * _moveDir.y;
			}
			else
			{
				// Break Vertical
				if (Math.abs(_velo.y) > BrakeSpeed)
					_velo.y += _velo.y < 0 ? BrakeSpeed : -BrakeSpeed;
				
				// Stop Vertical
				else _velo.y = 0;
			}
			
			// Add Velo
			_position = _position.add(_velo);
			
			// Apply Pos
			x = _position.x;
			y = _position.y;
			
			//trace(_velo);
		}
		
	}

}