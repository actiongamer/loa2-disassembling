package nslm2.modules.footstones.assistantModules
{
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.footstones.assistantModules.subAssistants.battlefield.tasks.AssistantBattlefieldCryTask;
   import nslm2.modules.footstones.assistantModules.subAssistants.battlefield.tasks.AssistantBattlefieldFlagTask;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import nslm2.modules.footstones.assistantModules.vos.AssistantBattlefieldSettingVo;
   import nslm2.modules.footstones.assistantModules.subAssistants.battlefield.tasks.AssistantBattlefieldLineUpTask;
   import nslm2.modules.footstones.assistantModules.subAssistants.shenyuan.AssistantShenyuanTask;
   import nslm2.modules.footstones.assistantModules.subAssistants.mysteryshop.AssisMysteryShopTask;
   import nslm2.modules.footstones.assistantModules.subAssistants.shop.AssisShopTask;
   
   public class AssistantTasksFactory
   {
       
      
      public function AssistantTasksFactory()
      {
         super();
      }
      
      public static function getNewTaskByFuncId(param1:int) : TaskBase
      {
         var _loc2_:* = null;
         var _loc3_:* = param1;
         if(50500 !== _loc3_)
         {
            if(41500 !== _loc3_)
            {
               if(60310 !== _loc3_)
               {
                  if(41600 === _loc3_)
                  {
                     _loc2_ = new AssisShopTask(param1);
                  }
               }
               else
               {
                  _loc2_ = new AssisMysteryShopTask(param1);
               }
            }
            else
            {
               _loc2_ = new AssistantShenyuanTask(param1);
            }
         }
         else if(BattlefieldModel.ins.isInBattleScene)
         {
            if(BattlefieldModel.ins.curBattlefieldId == 1000)
            {
               _loc2_ = new AssistantBattlefieldCryTask(param1);
            }
            else
            {
               _loc2_ = new AssistantBattlefieldFlagTask(param1);
            }
         }
         else if((AssistantModel.ins.getSetting(param1) as AssistantBattlefieldSettingVo).autoLineUp)
         {
            _loc2_ = new AssistantBattlefieldLineUpTask(param1);
         }
         return _loc2_;
      }
   }
}
