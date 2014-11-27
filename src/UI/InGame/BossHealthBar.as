package UI.InGame 
{
	/**
	 * ...
	 * @author FDH
	 */
	public class BossHealthBar extends UIControl 
	{
		// -- Properties -- //
		
		public var MaxHealth:int;
		
		// -- Vars -- //
		
		private var _health:int;
		
		// -- Construct -- //
		
		public function BossHealthBar() 
		{
			super();
			
			addChild(new Art_Ui_Boss_HealthBar());
			_art = new Art_Ui_Boss_Health();
			_art.x = 30;
			_art.y = 12;
			addChild(_art);
			
			MaxHealth = _art.totalFrames;
			_health = MaxHealth;
		}
		
		// -- Methods -- //
		
		public function reset():void 
		{
			Health = MaxHealth;
		}
		
		// -- Get & Set -- //
		
		public function set Health(newVal:int):void 
		{
			// Set Health
			_health = newVal;
			
			// Scale
			var scale:Number = Math.max(_health / MaxHealth, 0);
			_art.scaleX = scale;
		}
		
		public function get Health():int
		{
			return _health;
		}
		
	}

}