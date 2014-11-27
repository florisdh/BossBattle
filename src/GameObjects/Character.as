package GameObjects 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Character extends MovingGameObj 
	{
		// -- Properties -- //
		
		public var MoveSpeed:Number = 10;
		public var Acceleration:Number = 3;
		public var BrakeSpeed:Number = 3;
		
		// -- Vars -- //
		
		// Movement Direction
		protected var _moveDir:Vector3D = new Vector3D();
		
		// -- Construct -- //
		
		public function Character(art:MovieClip=null) 
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
				if (Math.abs(_velocity.x) < MoveSpeed)
					_velocity.x += Acceleration * _moveDir.x;
				
				// Corrent Speed & Hold
				else _velocity.x = MoveSpeed * _moveDir.x;
			}
			else
			{
				// Break
				if (Math.abs(_velocity.x) > BrakeSpeed)
					_velocity.x += _velocity.x < 0 ? BrakeSpeed : -BrakeSpeed;
				
				// Stop
				else _velocity.x = 0;
			}
			
			// Move Vertical
			if (_moveDir.y != 0)
			{
				// Accelerate Vertical
				if (Math.abs(_velocity.y) < MoveSpeed)
					_velocity.y += Acceleration * _moveDir.y;
				
				// Corrent Speed & Hold
				else _velocity.y = MoveSpeed * _moveDir.y;
			}
			else
			{
				// Break Vertical
				if (Math.abs(_velocity.y) > BrakeSpeed)
					_velocity.y += _velocity.y < 0 ? BrakeSpeed : -BrakeSpeed;
				
				// Stop Vertical
				else _velocity.y = 0;
			}
			
			// Add Velo
			super.update(e);
		}
		
	}

}