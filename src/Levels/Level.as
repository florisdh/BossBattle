package Levels {
	import flash.display.MovieClip;
	import flash.events.Event;
	import GameObjects.Bosses.Boss;
	import Interfaces.IStartable;
	import Interfaces.IUpdateable;
	/**
	 * ...
	 * @author FDH
	 */
	public class Level implements IStartable, IUpdateable
	{
		// -- Properties -- //
		
		// CallBack When Done
		public var LevelDone:Function;
		
		// -- Vars -- //
		
		protected var _started:Boolean;
		
		protected var _engine:Engine;
		
		protected var _bg:MovieClip;
		protected var _boss:Boss;
		
		// -- Construct -- //
		
		public function Level(engine:Engine, bg:MovieClip, boss:Boss) 
		{
			_engine = engine;
			_bg = bg;
			_boss = boss;
			init();
		}
		
		private function init():void 
		{
			_engine.Parent.addChildAt(_bg, 0);
			_engine.addObject(_boss, 1);
		}
		
		private function destroy():void 
		{
			_engine.removeObject(_boss);
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
			
		}
		
		public function stop(e:Event = null):void 
		{
			if (!_started) return;
			_started = false;
			
		}
		
		private function onDone():void 
		{
			if (onDone != null) onDone();
		}
		
	}

}