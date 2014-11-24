package GameObjects 
{
	import Factories.BulletFactory;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Vector3D;
	import flash.utils.Dictionary;
	import Interfaces.IKeyInputHandler;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Player extends MovingGameObj implements IKeyInputHandler
	{
		// -- Keys -- //
		
		public static const KEY_LEFT:int = 65;
		public static const KEY_RIGHT:int = 68;
		public static const KEY_UP:int = 87;
		public static const KEY_DOWN:int = 83;
		public static const KEY_SHOOT:int = 32;
		
		// -- Properties -- //
		
		// Spawn positions of bullets per shot (relative to current position)
		public var BulletSpawnPositions:Vector.<Vector3D>;
		
		public var ShootInterval:int = 500;
		
		// -- Vars -- //
		
		// Key States
		private var _keyDown:Dictionary = new Dictionary();
		
		// Factories
		private var _bulletFactory:BulletFactory;
		
		// Anim states
		private var _walkAnim:Boolean = false;
		
		// -- Construct -- //
		
		public function Player() 
		{
			super(new Art_Player());
			_art.gotoAndStop(0);
			_art.x = -_art.width / 2;
			_art.y = -_art.height / 2;
			
			BulletSpawnPositions = new <Vector3D> [
				new Vector3D(-width / 6, -height / 2 - 0),
				new Vector3D(width / 6, -height / 2 - 0)
			];
			
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
			super.update(e);
			
			/// Set user input ///
			
			// Vertical
			if (_keyDown[KEY_UP]) _moveDir.y = -1;
			else if (_keyDown[KEY_DOWN]) _moveDir.y = 1;
			else _moveDir.y = 0;
			
			// Horizontal
			if (_keyDown[KEY_LEFT]) _moveDir.x = -1;
			else if (_keyDown[KEY_RIGHT]) _moveDir.x = 1;
			else _moveDir.x = 0;
			
			/// Animation ///
			
			// Stop Walking
			if (_moveDir.x == 0 && _moveDir.y == 0) _art.gotoAndStop(0);
			// Walk
			else if (!_walkAnim) _art.gotoAndPlay(0);
		}
		
		// -- Get & Set -- //
		
	}

}