package UI.InGame {
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Label extends UIControl 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _textField:TextField;
		
		// -- Construct -- //
		
		public function Label(text:String = "", fontSize:int = 12, font:String = "Arial Black") 
		{
			super();
			
			_textField = new TextField();
			_textField.defaultTextFormat = new TextFormat(font, fontSize);
			_textField.autoSize = TextFieldAutoSize.LEFT;
			_textField.selectable = false;
			//_textField.border = true;
			_textField.text = text;
			addChild(_textField);
		}
		
		// -- Methods -- //
		
		override public function update():void 
		{
			super.update();
		}
		
		// -- Get & Set -- //
		
		public function set FontSize(newVal:int):void 
		{
			var lastFormat:TextFormat = _textField.getTextFormat();
			_textField.setTextFormat(new TextFormat(lastFormat.font, newVal));
		}
		
		public function set Text(newVal:String):void 
		{
			_textField.text = newVal;
		}
		
		public function get Text():String
		{
			return _textField.text;
		}
	}

}