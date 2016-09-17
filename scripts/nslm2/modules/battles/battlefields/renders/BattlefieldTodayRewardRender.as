package nslm2.modules.battles.battlefields.renders
{
   import game.ui.battlefield.BattlefieldTodayReward.BattlefieldTodayRewardRenderUI;
   import nslm2.modules.foundations.miniTasks.vo.TaskVo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import com.mz.core.utils.FilterUtil;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.core.components.Button;
   import nslm2.modules.foundations.miniTasks.service.TaskService;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class BattlefieldTodayRewardRender extends BattlefieldTodayRewardRenderUI
   {
       
      
      private var _effect:BmcSpriteSheet;
      
      public function BattlefieldTodayRewardRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      public function get vo() : TaskVo
      {
         return this.dataSource as TaskVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(param1)
         {
            this.txt_name.text = this.vo.title;
            this.txt_target.text = this.vo.titleContent + TextFieldUtil.htmlText2("（" + LocaleMgr.ins.getStr(11000866),458496) + this.vo.progressStr + TextFieldUtil.htmlText2("）",458496);
            _loc2_ = this.vo.rewardArr;
            _loc2_.sort(WealthUtil.rewardSortFun);
            this.list_reward.dataSource = _loc2_;
            refresh(this.vo.status);
         }
      }
      
      private function refresh(param1:int) : void
      {
         switch(int(param1) - 1)
         {
            case 0:
               this.img_finished.visible = false;
               this.btn_award.filters = [FilterUtil.grayFilter()];
               this.btn_award.mouseEvent = false;
               this.btn_award.label = LocaleMgr.ins.getStr(50400405);
               hideEffect();
               break;
            case 1:
               this.img_finished.visible = false;
               this.btn_award.filters = null;
               this.btn_award.mouseEvent = true;
               this.btn_award.label = LocaleMgr.ins.getStr(50400405);
               showEffect();
               break;
            case 2:
               this.img_finished.visible = true;
               this.btn_award.filters = [FilterUtil.grayFilter()];
               this.btn_award.mouseEvent = false;
               this.btn_award.label = LocaleMgr.ins.getStr(999000234);
               hideEffect();
         }
      }
      
      private function hideEffect() : void
      {
         if(_effect)
         {
            _effect.dispose();
            _effect = null;
         }
      }
      
      private function showEffect() : void
      {
         if(_effect == null)
         {
            _effect = new BmcSpriteSheet();
            _effect.x = -9;
            _effect.y = -10;
            _effect.init(115002,1,"all",true);
            this.btn_award.addChild(_effect);
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_award === _loc2_)
         {
            TaskService.ins.taskFinish(this.vo.id,onServerCpl_task);
         }
      }
      
      private function onServerCpl_task() : void
      {
         BattlefieldModel.ins.updateTaskStatus(this.vo.id,3);
         BattlefieldUtil.checkHasTodayReward();
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.x = -140;
         _loc1_.y = -6;
         _loc1_.init(130001,1,"all",false,1,0,taskEffComplete);
         this.addChild(_loc1_);
         refresh(3);
      }
      
      private function taskEffComplete() : void
      {
         FloatUtil.showGetItemsDisplayPanel(this.vo.rewardArr);
      }
   }
}
