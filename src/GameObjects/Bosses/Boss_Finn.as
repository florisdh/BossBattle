package GameObjects.Bosses 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Boss_Finn extends Boss 
	{
		
		public function Boss_Finn(spawn:Vector3D, readyPos:Vector3D) 
		{
			super(new Art_FINN(), spawn, readyPos);
			
			Health.MaxHealth = 3000;
			Health.Health = Health.MaxHealth;
			Acceleration = 0.5;
			MoveSpeed = 3;
			AutoMoveToSpawnPos = false;
		}
		
		override public function update(e:Event = null):void 
		{
			if (!_started || Health.Died) return;
			
			// Move to player
			if (_spawned && Target && !_targetPos)
			{
				// Player above boss -> Move to player
				if (Target.y < y)
				{
					_moveDir = Target.Position.subtract(Position);
					_moveDir.normalize();
				}
				// Player Vertical range
				else if (Target.y - y > 280)
				{
					_moveDir.x = 0;
					_moveDir.y = 1;
				}
				else if (Target.y - y < 220)
				{
					_moveDir.x = 0;
					_moveDir.y = -1;
				}
				// Move horizontal
				else if (Math.abs(Target.x - x) > 100)
				{
					_moveDir.y = 0;
					_moveDir.x = Target.x - x;
					_moveDir.normalize();
				}
				else _moveDir.scaleBy(0);
			}
			
			super.update(e);
			
		}
		
	}

}