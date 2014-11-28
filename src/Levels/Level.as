package Levels {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import GameObjects.Bosses.Boss;
	import GameObjects.Player;
	import Interfaces.IStartable;
	import Interfaces.IUpdateable;
	/**
	 * ...
	 * @author FDH
	 */
	public class Level extends EventDispatcher implements IStartable, IUpdateable
	{
		// -- Events -- //
		
		public static const DONE:String = "Done";
		
		// -- Properties -- //
		
		public var CurrentBoss:Boss;
		
		// -- Vars -- //
		
		protected var _started:Boolean;
		protected var _engine:Engine;
		protected var _bg:MovieClip;
		protected var _player:Player;
		
		// -- Construct -- //
		
		public function Level(engine:Engine, bg:MovieClip, boss:Boss) 
		{
			_engine = engine;
			_bg = bg;
			_bg.scaleX = _bg.scaleY = 1.2;
			_bg.x = -_bg.width * 0.1;
			_bg.y = -_bg.height * 0.1;
			CurrentBoss = boss;
			CurrentBoss.addEventListener(Boss.DIED, onDone);
			init();
		}
		
		private function init():void 
		{
			_engine.Parent.addChildAt(_bg, 0);
			_engine.addObject(CurrentBoss, 1);
		}
		
		private function destroy():void 
		{
			_engine.removeObject(CurrentBoss);
			_engine.Parent.removeChild(_bg);
		}
		
		// -- Methods -- //
		
		public function update(e:Event = null):void 
		{
			
		}
		
		public function start(e:Event = null):void 
		{
			if (_started) return;
			_started = true;
			
			CurrentBoss.start();
		}
		
		public function stop(e:Event = null):void 
		{
			if (!_started) return;
			_started = false;
			
			CurrentBoss.stop();
			
			_engine.Parent.removeChild(_bg);
			_engine.removeObject(CurrentBoss);
		}
		
		private function onDone(e:Event = null):void 
		{
   			dispatchEvent(new Event(DONE));
		}
		
		public function set TargetPlayer(newVal:Player):void
		{
			_player = newVal;
			CurrentBoss.Target = _player;
		}
		
	}

}