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
	import UI.InGame.BossHealthBar;
	import UI.InGame.MoneyIndicator;
	import UI.InGame.PlayerHealthIndicator;
	import UI.InGame.UIController;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Game extends Sprite implements IStartable, IUpdateable, IKeyInputHandler
	{
		// -- Events -- //
		
		public static const FAILED:String = "Failed";
		public static const SUCCEED:String = "Susseed";
		
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _engine:Engine;
		private var _player:Player;
		
		private var _screenShake:ObjectShake;
		
		private var _level:Level;
		private var _levelIndex:int;
		private var _levelFactory:LevelFactory;
		
		// State
		private var _started:Boolean = false;
		
		// UI
		private var _uiController:UIController;
		private var _playerHealthBar:PlayerHealthIndicator;
		private var _bossHealthBar:BossHealthBar;
		private var _moneyIndicator:MoneyIndicator;
		
		// -- Construct -- //
		
		public function Game() 
		{
			super();
		}
		
		private function init():void 
		{
			_levelIndex = -1;
			
			_screenShake = new ObjectShake(this);
			
			// UI
			_uiController = new UIController();
			addChild(_uiController);
			
			_playerHealthBar = new PlayerHealthIndicator();
			_playerHealthBar.x = 10;
			_playerHealthBar.y = stage.stageHeight - _playerHealthBar.height - 10;
			_bossHealthBar = new BossHealthBar();
			_bossHealthBar.x = (stage.stageWidth - _bossHealthBar.width) / 2;
			_moneyIndicator = new MoneyIndicator();
			_moneyIndicator.Money = UserStats.Money;
			_moneyIndicator.x = stage.stageWidth - _moneyIndicator.width - 8;
			_moneyIndicator.y = stage.stageHeight - _moneyIndicator.height - 8;
			
			_uiController.addControl(_playerHealthBar);
			_uiController.addControl(_bossHealthBar);
			_uiController.addControl(_moneyIndicator);
			
			_levelFactory = new LevelFactory();
			
			_engine = new Engine(this);
			
			_player = new Player();
			_player.x = stage.stageWidth / 2;
			_player.y = stage.stageHeight - _player.height / 2 - 10;
			_player.Health.addEventListener(Humanoid.CHANGED, onPlayerHit);
			_player.Health.addEventListener(Humanoid.DIED, onPlayerDied);
			_engine.addObject(_player);
			
			// Load Current Stats
			_player.Health.Health = UserStats.Health;
			_player.ShootInterval = UserStats.ShootInterval;
			
			nextLevel();
			
			_engine.start();
		}
		
		private function destroy():void 
		{
			_uiController.destroy();
			removeChild(_uiController);
			if (_level) _level.stop();
			
			_engine.stop();
		}
		
		// -- Methods -- //
		
		public function update(e:Event = null):void 
		{
			if (!_started) return;
			
			if (_moneyIndicator.Money != UserStats.Money)
			{
				_moneyIndicator.Money = UserStats.Money;
				_moneyIndicator.x = stage.stageWidth - _moneyIndicator.width - 8;
			}
			
			_level.update();
			_uiController.update();
			_engine.update();
		}
		
		public function onKeyDown(e:KeyboardEvent):void 
		{
			if (!_started) return;
			
			_player.onKeyDown(e);
		}
		
		public function onKeyUp(e:KeyboardEvent):void 
		{
			if (!_started) return;
			
			_player.onKeyUp(e);
		}
		
		private function onPlayerHit(e:Event):void 
		{
			_playerHealthBar.Health = _player.Health.Health;
			_screenShake.shake(50, 2, 4);
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
		
		private function onPlayerDied(e:Event):void 
		{
			dispatchEvent(new Event(FAILED));
		}
		
		public function nextLevel(e:Event = null):void 
		{
			// Stop Current Level if started
			if (_level) _level.stop();
			
			// Increase level and check if level is the last level
			_levelIndex++;
			if (_levelIndex >= LevelFactory.LEVELS_AMOUNT)
			{
				dispatchEvent(new Event(SUCCEED));
				return;
			}
			
			// Get Next Level
			_level = _levelFactory.create(_levelIndex, _engine);
			_level.TargetPlayer = _player;
			_level.CurrentBoss.Health.addEventListener(Humanoid.CHANGED, function ():void 
			{
				_bossHealthBar.Health = _level.CurrentBoss.Health.Health;
				_screenShake.shake(50, 2, 8);
			});
			_level.addEventListener(Level.DONE, onLevelDone);
			
			// Set HealthBar health
			_bossHealthBar.MaxHealth = _level.CurrentBoss.Health.MaxHealth;
			_bossHealthBar.reset();
			
			// Start Next Level
			_level.start();
		}
		
		private function onLevelDone(e:Event = null):void 
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