package nslm2.modules.battles.battlefields
{
   import game.ui.battlefield.BattlefieldTodayReward.BattlefieldTodayRewardModuleUI;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   
   public class BattlefieldTodayRewardModule extends BattlefieldTodayRewardModuleUI
   {
       
      
      public function BattlefieldTodayRewardModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:Array = BattlefieldModel.ins.taskDic.array;
         _loc2_.sortOn("id",16);
         this.list_task.dataSource = _loc2_;
         this.panelBg.titleImgId = this.moduleId;
         this.preShowCpl();
      }
   }
}
