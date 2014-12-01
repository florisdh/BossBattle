package GameObjects.Bosses 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Boss_Mech extends Boss 
	{
		
		public function Boss_Mech(spawn:Vector3D, readyPos:Vector3D) 
		{
			super(new Art_MechMonster_Anmations(), spawn, readyPos);
			
			Health.MaxHealth = 5000;
			Health.Health = Health.MaxHealth;
			
			AutoMoveToSpawnPos = false;
			MoveSpeed = 4;
			Acceleration = 0.5;
		}
		
		override public function update(e:Event = null):void 
		{
			if (_spawned && Target && !_targetPos)
			{
				// Player above boss -> Move to player
				if (Target.y < y)
				{
					_moveDir = Target.Position.subtract(Position);
					_moveDir.normalize();
				}
				else if (Target.y - y > 380)
				{
					_moveDir.x = 0;
					_moveDir.y = 1;
				}
				else if (Target.y - y < 300)
				{
					_moveDir.x = 0;
					_moveDir.y = -1;
				}
				// Move Horizontal
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