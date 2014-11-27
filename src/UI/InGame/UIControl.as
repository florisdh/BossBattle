package UI.InGame {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import Interfaces.IUpdateable;
	/**
	 * ...
	 * @author FDH
	 */
	public class UIControl extends Sprite implements IUpdateable
	{
		// -- Events -- //
		
		public static const DESTROY:String = "Destroy";
		
		// -- Properties -- //
		
		// -- Vars -- //
		
		protected var _art:MovieClip;
		
		// Fading in or out
		private var _fading:Boolean = false;
		private var _fadeIn:Boolean;
		private var _fadeSteps:Number;
		private var _fadeTimer:Timer;
		private var _fadeCallBack:Function;
		
		// -- Construct & Destroy -- //
		
		public function UIControl() 
		{
			init();
		}
		
		public function init():void 
		{
			_fadeTimer = new Timer(1337);
			_fadeTimer.addEventListener(TimerEvent.TIMER, onFadeTick);
		}
		
		public function destroy():void 
		{
			_fadeTimer.stop();
			_fadeTimer.removeEventListener(TimerEvent.TIMER, onFadeTick);
			_fadeTimer = null;
			dispatchEvent(new Event(DESTROY));
		}
		
		// -- Methods -- //
		
		public function update(e:Event = null):void 
		{
			
		}
		
		public function fadeIn(interval:int, alphaSteps:Number, callBack:Function = null):void 
		{
			if (_fading) _fadeTimer.stop();
			else _fading = true;
			
			_fadeIn = true;
			_fadeSteps = alphaSteps;
			_fadeCallBack = callBack;
			alpha = 0;
			
			_fadeTimer.delay = interval;
			_fadeTimer.start();
		}
		
		public function fadeOut(interval:int, alphaSteps:Number, callBack:Function = null):void 
		{
			if (_fading) _fadeTimer.stop();
			else _fading = true;
			
			_fadeIn = false;
			_fadeSteps = alphaSteps;
			_fadeCallBack = callBack;
			alpha = 1;
			
			_fadeTimer.delay = interval;
			_fadeTimer.start();
		}
		
		// -- Event Callback's -- //
		
		private function onFadeTick(e:TimerEvent):void 
		{
			// Apply steps
			alpha += _fadeIn ? _fadeSteps : -_fadeSteps;
			
			// Check if fade is done
			if ((_fadeIn && alpha >= 1) || (!_fadeIn && alpha <= 0))
			{
				_fading = false;
				_fadeTimer.stop();
				_fadeSteps = 0;
				if (_fadeCallBack != null) _fadeCallBack();
			}
		}
	}

}