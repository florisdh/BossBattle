package UI.Menus 
{
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.media.Sound;
	/**
	 * ...
	 * @author FDH
	 */
	public class UpgradeMenu extends Menu 
	{
		// -- Events -- //
		
		public static const BACK		:	String = "Back";
		public static const SHOOTSPEED	:	String = "ShootSpeed";
		public static const HEALTH		:	String = "Health";
		public static const DAMAGE		:	String = "Damage";
		public static const MOVESPEED	:	String = "MoveSpeed";
		
		// -- Vars -- //
		
		private var _moneyText:TextField;
		private var _shootSpeedText:TextField;
		private var _healthText:TextField;
		private var _damageText:TextField;
		private var _moveSpeedText:TextField;
		
		private var _shootSpeedUpgradePrice:int;
		private var _healthUpgradePrice:int;
		private var _damageUpgradePrice:int;
		private var _moveSpeedUpgradePrice:int;
		
		// -- Construct -- //
		
		var _upgradeSound:Sound = new Aud_Upgrade();
		var _buttonClick:Sound = new Aud_ButtonKlick();
		
		public function UpgradeMenu() 
		{
			super();
			
			// Add BG
			addChild(new art_upgradescherm());
			
			// Add Buttons
			addButton(new art_buttonback(), 950, 500, BACK);
			addButton(new art_buttonbullets(), 200, 250, SHOOTSPEED);
			addButton(new art_buttonhealth(), 200, 400, HEALTH);
			addButton(new art_buttondamage(), 600, 250, DAMAGE);
			addButton(new art_buttonspeed(), 600, 400, MOVESPEED);
			
			// Calc prices
			_shootSpeedUpgradePrice	= UserStats.ShootIntervalUpgradeCash + (UserStats.MaxShootInterval - UserStats.ShootInterval) / UserStats.ShootIntervaUpgrade * UserStats.ShootIntervalUpgradeCashIncease;
			_healthUpgradePrice		= UserStats.HealthUpgradeCash + (UserStats.Health - UserStats.MinHealth) / UserStats.HealthUpgrade * UserStats.HealthUpgradeCashIncease;
			_damageUpgradePrice		= UserStats.DamageUpgradeCash + (UserStats.Damage - UserStats.MinDamage) / UserStats.DamageUpgrade * UserStats.DamageUpgradeCashIncease;
			_moveSpeedUpgradePrice	= UserStats.MoveSpeedUpgradeCash + (UserStats.MoveSpeed - UserStats.MinMoveSpeed) / UserStats.MoveSpeedUpgrade * UserStats.MoveSpeedUpgradeIncease;
			
			var shootSpeedText:String = _shootSpeedUpgradePrice + " $";
			if (UserStats.ShootInterval <= UserStats.MinShootInterval) shootSpeedText = "~";
			
			var healthText:String = _healthUpgradePrice + " $";
			if (UserStats.Health >= UserStats.MaxHealth) healthText = "~";
			
			var damageText:String = _damageUpgradePrice + " $";
			if (UserStats.Damage >= UserStats.MaxDamage) damageText = "~";
			
			var moveSpeedText:String = _moveSpeedUpgradePrice + " $";
			if (UserStats.MoveSpeed >= UserStats.MaxMoveSpeed) moveSpeedText = "~";
			
			// Add Labels
			_moneyText		= addLabel(UserStats.Money + " $", 300, 120);
			_shootSpeedText	= addLabel(shootSpeedText, 350, 305);
			_healthText		= addLabel(healthText, 350, 455);
			_damageText		= addLabel(damageText, 750, 305);
			_moveSpeedText	= addLabel(moveSpeedText, 750, 455);
			
			// Add Click Events
			addEventListener(BACK, OnBackPressed);
			addEventListener(SHOOTSPEED, OnShootSpeedPressed);
			addEventListener(HEALTH, OnHealthPressed);
			addEventListener(DAMAGE, OnDamagePressed);
			addEventListener(MOVESPEED, OnMoveSpeedPressed);
		}
		
		private function addLabel(text:String, xPos:int, yPos:int, font:String = "Arial", fontSize:int = 32, color:uint = 0xEEEEEE):TextField
		{
			var newLabel:TextField = new TextField();
			newLabel.autoSize = TextFieldAutoSize.LEFT;
			newLabel.defaultTextFormat = new TextFormat(font, fontSize, color);
			newLabel.text = text;
			newLabel.x = xPos;
			newLabel.y = yPos;
			addChild(newLabel);
			return newLabel;
		}
		
		private function OnBackPressed(e:Event):void 
		{
			_buttonClick.play();
		}
		
		private function OnShootSpeedPressed(e:Event):void 
		{
			if (UserStats.ShootInterval > UserStats.MinShootInterval && UserStats.Money >= _shootSpeedUpgradePrice)
			{
				UserStats.Money -= _shootSpeedUpgradePrice;
				_moneyText.text = UserStats.Money + " $";
				
				UserStats.ShootInterval -= UserStats.ShootIntervaUpgrade;
				
				if (UserStats.ShootInterval > UserStats.MinShootInterval)
				{
					_shootSpeedUpgradePrice += UserStats.ShootIntervalUpgradeCashIncease;
					_shootSpeedText.text = _shootSpeedUpgradePrice + " $";
				}
				else
				{
					_shootSpeedText.text = "~";
				}
				upgraded();
			}
		}
		
		private function OnHealthPressed(e:Event):void 
		{
			if (UserStats.Health < UserStats.MaxHealth && UserStats.Money >= _healthUpgradePrice)
			{
				UserStats.Money -= _healthUpgradePrice;
				_moneyText.text = UserStats.Money + " $";
				
				UserStats.Health += UserStats.HealthUpgrade;
				
				if (UserStats.Health < UserStats.MaxHealth)
				{
					_healthUpgradePrice += UserStats.HealthUpgradeCashIncease;
					_healthText.text = _healthUpgradePrice + " $";
				}
				else
				{
					_healthText.text = "~";
				}
				
				upgraded();
			}
		}
		
		private function OnDamagePressed(e:Event):void 
		{
			if (UserStats.Damage < UserStats.MaxDamage && UserStats.Money >= _damageUpgradePrice)
			{
				UserStats.Money -= _damageUpgradePrice;
				_moneyText.text = UserStats.Money + " $";
				
				UserStats.Damage += UserStats.DamageUpgrade;
				
				if (UserStats.Damage < UserStats.MaxDamage)
				{
					_damageUpgradePrice += UserStats.DamageUpgradeCashIncease;
					_damageText.text = _damageUpgradePrice + " $";
				}
				else
				{
					_damageText.text = "~";
				}
				
				upgraded();
			}
			
		}
		
		private function OnMoveSpeedPressed(e:Event):void 
		{
			if (UserStats.MoveSpeed < UserStats.MaxMoveSpeed && UserStats.Money >= _moveSpeedUpgradePrice)
			{
				UserStats.Money -= _moveSpeedUpgradePrice;
				_moneyText.text = UserStats.Money + " $";
				
				UserStats.MoveSpeed += UserStats.MoveSpeedUpgrade;
				
				if (UserStats.MoveSpeed < UserStats.MaxMoveSpeed)
				{
					_moveSpeedUpgradePrice += UserStats.MoveSpeedUpgradeIncease;
					_moveSpeedText.text = _moveSpeedUpgradePrice + " $";
				}
				else
				{
					_moveSpeedText.text = "~";
				}
				
				upgraded();
			}
			
		}
		
		private function upgraded():void
		{
			_upgradeSound.play();
		}
	}
}