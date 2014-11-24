package  
{
	import Effects.ObjectShake;
	import Factories.LevelFactory;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.utils.Timer;
	import GameObjects.Player;
	import Interfaces.IKeyInputHandler;
	import Interfaces.IStartable;
	import Interfaces.IUpdateable;
	import Levels.Level;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Game extends Sprite implements IStartable, IUpdateable, IKeyInputHandler
	{
		// -- Events -- //
		
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _engine:Engine;
		private var _player:Player;
		
		private var _screenShake:ObjectShake;
		
		private var _level:Level;
		private var _levelIndex:int = -1;
		private var _levelFactory:LevelFactory;
		
		// State
		private var _started:Boolean = false;
		
		// -- Construct -- //
		
		public function Game() 
		{
			super();
		}
		
		private function init():void 
		{
			_screenShake = new ObjectShake(this);
			
			_levelFactory = new LevelFactory();
			
			_engine = new Engine(this);
			
			_player = new Player();
			_player.x = stage.stageWidth / 2;
			_player.y = stage.stageHeight - _player.height / 2 - 10;
			_engine.addObject(_player);
			
			nextLevel();
			
			_engine.start();
		}
		
		private function destroy():void 
		{
			
		}
		
		// -- Methods -- //
		
		public function update(e:Event = null):void 
		{
			if (!_started) return;
			
			_engine.update();
		}
		
		public function onKeyDown(e:KeyboardEvent):void 
		{
			if (!_started) return;
			
			//if (e.keyCode == 32) _screenShake.shake(50, 3, 4);
			
			_player.onKeyDown(e);
		}
		
		public function onKeyUp(e:KeyboardEvent):void 
		{
			if (!_started) return;
			
			_player.onKeyUp(e);
		}
		
		public function start(e:Event = null):void 
		{
			if (_started) return;
			_started = true;
			
			init();
		}
		
		public function stop(e:Event = null):void 
		{
			if (!_started) return;
			_started = false;
			
			destroy();
		}
		
		public function nextLevel(e:Event = null):void 
		{
			// Stop Current Level if started
			if (_level) _level.stop();
			
			// Increase level and check if level is the last level
			_levelIndex++;
			if (_levelIndex >= 1)
			{
				trace("Levels Done");
				return;
			}
			
			// Get Next Level
			_level = _levelFactory.create(_levelIndex, _engine);
			_level.LevelDone = onLevelDone;
			if (!_level)
			{
				trace("Failed to load level");
				return;
			}
			
			// Start Next Level
			_level.start();
		}
		
		private function onLevelDone():void 
		{
			nextLevel();
		}
		
		// -- Get & Set -- //
		
		public function get started():Boolean 
		{
			return _started;
		}
		
		public function set started(newVal:Boolean):void 
		{
			_started = newVal;
		}
	}

}