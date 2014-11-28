package UI.Menus 
{
	import flash.display.SimpleButton;
	import flash.events.Event;
	/**
	 * ...
	 * @author FDH
	 */
	public class UpgradeMenu extends Menu 
	{
		public static const BACK		:	String = "Back";
		public static const SHOOTSPEED	:	String = "ShootSpeed";
		public static const HEALTH		:	String = "Health";
		public static const DAMAGE		:	String = "Damage";
		public static const MOVESPEED	:	String = "MoveSpeed";
		
		public function UpgradeMenu() 
		{
			super();
			
			addChild(new art_upgradescherm());
			
			addButton(new art_buttonback(), 950, 500, BACK);
			addButton(new art_buttonbullets(), 200, 250, SHOOTSPEED);
			addButton(new art_buttonhealth(), 200, 400, HEALTH);
			addButton(new art_buttondamage(), 600, 250, DAMAGE);
			addButton(new art_buttonspeed(), 600, 400, MOVESPEED);
			
			addEventListener(SHOOTSPEED, OnShootSpeedPressed);
			addEventListener(HEALTH, OnHealthPressed);
			addEventListener(DAMAGE, OnDamagePressed);
			addEventListener(MOVESPEED, OnMoveSpeedPressed);
		}
		
		private function OnShootSpeedPressed(e:Event):void 
		{
			if (UserStats.ShootInterval > UserStats.MinShootInterval)
				UserStats.ShootInterval -= 100;
			
			trace(UserStats.ShootInterval);
		}
		
		private function OnHealthPressed(e:Event):void 
		{
			if (UserStats.Health < UserStats.MaxHealth)
				UserStats.Health += 1;
			
			trace(UserStats.Health);
		}
		
		private function OnDamagePressed(e:Event):void 
		{
			if (UserStats.Damage < UserStats.MaxDamage)
				UserStats.Damage *= 2;
			
			trace(UserStats.Damage);
		}
		
		private function OnMoveSpeedPressed(e:Event):void 
		{
			if (UserStats.MoveSpeed < UserStats.MaxMoveSpeed)
				UserStats.MoveSpeed += 2;
			
			trace(UserStats.MoveSpeed);
		}
	}
}