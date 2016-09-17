package nslm2.modules.foundations.recycle.view.panel.treasureReborn
{
   import game.ui.recycleModules.treasureReborn.TreasureRebornPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.recycle.model.RecycleModel;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.greensock.TweenLite;
   import nslm2.modules.foundations.recycle.service.RecycleService;
   import proto.RecycleBaowuDecomposeRes;
   import nslm2.utils.WealthUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.BaoWu;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.common.globals.GlobalRef;
   import morn.customs.components.WealthRender;
   import morn.customs.expands.MornExpandUtil;
   import morn.core.components.Button;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   
   public class TreasureRebornPanel extends TreasureRebornPanelUI implements IViewStackPage, IObserver
   {
       
      
      private var recModel:RecycleModel;
      
      private var recEff:BmcSpriteSheet;
      
      private var bgEff:BmcSpriteSheet;
      
      public function TreasureRebornPanel()
      {
         super();
         recModel = RecycleModel.ins;
      }
      
      public function getFocusNotices() : Array
      {
         return ["recycle_notice_update_selected_item","recycle_notice_confirm"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("recycle_notice_update_selected_item" !== _loc3_)
         {
            if("recycle_notice_confirm" === _loc3_)
            {
               moveIconEndHandler();
            }
         }
         else
         {
            this.iconRender.dataSource = recModel.selectedRebornItem;
            iconRender.btn_remove.visible = false;
         }
      }
      
      private function moveIconEndHandler() : void
      {
         recEff = new BmcSpriteSheet();
         recEff.x = 280;
         recEff.y = -30;
         recEff.init(1130002);
         addChild(recEff);
         TweenLite.delayedCall(0.6,requestService);
      }
      
      private function requestService() : void
      {
         RecycleService.ins.recycleTreasureReborn([recModel.selectedRebornItem.id],true,TreasureDecomposeHandler,null);
      }
      
      private function TreasureDecomposeHandler(param1:RecycleBaowuDecomposeRes) : void
      {
         var _loc2_:Array = [];
         if(param1)
         {
            _loc2_ = WealthUtil.rewardArrToWealthVoArr(param1.res);
         }
         iconRender.dataSource = null;
         ObserverMgr.ins.sendNotice("recycle_notice_show_reward",_loc2_);
         recModel.selectedRebornItem = null;
         var _loc5_:int = 0;
         var _loc4_:* = param1.info;
         for each(var _loc3_ in param1.info)
         {
            TreasureModel.ins.updateTreasureData(_loc3_,_loc3_.statue);
         }
         recModel.updateIdleTreasureList();
         (GlobalRef.playerHeader_icon_diamond as WealthRender).refreshData();
         refeshCost();
      }
      
      public function viewStackIn() : void
      {
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         ObserverMgr.ins.regObserver(this);
         this.iconRender.dataSource = null;
         this.visible = true;
         refeshCost();
         bgEff = new BmcSpriteSheet();
         bgEff.x = 233;
         bgEff.y = 113;
         bgEff.init(1130003,1,"all",true);
         addChildAt(bgEff,1);
         recModel.updateIdleTreasureList();
         this.render_recycle.dataSource = 11305;
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_reborn === _loc2_)
         {
            if(PlayerModel.ins.getCountByWealthVo(costRender.wealthVo) < costRender.wealthVo.count)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(999000337));
            }
            else if(recModel.selectedRebornItem)
            {
               ModuleMgr.ins.showModule(11304,null,11300);
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(999000338));
            }
         }
      }
      
      private function refeshCost() : void
      {
         costRender.wealthVo = WealthVo.parseCostStr(DefindConsts.TREASURE_REBORN_COST);
         if(PlayerModel.ins.getCountByWealthVo(costRender.wealthVo) < costRender.wealthVo.count)
         {
            costRender.txt_num.color = 16723968;
         }
         else
         {
            costRender.txt_num.color = 458496;
         }
      }
      
      public function viewStackOut() : void
      {
         ObserverMgr.ins.unregObserver(this);
         this.visible = false;
         recModel.selectedRebornItem = null;
         bgEff.dispose();
         bgEff = null;
      }
   }
}
