package nslm2.modules.footstones.assistantModules.vos
{
   public class AssistantBattlefieldSettingVo
   {
       
      
      public var autoLineUp:Boolean = true;
      
      public var autoGetTaskReward:Boolean = true;
      
      public var cryAutoMode:int = 0;
      
      public var needAttackPlayer:Boolean = false;
      
      public var notAttackBuffPlayer:Boolean = false;
      
      public var onlyAttackLowerFightValue:Boolean = false;
      
      public var lowerFightValue:uint = 100000;
      
      public var notAttackLowHp:Boolean;
      
      public var lowHpPer:uint = 20;
      
      public var flagAutoMode:int = 0;
      
      public var needKillUpMon:Boolean = true;
      
      public var needKillDownMon:Boolean;
      
      public var needKillLeftMon:Boolean;
      
      public var needKillRightMon:Boolean;
      
      public function AssistantBattlefieldSettingVo()
      {
         super();
      }
   }
}
