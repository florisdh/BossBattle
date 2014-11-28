package GameObjects.Bosses 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Boss_Tiki extends Boss 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _attackTargetReached:Boolean = false;
		
		// -- Construct -- //
		
		public function Boss_Tiki(spawn:Vector3D, readypos:Vector3D) 
		{
			super(new Art_Tiki(), spawn, readypos);
			
			Health.MaxHealth = 200;
			
			_art.x = -_art.width / 2;
			_art.y = -_art.height / 2;
			
			_stateSwitchTimer.delay = 5000;
			_attack1Chance = 0.7;
			_attack2Chance = 0;
		}
		
		// -- Methods -- //
		
		override public function Attack1():void 
		{
			_attackTargetReached = false;
			
			var attackPos:Vector3D = Target.Position.subtract(Position);
			var dis:Number = attackPos.length;
			attackPos.normalize();
			//attackPos.scaleBy(dis - width / 3);
			attackPos.scaleBy(300);
			TargetPos = Position.add(attackPos);
		}
		
		override public function Attack2():void 
		{
			super.Attack2();
		}
		
		override public function update(e:Event = null):void 
		{
			super.update(e);
			
			
		}
		
		override protected function onTargetReach():void 
		{
			if (_state == 1)
			{ // Move Attack
				// Done
				if (_attackTargetReached) _state = 0;
				else
				{ // Go Back To Normal Position
					TargetPos = _readyPos;
					_attackTargetReached = true;
				}
			}
			
			super.onTargetReach();
		}
		
	}

}