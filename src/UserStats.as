package  
{
	/**
	 * ...
	 * @author FDH
	 */
	public class UserStats 
	{
		////// Only One player so why not a static class //////
		
		// Current
		public static var Money			: Number	= 0;
		public static var MoveSpeed		: Number	= 6;
		public static var ShootInterval	: Number	= 800;
		public static var Damage		: Number	= 10;
		public static var Health		: Number	= 1;
		
		// Max
		public static var MaxMoveSpeed		: Number	= 20;
		public static var MinShootInterval	: Number	= 100;
		public static var MaxDamage			: Number	= 1000;
		public static var MaxHealth			: Number	= 6;
		
		public static function Save():void 
		{
			
		}
		
		public static function Load():void 
		{
			
		}
	}

}