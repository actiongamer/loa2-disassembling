package nslm2.modules.footstones.gmModules
{
   import nslm2.modules.foundations.setting.service.SettingService;
   
   public class PlayerLogUtil
   {
      
      private static var _ins:nslm2.modules.footstones.gmModules.PlayerLogUtil;
       
      
      public var firstBattleLogIds:Array;
      
      public function PlayerLogUtil()
      {
         firstBattleLogIds = [701,702,703,704,705,706];
         super();
      }
      
      public static function get ins() : nslm2.modules.footstones.gmModules.PlayerLogUtil
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.footstones.gmModules.PlayerLogUtil();
         }
         return _ins;
      }
      
      public function saveNext() : void
      {
         var _loc1_:int = 0;
         if(firstBattleLogIds.length > 0)
         {
            _loc1_ = firstBattleLogIds.shift();
            SettingService.ins.save(44,_loc1_);
         }
      }
      
      public function saveType1(param1:int) : void
      {
         SettingService.ins.save(44,param1);
      }
      
      public function saveType2(param1:int) : void
      {
         if(SettingService.ins.getValue(45) != String(param1))
         {
            SettingService.ins.save(45,param1);
         }
      }
   }
}
