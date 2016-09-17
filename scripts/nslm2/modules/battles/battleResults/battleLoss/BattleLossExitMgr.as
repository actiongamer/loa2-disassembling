package nslm2.modules.battles.battleResults.battleLoss
{
   import nslm2.modules.funnies.npcFuncLists.NpcFuncRef;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.globals.GlobalRef;
   
   public class BattleLossExitMgr
   {
      
      private static var _ins:nslm2.modules.battles.battleResults.battleLoss.BattleLossExitMgr;
       
      
      public var needOpenModuleId:int;
      
      public function BattleLossExitMgr()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.battleResults.battleLoss.BattleLossExitMgr
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.battleResults.battleLoss.BattleLossExitMgr();
         }
         return _ins;
      }
      
      public function checkModuleShow() : Boolean
      {
         if(needOpenModuleId)
         {
            var _loc1_:* = needOpenModuleId;
            if(11900 !== _loc1_)
            {
               if(30500 !== _loc1_)
               {
                  if(30600 === _loc1_)
                  {
                     ModuleMgr.ins.showModule(30600);
                  }
               }
               else
               {
                  ModuleMgr.ins.showModule(30500);
               }
            }
            else
            {
               NpcFuncRef.ins.execHandler(11900);
            }
            needOpenModuleId = 0;
            GlobalRef.mainCityReshowParam.chapterModuleInitVo = null;
            GlobalRef.mainCityReshowParam.heroAwakenRoadModuleInitVo = null;
            GlobalRef.mainCityReshowParam.showResDgId = 0;
            GlobalRef.mainCityReshowParam.needShowGuildDungeon = false;
            return true;
         }
         return false;
      }
   }
}
