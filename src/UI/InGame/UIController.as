package UI.InGame {
	import flash.display.Stage;
	import flash.events.Event;
	/**
	 * ...
	 * @author FDH
	 */
	public class UIController 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _stage:Stage;
		private var _items:Vector.<UIControl>;
		
		// -- Construct & Destroy -- //
		
		public function UIController(stage:Stage) 
		{
			_stage = stage;
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
			for each (var c:UIControl in _items)
			{
				c.update();
			}
		}
		
		public function addControl(newControl:UIControl):void 
		{
			_stage.addChild(newControl);
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
			_stage.removeChild(_items[ind]);
			_items.splice(ind, 1);
		}
		
		// -- -- //
		
		private function onObjDestroy(e:Event):void 
		{
			removeControl(e.target as UIControl);
		}
		
	}

}