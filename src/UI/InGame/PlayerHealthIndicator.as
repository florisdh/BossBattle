package UI.InGame 
{
	/**
	 * ...
	 * @author FDH
	 */
	public class PlayerHealthIndicator extends UIControl 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _health:int;
		private var _maxHealth:int;
		
		// -- Construct -- //
		
		public function PlayerHealthIndicator() 
		{
			super();
			
			_art = new Art_Ui_Healthbar();
			_art.gotoAndStop(0);
			addChild(_art);
			
			_maxHealth = _art.totalFrames;
			_health = _maxHealth;
		}
		
		// -- Methods -- //
		
		// -- Get & Set -- //
		
		public function set Health(newVal:int):void 
		{
			_health = newVal;
			_art.gotoAndStop(_health);
		}
		
		public function get Health():int
		{
			return _health;
		}
		
	}

}