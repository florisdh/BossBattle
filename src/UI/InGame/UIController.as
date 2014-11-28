package UI.InGame {
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	/**
	 * ...
	 * @author FDH
	 */
	public class UIController extends Sprite
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _items:Vector.<UIControl>;
		
		// -- Construct & Destroy -- //
		
		public function UIController() 
		{
			init();
		}
		
		public function init():void 
		{
			_items = new Vector.<UIControl>();
		}
		
		public function destroy():void 
		{
			var l:int = _items.length;
			for (var i:int = l - 1; i > 0; i--) 
			{
				removeControlByInd(i);
			}
			_items = null;
		}
		
		// -- -- //
		
		public function update(e:Event = null):void 
		{
			var l:int = _items.length;
			for (var i:int = l - 1; i > 0; i--) 
			{
				_items[i].update();
			}
		}
		
		public function addControl(newControl:UIControl):void 
		{
			addChild(newControl);
			_items.push(newControl);
			newControl.addEventListener(UIControl.DESTROY, onObjDestroy);
		}
		
		public function removeControl(control:UIControl):void 
		{
			var ind:int = _items.indexOf(control);
			if (ind < 0) return;
			removeControlByInd(ind);
		}
		
		public function removeControlByInd(ind:int):void 
		{
			removeChild(_items[ind]);
			_items.splice(ind, 1);
		}
		
		// -- -- //
		
		private function onObjDestroy(e:Event):void 
		{
			removeControl(e.target as UIControl);
		}
		
	}

}