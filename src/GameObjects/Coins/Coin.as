package GameObjects.Coins 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	import GameObjects.GameObj;
	import GameObjects.MovingGameObj;
	import GameObjects.Player;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Coin extends MovingGameObj 
	{
		// -- Properties -- //
		
		public var Value:int = 1;
		
		// -- Vars -- //
		
		private var _jumpTarget:Vector3D;
		private var _jumpSpeed:Number;
		
		// -- Construct -- //
		
		public function Coin(art:MovieClip=null) 
		{
			super(art);
			
		}
		
		// -- Methods -- //
		
		public function jump(target:Vector3D, speed:Number = 10):void 
		{
			_jumpTarget = target;
			_jumpSpeed = speed;
		}
		
		override public function update(e:Event = null):void 
		{
			// Check if jump target reached
			if (_jumpTarget)
			{
				// Move to
				_velocity = _jumpTarget.subtract(Position);
				var l:Number = _velocity.length;
				
				if (l < _jumpSpeed)
				{
					_jumpTarget = null;
					_velocity.scaleBy(0);
				}
				else
				{
					_velocity.normalize();
					_velocity.scaleBy(_jumpSpeed);
				}
			}
			
			// Apply velo
			super.update(e);
		}
		
		override public function willCollide(other:GameObj):Boolean 
		{
			return Vector3D.distance(Position, other.Position) <= (width + other.width) / 2;
		}
		
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