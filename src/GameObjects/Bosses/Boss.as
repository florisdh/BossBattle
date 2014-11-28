package GameObjects.Bosses {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Vector3D;
	import flash.utils.Timer;
	import GameObjects.GameObj;
	import GameObjects.Character;
	import GameObjects.MovingGameObj;
	import GameObjects.Player;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Boss extends Character 
	{
		// -- Events -- //
		
		public static const DIED:String = "Died";
		
		// -- Properties -- //
		
		public var Target:Player;
		public var Folow:Boolean = false;
		public var FollowRange:Number = 10;
		public var Health:Humanoid;
		public var HitDamage:Number = 1;
		public var HitInterval:int = 500;
		
		// -- Vars -- //
		
		// 0: Idle, 1:Move, 2:Attack, 3: Attack2
		protected var _state:int = 0;
		protected var _stateSwitchTimer:Timer;
		protected var _attack1Chance:Number;
		protected var _attack2Chance:Number;
		
		protected var _spawned:Boolean = false;
		
		protected var _canHit:Boolean = true;
		protected var _hitTimer:Timer;
		
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
			Acceleration = 1;
			BrakeSpeed = 8;
			Folow = false;
			
			HitDamage = 1;
			HitInterval = 350;
			
			Position = spawn;
			_readyPos = readyPos;
			TargetPos = readyPos;
			
			_hitTimer = new Timer(HitInterval, 1);
			_hitTimer.addEventListener(TimerEvent.TIMER, onHitTimerTick);
			
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
			if (_state != 0) return;
			
			var rnd:Number = Math.random();
			if (rnd <= _attack1Chance)
			{
				_state = 1;
				Attack1();
			}
			else if (rnd <= _attack1Chance + _attack2Chance)
			{
				_state = 2;
				Attack2();
			}
		}
		
		override public function update(e:Event = null):void 
		{
			if (!_started || Health.Died) return;
			
			// Apply Smooth Movement
			super.update();
			
			// Move To Target Pos
			if (_targetPos)
			{
				_moveDir = _targetPos.subtract(Position);
				_moveDir.normalize();
				
				// Reached
				var dis:Number = Vector3D.distance(_targetPos, Position);
				if (dis <= MoveSpeed * 2)
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
			// Go Back to base
			else if (_state == 0 && _targetPos == null)
			{
				var dis:Number = Vector3D.distance(Position, _readyPos);
				if (dis > MoveSpeed) TargetPos = _readyPos;
			}
			
		}
		
		public function Attack1():void 
		{
		}
		
		public function Attack2():void 
		{
		}
		
		protected function onTargetReach():void 
		{
			if (!_spawned) begin();
		}
		
		override public function onCollide(other:GameObj):void 
		{
			if (other is MovingGameObj)
			{
				(other as MovingGameObj).pushBack(Position, 3);
			}
			
			if (other is Player && _canHit)
			{
				_canHit = false;
				_hitTimer.delay = HitInterval;
				_hitTimer.start();
				
				(other as Player).Health.damage(HitDamage);
			}
		}
		
		private function onHitTimerTick(e:TimerEvent):void 
		{
			_canHit = true;
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
		
		// -- Get & Set -- //
		
		public function set TargetPos(newVal:Vector3D):void 
		{
			// Calculate Movement velo to target
			_targetPos = newVal;
		}
		
		
	}

}