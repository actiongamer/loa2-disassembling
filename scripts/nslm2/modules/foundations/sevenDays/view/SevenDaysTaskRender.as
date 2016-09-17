package nslm2.modules.foundations.sevenDays.view
{
   import game.ui.sevenDayModule.view.SevenDaysTaskRenderUI;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.foundations.sevenDays.vo.SevenDayTaskVo;
   import nslm2.modules.foundations.fourteenDays.vo.FourteenDayTaskVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.fourteenDays.model.FourteenDaysModel;
   import morn.core.components.Button;
   import nslm2.modules.foundations.dailyTask.DailyTaskBtnCtrl;
   import nslm2.modules.foundations.sevenDays.service.SevenDaysService;
   import nslm2.modules.foundations.sevenDays.model.SevenDaysModel;
   import nslm2.modules.foundations.fourteenDays.service.FourteenDaysService;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.mediators.RollMediator;
   
   public class SevenDaysTaskRender extends SevenDaysTaskRenderUI
   {
       
      
      private var _data;
      
      private var btnEff:BmcSpriteSheet;
      
      private var eff:BmcSpriteSheet;
      
      private var preVo;
      
      public function SevenDaysTaskRender()
      {
         super();
         btn_go.clickHandler = btnClickHandler;
         this.parts.push(new RollMediator(this,rollhandler));
         img_gotReward.visible = false;
      }
      
      private function rollhandler(param1:Boolean) : void
      {
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1 is SevenDayTaskVo)
         {
            _data = param1 as SevenDayTaskVo;
         }
         else
         {
            _data = param1 as FourteenDayTaskVo;
         }
         if(_data)
         {
            if(preVo && preVo.id != _data.id)
            {
               resetBtn();
            }
            preVo = _data;
            txt_title.text = _data.title;
            txt_progress.text = _data.progress;
            btn_go.visible = true;
            var _loc2_:* = _data.status;
            if(2 !== _loc2_)
            {
               if(1 !== _loc2_)
               {
                  if(3 !== _loc2_)
                  {
                     if(4 === _loc2_)
                     {
                        txt_progress.text = LocaleMgr.ins.getStr(13300218);
                        img_gotReward.visible = false;
                        btn_go.style = "按钮大黄";
                        this.btn_go.visible = false;
                     }
                  }
                  else
                  {
                     img_gotReward.visible = true;
                     btn_go.visible = false;
                  }
               }
               else
               {
                  img_gotReward.visible = false;
                  btn_go.visible = true;
                  btn_go.label = LocaleMgr.ins.getStr(11900045);
                  btn_go.style = "按钮大绿";
               }
            }
            else
            {
               img_gotReward.visible = false;
               btn_go.visible = true;
               btn_go.label = LocaleMgr.ins.getStr(999000364);
               btn_go.style = "按钮大黄";
            }
            list_reward.repeatX = _data.rewardArr.length;
            list_reward.dataSource = _data.rewardArr;
            if(param1 is FourteenDayTaskVo && FourteenDaysModel.ins.isTask1(param1 as FourteenDayTaskVo))
            {
               this.txt_hint.visible = true;
            }
            else
            {
               this.txt_hint.visible = false;
            }
         }
         showOrHideBtnEffect();
      }
      
      private function resetBtn() : void
      {
         btn_go.mouseEnabled = true;
      }
      
      private function showOrHideBtnEffect() : void
      {
         if(_data && _data.status == 1)
         {
            if(!btnEff)
            {
               btnEff = new BmcSpriteSheet();
               btnEff.init(115002,1,"all",true);
               btnEff.x = btn_go.x - 46 + 4 + 33;
               btnEff.y = btn_go.y - 25 + 4 + 11;
               this.addChild(btnEff);
            }
         }
         else if(btnEff)
         {
            btnEff.dispose();
            btnEff = null;
         }
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc2_:* = _data.status;
         if(2 !== _loc2_)
         {
            if(1 === _loc2_)
            {
               param1.mouseEnabled = false;
               if(_data is SevenDayTaskVo)
               {
                  SevenDaysService.ins.getTaskReward(SevenDaysModel.ins.currentDay,_data.id,getTaskRewardCpl);
               }
               else
               {
                  FourteenDaysService.ins.getTaskReward(FourteenDaysModel.ins.currentDay,_data.id,getTaskRewardCpl);
               }
            }
         }
         else
         {
            DailyTaskBtnCtrl.openTargetModuel(_data.targetType,null);
         }
      }
      
      private function getTaskRewardCpl() : void
      {
         img_gotReward.visible = true;
         btn_go.visible = false;
         ObserverMgr.ins.sendNotice("sevenday_notice_get_reward_success",this);
         if(btnEff)
         {
            btnEff.dispose();
            btnEff = null;
         }
      }
   }
}
