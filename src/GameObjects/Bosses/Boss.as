package GameObjects.Bosses {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Vector3D;
	import flash.utils.Timer;
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
		protected var _state:int = 0;
		protected var _stateSwitchTimer:Timer;
		
		protected var _spawned:Boolean = false;
		protected var _readyPos:Vector3D;
		
		protected var _tagetPos:Vector3D;
		
		// -- Construct -- //
		
		public function Boss(art:MovieClip, spawn:Vector3D, target:Vector3D) 
		{
			super(art);
			
			MoveSpeed = 8;
			Acceleration = 4;
			
			Position = spawn;
			_readyPos = TargetPos = target;
			
			_stateSwitchTimer = new Timer(3000);
			_stateSwitchTimer.addEventListener(TimerEvent.TIMER, onStateSwitch);
		}
		
		// -- Methods -- //
		
		protected function onStateSwitch(e:TimerEvent):void 
		{
			
		}
		
		override public function update(e:Event = null):void 
		{
			if (!_started) return;
			
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
					onTargetReach();
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
		
		protected function onTargetReach():void 
		{
			if (!_spawned) begin();
		}
		
		override public function start(e:Event = null):void 
		{
			super.start(e);
		}
		
		protected function begin():void 
		{
			_spawned = true;
			_stateSwitchTimer.start();
		}
		
		override public function stop(e:Event = null):void 
		{
			super.stop(e);
			_stateSwitchTimer.stop();
		}
		
	}

}