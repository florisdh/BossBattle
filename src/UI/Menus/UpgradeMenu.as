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
		
		public static const SHOOTSPEED:String = "ShootSpeed";
		public static const HEALTH:String = "Health";
		public static const DAMAGE:String = "Damage";
		public static const MOVESPEED:String = "MoveSpeed";
		
		public var _shootSpeed:Number = 1;
		public var _health:Number = 1;
		public var _damage:Number = 1;
		public var _moveSpeed:Number = 1;
		
		private var _upgradeButton:SimpleButton;
		
		public function UpgradeMenu() 
		{
			super();
			addButton(new TempArt_UpgradeButton(),100,100,SHOOTSPEED);
			addButton(new TempArt_UpgradeButton(), 200, 200, HEALTH);
			addButton(new TempArt_UpgradeButton(),300,300,DAMAGE);
			addButton(new TempArt_UpgradeButton(), 400, 400, MOVESPEED);
			
			addEventListener(SHOOTSPEED, OnShootSpeedPressed);
			addEventListener(HEALTH, OnHealthPressed)
			addEventListener(DAMAGE, OnDamagePressed)
			addEventListener(MOVESPEED, OnMoveSpeedPressed)

		}
		
		private function OnShootSpeedPressed(e:Event):void 
		{
			_shootSpeed ++;
			trace(_shootSpeed);
		} 
		
		private function OnHealthPressed(e:Event):void 
		{
			_health ++;
			trace(_health);
		}
		
		private function OnDamagePressed(e:Event):void 
		{
			_damage ++;
			trace(_damage);
		}
		
		private function OnMoveSpeedPressed(e:Event):void 
		{
			_moveSpeed ++;
			trace(_moveSpeed);
		}
	}
}