package Effects 
{
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.geom.Vector3D;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author FDH
	 */
	public class ObjectShake 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _target:Sprite;
		
		private var _shaking:Boolean = false;
		private var _shakeTimer:Timer;
		private var _shakeMaxOffset:Number;
		private var _basePos:Vector3D;
		
		// -- Construct -- //
		
		public function ObjectShake(target:Sprite) 
		{
			_target = target;
			_shakeTimer = new Timer(100);
			_shakeTimer.addEventListener(TimerEvent.TIMER, onShakeTimerTick);
			_shakeTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onShakeTimerComplete);
		}
		
		// -- Methods -- //
		
		public function shake(interval:int, amount:int, maxOffset:Number):void 
		{
			_shakeTimer.reset();
			if (!_shaking)
			{
				_basePos = new Vector3D(_target.x, _target.y);
			}
			
			_shaking = true;
			_shakeMaxOffset = maxOffset;
			
			_shakeTimer.delay = interval;
			_shakeTimer.repeatCount = amount + 1;
			_shakeTimer.start();
		}
		
		private function calcNextOffset():Vector3D
		{
			return new Vector3D(
				-_shakeMaxOffset / 2 + _shakeMaxOffset * Math.random(),
				-_shakeMaxOffset / 2 + _shakeMaxOffset * Math.random()
			);
		}
		
		private function onShakeTimerTick(e:TimerEvent):void 
		{
			// Apply Offset
			var pos:Vector3D = _basePos.add(calcNextOffset());
			
			_target.x = pos.x;
			_target.y = pos.y;
		}
		
		private function onShakeTimerComplete(e:TimerEvent):void 
		{
			_target.x = _basePos.x;
			_target.y = _basePos.y;
			
			_shaking = false;
		}
		
		// -- Get & Set -- //
		
		
	}

}