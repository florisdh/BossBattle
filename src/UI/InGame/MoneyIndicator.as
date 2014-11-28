package UI.InGame 
{
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author FDH
	 */
	public class MoneyIndicator extends UIControl 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _text:TextField;
		private var _money:int;
		
		// -- Construct -- //
		
		public function MoneyIndicator() 
		{
			super();
			_text = new TextField();
			_text.defaultTextFormat = new TextFormat("Arial", 32);
			_text.autoSize = TextFieldAutoSize.LEFT;
			_text.text = "0 $";
			addChild(_text);
		}
		
		// -- Methods -- //
		
		public function set Money(newVal:int):void 
		{
			_money = newVal;
			_text.text = _money + " $";
		}
		
		public function get Money():int
		{
			return _money;
		}
	}

}