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
		
		public function Boss_Tiki(spawn:Vector3D, target:Vector3D) 
		{
			super(new Art_Tiki(), spawn, target);
			_art.x = -_art.width / 2;
			_art.y = -_art.height / 2;
		}
		
		// -- Methods -- //
		
		private function attack():void 
		{
			if (_state != 0) return;
			_state = 1;
			
			_attackTargetReached = false;
			TargetPos = new Vector3D(_readyPos.x, _readyPos.y + 200);
		}
		
		override public function update(e:Event = null):void 
		{
			super.update(e);
			
			
		}
		
		override protected function onStateSwitch(e:TimerEvent):void 
		{
			if (_state == 0)
			{
				var rnd:int = Math.random() * 10;
				if (rnd < 6)
				{ // Attack State
					attack();
				}
			}
		}
		
		override protected function onTargetReach():void 
		{
			if (_state == 1)
			{ // Move Attack
				if (_attackTargetReached) _state = 0;
				else
				{
					TargetPos = _readyPos;
					_attackTargetReached = true;
				}
			}
			
			super.onTargetReach();
			
		}
		
	}

}