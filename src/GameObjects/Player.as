package GameObjects 
{
	import Factories.BulletFactory;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.geom.Vector3D;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	import Interfaces.IKeyInputHandler;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Player extends Character implements IKeyInputHandler
	{
		// -- Keys -- //
		
		public static const KEY_LEFT:int = 37;
		public static const KEY_RIGHT:int = 39;
		public static const KEY_UP:int = 38;
		public static const KEY_DOWN:int = 40;
		public static const KEY_SHOOT:int = 32;
		
		// -- Properties -- //
		
		// Spawn positions of bullets per shot (relative to current position)
		public var BulletSpawnPositions:Vector.<Vector3D>;
		
		public var Health:Humanoid;
		
		// -- Vars -- //
		
		// Key States
		private var _keyDown:Dictionary = new Dictionary();
		
		// Factories
		private var _bulletFactory:BulletFactory;
		
		// Anim states
		private var _walkAnim:Boolean = false;
		
		// Shoot Interval Timer
		private var _shootInterval:int = 500;
		private var _shootTimer:Timer;
		private var _canShoot:Boolean = true;
		
		// -- Construct -- //
		
		public function Player() 
		{
			// Set Art
			super(new Art_Player());
			_art.gotoAndStop(0);
			_art.x = -_art.width / 2;
			_art.y = -_art.height / 2;
			
			Health = new Humanoid(6);
			
			BulletSpawnPositions = new <Vector3D> [
				new Vector3D(-width / 2.5, -height / 2),
				//new Vector3D(width / 6, -height / 2)
			];
			
			_shootTimer = new Timer(_shootInterval, 1);
			_shootTimer.addEventListener(TimerEvent.TIMER, function():void 
			{
				_canShoot = true;
			});
			
			_bulletFactory = new BulletFactory();
		}
		
		// -- Methods -- //
		
		public function onKeyDown(e:KeyboardEvent):void 
		{
			if (!_started) return;
			
			switch (e.keyCode) 
			{
				case KEY_LEFT:
					_keyDown[KEY_LEFT] = true;
				break;
				case KEY_RIGHT:
					_keyDown[KEY_RIGHT] = true;
				break;
				case KEY_UP:
					_keyDown[KEY_UP] = true;
				break;
				case KEY_DOWN:
					_keyDown[KEY_DOWN] = true;
				break;
				case KEY_SHOOT:
					_keyDown[KEY_SHOOT] = true;
				break;
				default:
			}
		}
		
		public function onKeyUp(e:KeyboardEvent):void 
		{
			if (!_started) return;
			
			switch (e.keyCode) 
			{
				case KEY_LEFT:
					_keyDown[KEY_LEFT] = false;
				break;
				case KEY_RIGHT:
					_keyDown[KEY_RIGHT] = false;
				break;
				case KEY_UP:
					_keyDown[KEY_UP] = false;
				break;
				case KEY_DOWN:
					_keyDown[KEY_DOWN] = false;
				break;
				case KEY_SHOOT:
					_keyDown[KEY_SHOOT] = false;
				break;
				default:
			}
		}
		
		private function shoot():void 
		{
			if (!_canShoot) return;
			_canShoot = false;
			_shootTimer.start();
			
			var l:int = BulletSpawnPositions.length;
			var spawnPos:Vector3D;
			var newBullet:Bullet;
			
			for (var i:int = 0; i < l; i++ )
			{
				spawnPos = _position.add(BulletSpawnPositions[i]);
				
				newBullet = _bulletFactory.create(BulletFactory.BULLET_PLAYER, ParentEngine);
				newBullet.Position = spawnPos;
			}
		}
		
		// -- Overrides -- //
		
		override public function update(e:Event = null):void 
		{
			if (!_started) return;
			
			/// Set user input ///
			
			// Vertical
			if (_keyDown[KEY_UP]) _moveDir.y = -1;
			else if (_keyDown[KEY_DOWN]) _moveDir.y = 1;
			else _moveDir.y = 0;
			
			// Horizontal
			if (_keyDown[KEY_LEFT]) _moveDir.x = -1;
			else if (_keyDown[KEY_RIGHT]) _moveDir.x = 1;
			else _moveDir.x = 0;
			
			// Normalize
			if (_moveDir.length > 0)
			{
				_moveDir.normalize();
			}
			
			/// Bound to world ///
			if (x - width / 2 < 0)
			{
				x = width / 2;
				_velocity.x = 0;
			}
			if (x + width / 2 > stage.stageWidth)
			{
				x = stage.stageWidth - width / 2;
				_velocity.x = 0;
			}
			if (y - height / 2 < 0)
			{
				y = height / 2;
				_velocity.y = 0;
			}
			if (y + height / 2 > stage.stageHeight)
			{
				y = stage.stageHeight - height / 2;
				_velocity.y = 0;
			}
			
			/// Animation ///
			
			// Stop Walking
			if (_moveDir.x == 0 && _moveDir.y == 0 && _walkAnim)
			{
				_walkAnim = false;
				_art.gotoAndStop(0);
			}
			// Walk
			else if (!_walkAnim)
			{
				_walkAnim = true;
				_art.gotoAndPlay(0);
			}
			
			super.update(e);
			//trace(_velocity);
			
			/// Shoot ///
			if (_keyDown[KEY_SHOOT]) shoot();
		}
		
		override public function willCollide(other:GameObj):Boolean 
		{
			return other.hitTestPoint(x, y - height / 2, true);
		}
		
		// -- Get & Set -- //
		
		public function get ShootInterval():int
		{
			return _shootInterval;
		}
		
		public function set ShootInterval(newVal:int):void 
		{
			_shootInterval = newVal;
			_shootTimer.delay = newVal;
		}
		
	}

}