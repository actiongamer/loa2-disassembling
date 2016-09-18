package nslm2.modules.cultivates.treasure.view.compose
{
   import game.ui.treasures.runeBag.RuneComposeUI;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import proto.Item;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.Event;
   import nslm2.modules.cultivates.treasure.service.TreasureService;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.greensock.TweenLite;
   
   public class RuneComposePanel extends RuneComposeUI
   {
       
      
      private var success:nslm2.modules.cultivates.treasure.view.compose.RuneComposeSuccess;
      
      private var nextRuneVo:StcItemVo;
      
      private var crtRuneVo:StcItemVo;
      
      private var item:Item;
      
      private var $activeEffect:BmcSpriteSheet;
      
      public function RuneComposePanel()
      {
         super();
      }
      
      public function get numBarRef() : NumBarS1
      {
         return this.numBar as NumBarS1;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         success = new nslm2.modules.cultivates.treasure.view.compose.RuneComposeSuccess();
         this.addChild(new nslm2.modules.cultivates.treasure.view.compose.RuneComposeSuccess());
         this.numBarRef.addEventListener("evt_numbar_value_change",numBarRef_change);
         this.img_btn_icon.skin = UrlLib.tipMenuIcon(1);
         DisplayUtils.addChildFromGlobal(this.btn_ok,this.img_btn_icon);
         item = param1 as Item;
         var _loc5_:int = item.itemId;
         crtRuneVo = StcMgr.ins.getItemVo(_loc5_);
         var _loc6_:int = BagModel.ins.getStcCount(_loc5_);
         this.renderFrom.wealthVo = WealthUtil.createWealthVo(20,_loc5_,3);
         var _loc2_:int = crtRuneVo.extend_1;
         var _loc4_:int = crtRuneVo.extend_2;
         var _loc3_:int = _loc4_ + 1;
         nextRuneVo = StcMgr.ins.getVoByMultiColumnValue("static_item",["kind","extend_1","extend_2"],[61,_loc2_ + "",_loc3_ + ""]);
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000092);
         var _loc7_:int = _loc6_ / 3;
         this.btn_ok.label = LocaleMgr.ins.getStr(999000093);
         if(_loc7_ > 0)
         {
            this.numBarRef.init(1,_loc7_,1);
            this.renderTo.wealthVo = WealthUtil.createWealthVo(20,nextRuneVo.id,1);
         }
         else
         {
            this.numBarRef.init(0,0,0);
            this.renderTo.wealthVo = WealthUtil.createWealthVo(20,nextRuneVo.id,0);
         }
         this.btn_ok.clickHandler = btn_handler;
         super.preShow(param1);
      }
      
      private function numBarRef_change(param1:Event) : void
      {
         this.renderTo.wealthVo = WealthUtil.createWealthVo(20,nextRuneVo.id,numBarRef.nowNum);
      }
      
      private function btn_handler() : void
      {
         this.numBar.mouseEvent = false;
         this.btn_ok.mouseEnabled = false;
         if(this.numBarRef.nowNum)
         {
            TreasureService.ins.runeComBine(nextRuneVo.id,item.id,numBarRef.nowNum,server_cpl);
         }
         else
         {
            ModuleMgr.ins.closeModule(this.moduleId);
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.FUMO_LESS_ID)),ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function server_cpl() : void
      {
         $activeEffect = new BmcSpriteSheet();
         $activeEffect.init(1015008,1,"all",true);
         $activeEffect.x = renderFrom.x - 170;
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
