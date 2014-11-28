package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import Interfaces.IKeyInputHandler;
	import Interfaces.IStartable;
	import UI.Menus.DeathMenu;
	import UI.Menus.Menu;
	import UI.Menus.StartMenu;
	import UI.Menus.UpgradeMenu;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Main extends Sprite implements IStartable, IKeyInputHandler
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _menu:Menu;
		private var _game:Game;
		
		// -- Construct -- //
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			// Create game
			_game = new Game();
			_game.addEventListener(Game.FAILED, onFailed);
			_game.addEventListener(Game.SUCCEED, onSucceed);
			
			showStartMenu();
			
			// Event listeners
			stage.addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onSucceed(e:Event):void 
		{
			stop();
			showUpgradeMenu();
		}
		
		private function onFailed(e:Event):void 
		{
			stop();
			showUpgradeMenu();
		}
		
		private function update(e:Event):void 
		{
			_game.update();
		}
		
		public function onKeyDown(e:KeyboardEvent):void 
		{
			_game.onKeyDown(e);
		}
		
		public function onKeyUp(e:KeyboardEvent):void 
		{
			_game.onKeyUp(e);
		}
		
		// -- Methods -- //
		
		public function start(e:Event = null):void 
		{
			if (_game.started) return;
			
			hideMenu();
			
			addChild(_game);
			_game.start();
		}
		
		public function stop(e:Event = null):void 
		{
			if (!_game.started) return;
			
			_game.stop();
			removeChild(_game);
		}
		
		private function showStartMenu(e:Event = null):void 
		{
			hideMenu();
			
			_menu = new StartMenu();
			_menu.addEventListener(StartMenu.START, start);
			addChild(_menu);
		}
		
		private function showUpgradeMenu(e:Event = null):void 
		{
			hideMenu();
			
			_menu = new UpgradeMenu();
			_menu.addEventListener(UpgradeMenu.BACK, showStartMenu);
			addChild(_menu);
		}
		
		private function hideMenu(e:Event = null):void 
		{
			if (_menu)
			{
				removeChild(_menu);
				_menu = null;
				stage.focus = null;
			}
		}
	}
}