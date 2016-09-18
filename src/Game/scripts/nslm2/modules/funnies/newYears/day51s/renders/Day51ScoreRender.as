package nslm2.modules.funnies.newYears.day51s.renders
{
   import game.ui.newYears.day51s.renders.Day51ScoreRenderUI;
   import nslm2.modules.funnies.funnyCommons.IFuncIdView;
   import nslm2.modules.funnies.dials.service.DialService;
   import nslm2.modules.funnies.dials.service.DialCrossService;
   import nslm2.modules.funnies.busyActivity.towers.services.TowerService;
   import nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
   import nslm2.modules.funnies.newYears.day51s.services.Day51Service;
   import nslm2.modules.funnies.dials.model.DialModel;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import proto.StaticMineSweepRankRewardModel;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.skins.Effect2DUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class Day51ScoreRender extends Day51ScoreRenderUI implements IFuncIdView
   {
       
      
      private var _funcId:int;
      
      public function Day51ScoreRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         btn_get.label = LocaleMgr.ins.getStr(60540017);
      }
      
      public function get funcId() : int
      {
         return _funcId;
      }
      
      public function set funcId(param1:int) : void
      {
         _funcId = param1;
      }
      
      public function do_server_getScoreReward() : void
      {
         var _loc1_:* = funcId;
         if(60810 !== _loc1_)
         {
            if(13386 !== _loc1_)
            {
               if(13376 !== _loc1_)
               {
                  Day51Service.ins.server_getScoreReward(this.vo.id,getHandler);
                  return;
               }
               DragonBoatService.ins.protos.server_DRAGON_BOAT_SINGLE_REWARD(this.vo.id,getHandler);
               return;
            }
            TowerService.ins.protos.server_TOWER_SCORE_REWARD(this.vo.rank,getHandler);
            return;
         }
         (DialService.getIns(60810) as DialCrossService).server_ZHUANPAN_CROSS_SCORE_RWD(uint(this.vo.rank),getHandler);
      }
      
      public function get scoreRewardState() : int
      {
         var _loc1_:* = funcId;
         if(60810 !== _loc1_)
         {
            if(13386 !== _loc1_)
            {
               if(13376 !== _loc1_)
               {
                  return Day51Service.ins.scoreRewardState(vo.id);
               }
               return DragonBoatService.ins.stcModel.scoreRewardState(vo.id);
            }
            return TowerService.ins.stcModel.scoreRewardState(vo.rank);
         }
         return DialModel.getIns(60810).scoreRewardState(vo.rank);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_get === _loc3_)
         {
            this.do_server_getScoreReward();
         }
      }
      
      private function getHandler() : void
      {
         FloatUtil.showGetItemsDisplayPanel(this.list_gift.array);
         this.refreshUI();
      }
      
      public function get vo() : StaticMineSweepRankRewardModel
      {
         return this.dataSource as StaticMineSweepRankRewardModel;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(vo)
         {
            this.refreshUI();
         }
      }
      
      private function refreshUI() : void
      {
         this.txt_lv.text = String(vo.rank);
         this.list_gift.array = WealthUtil.costStrToArr(vo.reward);
         switch(int(this.scoreRewardState) - 1)
         {
            case 0:
               Effect2DUtils.hideBtnEff_btnMiddle(btn_get);
               this.btn_get.visible = false;
               this.img_get.visible = false;
               this.txt_need.visible = true;
               this.txt_need.text = LocaleMgr.ins.getStr(13386021,[vo.rank]);
               break;
            case 1:
               Effect2DUtils.showBtnEff_btnMiddle(btn_get);
               this.btn_get.visible = true;
               this.btn_get.disabled = false;
               this.img_get.visible = false;
               this.txt_need.visible = false;
               break;
            case 2:
               Effect2DUtils.hideBtnEff_btnMiddle(btn_get);
               this.btn_get.visible = false;
               this.img_get.visible = true;
               this.txt_need.visible = false;
         }
      }
   }
}
