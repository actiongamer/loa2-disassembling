package nslm2.modules.funnies.newYears.newYear2016s
{
   import game.ui.newYears.newYear2016s.NewYear2016_GodSubPanel1UI;
   import nslm2.modules.funnies.newYears.newYear2016s.models.NewYear2016Service;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.skins.Effect2DUtils;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.bag.itemModuels.BagModel;
   import proto.Item;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.bag.UseBatchShowParam;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class NewYear2016_GodSubPanel1 extends NewYear2016_GodSubPanel1UI
   {
       
      
      public var shineStartX:int;
      
      public var shineEndX:int;
      
      private var sparkEff:BmcSpriteSheet;
      
      public function NewYear2016_GodSubPanel1()
      {
         super();
         shineStartX = this.img_progressShine.x;
         shineEndX = this.img_progressShine.x + 312;
         switchEventListeners(true);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.txt_tip1.text = LocaleMgr.ins.getStr(13310010);
         sparkEff = new BmcSpriteSheet();
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.setAnchor(0.5,0.5);
         _loc1_.init(60000003,1,"all",true);
         addChild(_loc1_);
         sparkEff.y = this.img_progressShine.y + 62;
         this.img_progressShine.visible = false;
         this.refreshUI();
      }
      
      public function get service() : NewYear2016Service
      {
         return NewYear2016Service.ins;
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.service.addEventListener("EVT_WELCOME_GOD_USE_FIRE_CRACKER",onUseFireCracker);
            this.service.addEventListener("EVT_WELCOME_GOD_GET_REWARD",onGetReward);
         }
         else
         {
            this.service.removeEventListener("EVT_WELCOME_GOD_USE_FIRE_CRACKER",onUseFireCracker);
            this.service.removeEventListener("EVT_WELCOME_GOD_GET_REWARD",onGetReward);
         }
      }
      
      private function refreshUI() : void
      {
         this.txt_val.text = LocaleMgr.ins.getStr(999000439) + service.welcomeGodInfoRes.wishValue + "/" + 100;
         this.progressBar.value = service.welcomeGodInfoRes.wishValue / 100;
         this.img_progressShine.x = this.shineStartX + (this.shineEndX - this.shineStartX) * (service.welcomeGodInfoRes.wishValue / 100);
         sparkEff.x = this.img_progressShine.x + 37;
         if(this.service.canGetWelcomeGod() == false)
         {
            this.icon_item1.visible = true;
            this.icon_item2.visible = false;
            this.btn_get.label = LocaleMgr.ins.getStr(999000440);
            Effect2DUtils.hideBtnEff_btnBig(this.btn_get);
         }
         else
         {
            this.icon_item1.visible = false;
            this.icon_item2.visible = true;
            this.btn_get.label = LocaleMgr.ins.getStr(999000240);
            Effect2DUtils.showBtnEff_btnBig(this.btn_get);
         }
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = param1;
         if(this.btn_get === _loc6_)
         {
            if(this.service.canGetWelcomeGod() == false)
            {
               if(BagModel.ins.getStcCount(83010) > 0)
               {
                  _loc3_ = BagModel.ins.getItemById(BagModel.ins.getIdBySid(83010));
                  _loc4_ = WealthUtil.createItemVo(_loc3_.itemId,_loc3_.count);
                  _loc4_.item = _loc3_;
                  _loc5_ = new UseBatchShowParam();
                  _loc5_.wealthVo = _loc4_;
                  _loc5_.title = LocaleMgr.ins.getStr(999000440);
                  _loc5_.maxCount = Math.min(_loc3_.count,100 - service.welcomeGodInfoRes.wishValue);
                  _loc5_.defaultCount = _loc5_.maxCount;
                  _loc5_.useHandler = this.service.server_springFireCracker;
                  ModuleMgr.ins.showModule(11030,_loc5_,ModuleMgr.ins.popLayer.curModuleId);
               }
               else
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(13310104));
               }
            }
            else
            {
               this.service.server_getWelcomeGodReward();
            }
         }
      }
      
      private function onUseFireCracker(... rest) : void
      {
         var _loc2_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc2_.init(60000004);
         addChild(_loc2_);
         _loc2_.x = 200;
         _loc2_.y = 200;
         ModuleMgr.ins.closeModule(11030);
         this.refreshUI();
      }
      
      private function onGetReward(... rest) : void
      {
         this.refreshUI();
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
