package nslm2.modules.bag.equipComposes
{
   import game.ui.BagModules.equipComposes.EquipComposeUI;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import proto.Item;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.Event;
   import proto.ItemHechengReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import com.greensock.TweenLite;
   
   public class EquipCompose extends EquipComposeUI
   {
       
      
      private var success:nslm2.modules.bag.equipComposes.EquipComposeSuccess;
      
      private var pieceVo:StcItemVo;
      
      private var item:Item;
      
      private var $activeEffect:BmcSpriteSheet;
      
      public function EquipCompose()
      {
         super();
      }
      
      public function get numBarRef() : NumBarS1
      {
         return this.numBar as NumBarS1;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         BmcSpriteSheet.preload(new <int>[1015008]);
         success = new nslm2.modules.bag.equipComposes.EquipComposeSuccess();
         this.addChild(new nslm2.modules.bag.equipComposes.EquipComposeSuccess());
         this.numBarRef.addEventListener("evt_numbar_value_change",numBarRef_change);
         this.img_btn_icon.skin = UrlLib.tipMenuIcon(1);
         DisplayUtils.addChildFromGlobal(this.btn_ok,this.img_btn_icon);
         item = param1 as Item;
         var _loc4_:int = item.itemId;
         pieceVo = StcMgr.ins.getItemVo(_loc4_);
         var _loc2_:int = BagModel.ins.getStcCount(_loc4_);
         this.renderFrom.wealthVo = WealthUtil.createWealthVo(20,_loc4_,pieceVo.equipPieceComposeCount);
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000013);
         var _loc3_:int = Math.floor(_loc2_ / this.pieceVo.equipPieceComposeCount);
         this.btn_ok.label = LocaleMgr.ins.getStr(999000014);
         if(_loc3_ > 0)
         {
            this.numBarRef.init(1,_loc3_,1);
            this.renderTo.wealthVo = WealthUtil.createWealthVo(20,pieceVo.equipPieceComposeEquipId,1);
         }
         else
         {
            this.numBarRef.init(0,0,0);
            this.renderTo.wealthVo = WealthUtil.createWealthVo(20,pieceVo.equipPieceComposeEquipId,0);
         }
         this.btn_ok.clickHandler = btn_handler;
         super.preShow(param1);
      }
      
      private function numBarRef_change(param1:Event) : void
      {
         this.renderTo.wealthVo = WealthUtil.createWealthVo(20,pieceVo.equipPieceComposeEquipId,numBarRef.nowNum);
      }
      
      private function btn_handler() : void
      {
         var _loc1_:* = null;
         this.numBar.mouseEvent = false;
         this.btn_ok.mouseEnabled = false;
         if(this.numBarRef.nowNum)
         {
            _loc1_ = new ItemHechengReq();
            _loc1_.itemId = item.id;
            _loc1_.count = int(this.numBarRef.nowNum);
            ServerEngine.ins.send(8102,_loc1_,server_cpl);
         }
         else
         {
            ModuleMgr.ins.closeModule(this.moduleId);
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealth(20,pieceVo.id),ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function server_cpl() : void
      {
         $activeEffect = new BmcSpriteSheet();
         $activeEffect.init(1015008,1,"all",true);
         $activeEffect.x = renderFrom.x - 70;
         $activeEffect.y = renderFrom.y + 90;
         $activeEffect.scaleY = -1;
         DisplayUtils.addChildAbove($activeEffect,this.box1);
         TweenLite.to($activeEffect,0.8,{
            "x":renderTo.x - 40,
            "onComplete":flyCpl
         });
      }
      
      private function flyCpl() : void
      {
         TweenLite.delayedCall(0.3,effectCpl);
      }
      
      private function effectCpl() : void
      {
         this.box1.visible = false;
         this.$activeEffect.visible = false;
         this.success.show(renderTo.wealthVo,renderTo.img_icon);
      }
   }
}
