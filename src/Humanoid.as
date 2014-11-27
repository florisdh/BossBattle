package  
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author FDH
	 */
	public class Humanoid extends EventDispatcher
	{
		// -- Events -- //
		
		public static const DIED:String = "Died";
		public static const CHANGED:String = "Changed";
		
		// -- Properties -- //
		
		public var Died:Boolean = false;
		public var MaxHealth:Number;
		
		// -- Vars -- //
		
		private var _health:Number;
		
		// -- Construct -- //
		
		public function Humanoid(maxHealth:Number) 
		{
			MaxHealth = maxHealth;
			_health = MaxHealth;
		}
		
		// -- Methods -- //
		
		public function damage(dmg:Number):void 
		{
			Health -= dmg;
			
			if (Health <= 0 && !Died)
			{
				Died = true;
				dispatchEvent(new Event(DIED));
			}
		}
		
		public function heal(amt:Number):void 
		{
			Health += amt;
		}
		
		public function reset():void 
		{
			Health = MaxHealth;
		}
		
		// -- Get & Set -- //
		
		public function set Health(newVal:Number):void
		{
			if (_health != newVal)
			{
				_health = newVal;
				dispatchEvent(new Event(CHANGED));
			}
		}
		
		public function get Health():Number
		{
			return _health;
		}
		
	}

}