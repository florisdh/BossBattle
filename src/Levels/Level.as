package Levels {
	import Factories.CoinFactory;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import GameObjects.Bosses.Boss;
	import GameObjects.Coins.Coin;
	import GameObjects.GameObj;
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
		public var DoneTime:int = 1500;
		
		// -- Vars -- //
		
		protected var _coinFactory:CoinFactory;
		protected var _started:Boolean;
		protected var _engine:Engine;
		protected var _bg:MovieClip;
		protected var _player:Player;
		protected var _doneTimer:Timer;
		
		// -- Construct -- //
		
		public function Level(engine:Engine, bg:MovieClip, boss:Boss) 
		{
			_engine = engine;
			_bg = bg;
			CurrentBoss = boss;
			
			_doneTimer = new Timer(DoneTime, 1);
			_doneTimer.addEventListener(TimerEvent.TIMER, onDoneTimer);
			
			init();
		}
		
		private function init():void 
		{
			_bg.scaleX = _bg.scaleY = 1.2;
			_bg.x = -_bg.width * 0.1;
			_bg.y = -_bg.height * 0.1;
			
			CurrentBoss.addEventListener(Boss.DIED, onDone);
			
			_coinFactory = new CoinFactory();
			
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
			if (_doneTimer.running)
			{
				// Collect coins
				var coins:Vector.<GameObj> = _engine.getItemsFromType(Coin);
				for (var i:int = 0; i < coins.length; i++) 
				{
					(coins[i] as Coin).jump(_player.Position, 10);
				}
			}
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
			
			if (CurrentBoss)
			{
				CurrentBoss.stop();
				_engine.removeObject(CurrentBoss);
			}
			
			if (_bg) _engine.Parent.removeChild(_bg);
		}
		
		private function onDone(e:Event = null):void 
		{
			_engine.removeObject(CurrentBoss);
			CurrentBoss = null;
			
			_doneTimer.delay = DoneTime;
   			_doneTimer.start();
		}
		
		private function onDoneTimer(e:TimerEvent):void 
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