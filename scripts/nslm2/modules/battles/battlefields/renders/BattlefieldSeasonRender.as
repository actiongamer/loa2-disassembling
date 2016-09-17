package nslm2.modules.battles.battlefields.renders
{
   import game.ui.battlefield.BattlefieldRank.render.BattlefieldSeasonRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcBgtitleIntvlVo;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.WealthUtil;
   import com.mz.core.utils.FilterUtil;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.core.components.Button;
   import proto.BgGetTitleRewardReq;
   import nslm2.modules.battles.battlefields.service.BattlefieldService;
   import morn.customs.expands.MornExpandUtil;
   
   public class BattlefieldSeasonRender extends BattlefieldSeasonRenderUI
   {
       
      
      private var btnEff:BmcSpriteSheet;
      
      public function BattlefieldSeasonRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         this.txt_isNowRank.font = "Em_YaHeiB";
         this.txt_isNowRank.rotation = -45;
         this.box_isNowRank.mouseEvent = false;
      }
      
      public function get vo() : StcBgtitleIntvlVo
      {
         return this.dataSource as StcBgtitleIntvlVo;
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldDegreeRankRewardCpl",onRewardCpl);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldDegreeRankRewardCpl",onRewardCpl);
         }
      }
      
      private function onRewardCpl(param1:MzEvent) : void
      {
         if(vo)
         {
            if(vo.id == param1.data as int)
            {
               refresh();
               FloatUtil.showGetItemsDisplayPanel(this.list_reward.array);
            }
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:int = 0;
         .super.dataSource = param1;
         if(param1)
         {
            switchEventListeners(true);
            this.img_icon.url = UrlLib.battlefieldDegreeIcon(vo.id);
            this.box_isNowRank.visible = BattlefieldModel.ins.bgInfoRes.degree == vo.id;
            this.txt_name.text = LocaleMgr.ins.getStr(vo.tite_name);
            _loc2_ = vo.title_need_num.split("|")[0];
            this.txt_condition.text = LocaleMgr.ins.getStr(50500131) + TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(50500094) + _loc2_,458496);
            this.list_reward.dataSource = WealthUtil.costStrToArr(vo.title_reward);
            refresh();
         }
         else
         {
            switchEventListeners(false);
         }
      }
      
      private function refresh() : void
      {
         if(BattlefieldModel.ins.bgInfoRes.degree < vo.id)
         {
            this.img_finished.visible = false;
            this.btn_reward.filters = [FilterUtil.grayFilter()];
            this.btn_reward.mouseEvent = false;
            this.btn_reward.visible = true;
            showBtnEffect(false);
         }
         else if(BattlefieldModel.ins.getedDegreeRankRewardIds.indexOf(vo.id) != -1)
         {
            this.img_finished.visible = true;
            this.btn_reward.visible = false;
            showBtnEffect(false);
         }
         else
         {
            this.btn_reward.visible = true;
            this.btn_reward.filters = null;
            this.btn_reward.mouseEvent = true;
            this.img_finished.visible = false;
            showBtnEffect(true);
         }
      }
      
      private function showBtnEffect(param1:Boolean) : void
      {
         if(param1)
         {
            if(!btnEff)
            {
               btnEff = new BmcSpriteSheet();
               btnEff.init(115002,1,"all",true);
               btnEff.scaleX = 0.7;
               btnEff.scaleY = 0.85;
               btnEff.x = -8;
               btnEff.y = -10;
               this.btn_reward.addChild(btnEff);
            }
         }
         else if(btnEff)
         {
            btnEff.dispose();
            btnEff = null;
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1;
         if(this.btn_reward === _loc3_)
         {
            _loc2_ = new BgGetTitleRewardReq();
            _loc2_.id = this.vo.id;
            BattlefieldService.ins.getDegreeRankReward(_loc2_);
         }
      }
   }
}
