package nslm2.modules.funnies.teamGuajiScenes.pvp.pieceBag
{
   import game.ui.teamGuajiScenes.pvp.TreasureComposePanelUI;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.nets.sockets.ServerEngine;
   import proto.PlayerDataNotify;
   import proto.BaoWu;
   import nslm2.utils.WealthUtil;
   import proto.Item;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import com.mz.core.utils.DisplayUtils;
   import com.greensock.TweenLite;
   import proto.ItemHechengReq;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   
   public class TreasureComposeModule extends TreasureComposePanelUI
   {
       
      
      private var pieceData:WealthVo;
      
      private var $activeEffect:BmcSpriteSheet;
      
      public function TreasureComposeModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9041218);
         pieceData = param1 as WealthVo;
         pieceData.useStcCount = true;
         this.pieceRender.dataSource = pieceData;
         updateCnt();
         txt_pieceName.color = ColorLib.qualityColor(pieceData.quality);
         txt_pieceName.text = pieceData.showName;
         this.btn_compose.clickHandler = btn_handler;
         super.preShowCpl();
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            ServerEngine.ins.addAlwayHandler(8004,playerDataNofifyHandler);
         }
         else
         {
            ServerEngine.ins.removeAlwayHandler(8004,playerDataNofifyHandler);
         }
      }
      
      private function playerDataNofifyHandler(param1:PlayerDataNotify) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(param1.cmd == 8102)
         {
            _loc3_ = [];
            if(param1.addBaowu)
            {
               var _loc7_:int = 0;
               var _loc6_:* = param1.addBaowu;
               for each(var _loc5_ in param1.addBaowu)
               {
                  _loc2_ = WealthUtil.treasureToVo(_loc5_);
                  _loc3_.push(_loc2_);
               }
               var _loc9_:int = 0;
               var _loc8_:* = param1.addItems;
               for each(var _loc4_ in param1.addItems)
               {
                  _loc2_ = WealthUtil.itemToVo(_loc4_);
                  _loc3_.push(_loc2_);
               }
            }
            _loc3_.sortOn("quality",16 | 2);
            FloatUtil.showGetItemsDisplayPanel(_loc3_,LocaleMgr.ins.getStr(999000465),null,0,true,0,false);
            ObserverMgr.ins.sendNotice("MSG_EQUIP_COMPOSE_SUCCESS");
         }
      }
      
      private function btn_handler() : void
      {
         if(this.numBarRef.nowNum)
         {
            playEffect();
         }
         else
         {
            ModuleMgr.ins.closeModule(this.moduleId);
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealth(20,pieceData.stcItemVo.id),ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function playEffect() : void
      {
         $activeEffect = new BmcSpriteSheet();
         $activeEffect.init(1015008,1,"all",true);
         $activeEffect.x = pieceRender.x - 20;
         $activeEffect.y = pieceRender.y + 90;
         $activeEffect.scaleY = -1;
         DisplayUtils.addChildAbove($activeEffect,this.pieceRender);
         TweenLite.to($activeEffect,0.8,{
            "x":200,
            "onComplete":flyCpl
         });
      }
      
      private function reqeustCompose() : void
      {
         var _loc1_:ItemHechengReq = new ItemHechengReq();
         _loc1_.itemId = BagModel.ins.getIdBySid(pieceData.sid);
         _loc1_.count = int(this.numBarRef.nowNum);
         ServerEngine.ins.send(8102,_loc1_,server_cpl);
      }
      
      private function server_cpl() : void
      {
         this.updateCnt();
         ObserverMgr.ins.sendNotice("guaji_update_piece_bag");
      }
      
      private function flyCpl() : void
      {
         TweenLite.delayedCall(0.3,effectCpl);
      }
      
      private function effectCpl() : void
      {
         $activeEffect.dispose();
         reqeustCompose();
      }
      
      private function updateCnt() : void
      {
         if(pieceData.showCount >= needCnt)
         {
            txt_pieceCnt.color = 458496;
         }
         else
         {
            txt_pieceCnt.color = 16723968;
         }
         txt_pieceCnt.text = pieceData.showCount + "/" + needCnt;
         var _loc1_:int = Math.floor(pieceData.showCount / needCnt);
         if(_loc1_ > 0)
         {
            this.numBarRef.init(1,_loc1_,1);
         }
         else
         {
            this.numBarRef.init(0,0,0);
         }
      }
      
      public function get numBarRef() : NumBarS1
      {
         return this.numberBar as NumBarS1;
      }
      
      private function get needCnt() : int
      {
         return int(pieceData.stcItemVo.extend_1);
      }
      
      override public function show(param1:Object = null) : void
      {
         NGUtil.checkModuleShow(this.moduleId);
         super.show(param1);
      }
   }
}
