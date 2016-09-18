package nslm2.modules.funnies.newYears.day38s
{
   import game.ui.newYears.day38s.Day38_GiftPanelRenderUI;
   import nslm2.modules.funnies.newYears.day38s.services.Day38Service;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import proto.StaticGoddesAwardModel;
   import nslm2.utils.WealthUtil;
   import nslm2.utils.LabelUtils;
   import nslm2.mgrs.skins.Effect2DUtils;
   import morn.customs.expands.MornExpandUtil;
   
   public class Day38_GiftPanelRender extends Day38_GiftPanelRenderUI
   {
       
      
      public function Day38_GiftPanelRender()
      {
         super();
         this.btn_get.label = LocaleMgr.ins.getStr(41300099);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      public function get service() : Day38Service
      {
         return Day38Service.ins;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_get === _loc3_)
         {
            if(NpcFuncService.ins.isOpenTime(13334))
            {
               this.service.server_goddessGetScoreReward(this.stcVo.id);
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(13333016,[TimeUtils.getFullTimeStr(service.panelRes.voteStartStamp,false,false),TimeUtils.getFullTimeStr(service.panelRes.voteEndStamp,false,false)]));
            }
         }
      }
      
      public function get stcVo() : StaticGoddesAwardModel
      {
         return this.dataSource as StaticGoddesAwardModel;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(stcVo)
         {
            list_gift.array = WealthUtil.costStrToArr(this.stcVo.reward);
            this.txt1.text = LocaleMgr.ins.getStr(13333009,[this.stcVo.score]);
            txt2.text = LocaleMgr.ins.getStr(13333010,[this.service.scorePanelRes.myScore,this.stcVo.score]);
            txt2.color = LabelUtils.getCountNeedColor(this.service.scorePanelRes.myScore,this.stcVo.score);
            if(this.service.scorePanelRes.myScore < this.stcVo.score)
            {
               this.img_get.visible = false;
               this.btn_get.visible = true;
               this.btn_get.disabled = true;
               Effect2DUtils.hideBtnEff_btnBig(this.btn_get);
            }
            else if(this.service.scorePanelRes.scoreId.indexOf(this.stcVo.id) == -1)
            {
               this.img_get.visible = false;
               this.btn_get.visible = true;
               this.btn_get.disabled = false;
               Effect2DUtils.showBtnEff_btnBig(this.btn_get);
            }
            else
            {
               this.img_get.visible = true;
               this.btn_get.visible = false;
               Effect2DUtils.hideBtnEff_btnBig(this.btn_get);
            }
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
