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
		
		// Min
		public static var MinMoney			: Number	= 0;
		public static var MinMoveSpeed		: Number	= 6;
		public static var MaxShootInterval	: Number	= 800;
		public static var MinDamage			: Number	= 10;
		public static var MinHealth			: Number	= 1;
		
		// Max
		public static var MaxMoveSpeed		: Number	= 20;
		public static var MinShootInterval	: Number	= 100;
		public static var MaxDamage			: Number	= 100;
		public static var MaxHealth			: Number	= 6;
		
		// Upgrade Steps
		public static var MoveSpeedUpgrade		: Number	= 2;
		public static var ShootIntervaUpgrade	: Number	= 100;
		public static var DamageUpgrade			: Number	= 10;
		public static var HealthUpgrade			: Number	= 1;
		
		// Upgrade cash
		public static var MoveSpeedUpgradeCash		: int	= 50;
		public static var ShootIntervalUpgradeCash	: int	= 50;
		public static var DamageUpgradeCash			: int	= 50;
		public static var HealthUpgradeCash			: int	= 50;
		
		// Upgrade cash incresement
		public static var MoveSpeedUpgradeIncease			: int	= 30;
		public static var ShootIntervalUpgradeCashIncease	: int	= 60;
		public static var DamageUpgradeCashIncease			: int	= 50;
		public static var HealthUpgradeCashIncease			: int	= 100;
		
		public static function Save():void 
		{
			
		}
		
		public static function Load():void 
		{
			
		}
	}

}