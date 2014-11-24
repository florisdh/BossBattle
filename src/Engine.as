package  
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import GameObjects.GameObj;
	import Interfaces.IStartable;
	import Interfaces.IUpdateable;
	/**
	 * ...
	 * @author FDH
	 */
	public class Engine implements IStartable, IUpdateable
	{
		// -- Properties -- //
		
		public var Parent:Sprite;
		
		// -- Vars -- //
		
		private var _gameObjs:Vector.<GameObj>;
		
		private var _started:Boolean = false;
		private var _paused:Boolean = false;
		
		// -- Construct -- //
		
		public function Engine(stage:Sprite) 
		{
			Parent = stage;
			init();
		}
		
		public function init():void 
		{
			_gameObjs = new Vector.<GameObj>();
		}
		
		public function destroy():void 
		{
			
		}
		
		// -- Methods -- //
		
		public function addObject(obj:GameObj, zInd:int = -1):void 
		{
			_gameObjs.push(obj);
			obj.ParentEngine = this;
			
			if (zInd >= 0)
				Parent.addChildAt(obj, zInd);
			else
				Parent.addChild(obj);
			
		}
		
		private function onObjectDestroy(e:Event):void 
		{
			removeObject(e.target as GameObj);
		}
		
		public function removeObject(obj:GameObj):void 
		{
			var ind:int = _gameObjs.indexOf(obj);
			removeObjectFromId(ind);
		}
		
		public function removeObjectFromId(ind:int):void 
		{
			// Validate
			if (ind < 0 || ind >= _gameObjs.length) return;
			
			// Remove from stage
			Parent.removeChild(_gameObjs[ind]);
			
			// Remove from array
			_gameObjs.splice(ind, 1);
		}
		
		public function update(e:Event = null):void 
		{
			if (!_started) return;
			
			// Update all
			var l:int = _gameObjs.length;
			for (var i:int = l - 1; i >= 0; i-- )
			{
				_gameObjs[i].update();
			}
			
			// Check for col | I used for instead of foreach becouse some where skipped
			l = _gameObjs.length;
			for (var cI:int = 0; cI < l; cI++ )
			{
				var c:GameObj = _gameObjs[cI];
				
				// Check for collision
				if (!c.Collide) continue;
				
				for (var oI:int = 0; oI < l; oI++ )
				{
					// Skip self
					if (cI == oI) continue;
					
					// Skip No colliding parts
					var o:GameObj = _gameObjs[oI];
					if (!o.Collide) continue;
					
					// Check for col
					if (c.willCollide(o) && o.willCollide(c))
					{
						c.onCollide(o);
						o.onCollide(c);
					}
				}
			}
			
		}
		
		public function start(e:Event = null):void 
		{
			if (_started) return;
			_started = true;
			
			for (var i:int = _gameObjs.length - 1; i >= 0; i-- )
			{
				_gameObjs[i].start();
			}
		}
		
		public function stop(e:Event = null):void 
		{
			if (!_started) return;
			_started = false;
			
			for (var i:int = _gameObjs.length - 1; i >= 0; i-- )
			{
				_gameObjs[i].stop();
				removeObjectFromId(i);
			}
		}
	}

}