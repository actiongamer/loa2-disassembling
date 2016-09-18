package nslm2.modules.funnies.newYears.charmStar.view
{
   import game.ui.mallModule.MallBuyComfirmModuleUI;
   import com.netease.protobuf.UInt64;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import proto.CharmRankSendChocolateReq;
   import nslm2.common.model.PlayerModel;
   import nslm2.nets.sockets.ServerEngine;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import flash.events.Event;
   
   public class CharmStarUseCocoConfirmModule extends MallBuyComfirmModuleUI
   {
       
      
      private var toId:UInt64;
      
      private var lastCount:Number;
      
      public function CharmStarUseCocoConfirmModule()
      {
         super();
      }
      
      public function get numBarRef() : NumBarS1
      {
         return this.numBar as NumBarS1;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.box_qqAlert.visible = false;
         this.txt_tip1.text = LocaleMgr.ins.getStr(13323019);
         this.txt_tip1.height = 44;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(13323007);
         this.toId = param1 as UInt64;
         var _loc2_:Array = [WealthUtil.createItemVo(200011)];
         this.numBarRef.addEventListener("evt_numbar_value_change",numBarRef_change);
         this.list_items.repeatX = _loc2_.length;
         this.list_items.dataSource = _loc2_;
         this.numBarRef.init(1,DefindConsts.CHARM_RANK_SEND_LIMIT,1);
         btn_ok.clickHandler = buyHandler;
         this.btn_ok.label = LocaleMgr.ins.getStr(10600018);
         this.render_totalPrize.visible = false;
         super.preShow(param1);
      }
      
      private function buyHandler() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(NpcFuncService.ins.isOpenTime(13403) == false)
         {
            AlertUtil.floadFuncTimeIsExpire(13400);
            return;
         }
         if(BagModel.ins.getStcCount(200011) < numBarRef.nowNum)
         {
            ModuleMgr.ins.closeModule(moduleId);
            AlertUtil.float(LocaleMgr.ins.getStr(13323016));
            _loc1_ = StcMgr.ins.getShopVo(200011);
            if(_loc1_)
            {
               ModuleMgr.ins.showModule(60320,_loc1_,ModuleMgr.ins.popLayer.curModuleId);
            }
         }
         else
         {
            _loc2_ = new CharmRankSendChocolateReq();
            _loc2_.id = !!this.toId?this.toId:PlayerModel.ins.playerInfo.id;
            _loc2_.num = this.numBarRef.nowNum;
            lastCount = BagModel.ins.getStcCount(200012);
            ServerEngine.ins.send(10010,_loc2_,cplHandler);
         }
      }
      
      private function cplHandler() : void
      {
         if(BagModel.ins.getStcCount(200011) > 0)
         {
            NpcFuncService.ins.changeCount(13402,1);
         }
         else
         {
            NpcFuncService.ins.changeCount(13402,0);
         }
         if(BagModel.ins.getStcCount(200012) > 0)
         {
            NpcFuncService.ins.changeCount(13401,1);
         }
         else
         {
            NpcFuncService.ins.changeCount(13401,0);
         }
         ObserverMgr.ins.sendNotice("GIVE_CPL");
         ModuleMgr.ins.closeModule(this.moduleId);
         var _loc1_:int = BagModel.ins.getStcCount(200012);
         if(_loc1_ - lastCount > 0)
         {
            FloatUtil.showGetItemsDisplayPanel([WealthUtil.createItemVo(200012,_loc1_ - lastCount)]);
         }
      }
      
      private function numBarRef_change(param1:Event) : void
      {
         var _loc2_:Array = [WealthUtil.createItemVo(200011,numBarRef.nowNum)];
         this.list_items.dataSource = _loc2_;
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
      }
   }
}
