package GameObjects.Bosses {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Vector3D;
	import flash.utils.Timer;
	import GameObjects.GameObj;
	import GameObjects.MovingGameObj;
	import GameObjects.Player;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Boss extends MovingGameObj 
	{
		// -- Events -- //
		
		public static const DIED:String = "Died";
		
		// -- Properties -- //
		
		public var Target:Player;
		public var Folow:Boolean = false;
		public var FollowRange:Number = 10;
		public var Health:Humanoid;
		
		// -- Vars -- //
		
		// 0: Idle, 1:Move, 2:Attack, 3: Attack2
		protected var _state:int = 0;
		protected var _stateSwitchTimer:Timer;
		
		protected var _spawned:Boolean = false;
		
		// Position where to move to when spawn
		protected var _readyPos:Vector3D;
		
		// Position Moving to
		protected var _targetPos:Vector3D;
		
		// -- Construct -- //
		
		public function Boss(art:MovieClip, spawn:Vector3D, readyPos:Vector3D) 
		{
			super(art);
			
			Health = new Humanoid(100);
			Health.addEventListener(Humanoid.DIED, onDied);
			
			MoveSpeed = 8;
			Acceleration = 4;
			
			Position = spawn;
			_readyPos = readyPos;
			TargetPos = readyPos;
			
			_stateSwitchTimer = new Timer(3000);
			_stateSwitchTimer.addEventListener(TimerEvent.TIMER, onStateSwitch);
			
			AutoStart = false;
		}
		
		// -- Methods -- //
		
		protected function onDied(e:Event):void 
		{
			dispatchEvent(new Event(DIED));
			_art.stop();
		}
		
		protected function onStateSwitch(e:TimerEvent):void 
		{
			
		}
		
		override public function update(e:Event = null):void 
		{
			if (!_started || Health.Died) return;
			
			// Apply Smooth Movement
			super.update();
			
			// Move To Target Pos
			if (_targetPos)
			{
				// Reached
				var dis:Number = Vector3D.distance(_targetPos, Position);
				if (dis < MoveSpeed)
				{
					Position = _targetPos.clone();
					_moveDir.scaleBy(0);
					_targetPos = null;
					onTargetReach();
				}
			}
			// Move To Player
			else if (Target && Folow)
			{
				var dis:Number = Vector3D.distance(Position, Target.Position);
				
				if (dis > FollowRange)
				{
					TargetPos = new Vector3D(Target.x, y);
				}
			}
			
		}
		
		public function set TargetPos(newVal:Vector3D):void 
		{
			// Calculate Movement velo to target
			_targetPos = newVal;
			_moveDir = _targetPos.subtract(Position);
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