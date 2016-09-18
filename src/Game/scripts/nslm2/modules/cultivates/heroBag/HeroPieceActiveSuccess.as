package nslm2.modules.cultivates.heroBag
{
   import morn.customs.components.PopModuleView;
   import nslm2.modules.cultivates.lotteryHeroModules.results.LotteryHeroResultHigthName;
   import away3d.containers.ObjectContainer3D;
   import org.specter3d.context.AppGlobalContext;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import morn.customs.components.GRect;
   import morn.customs.expands.MornExpandUtil;
   import proto.HeroInfo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.core.managers.timerMgrs.TimerManager;
   import morn.core.handlers.Handler;
   import nslm2.common.ui.components.comp3ds.ctrls.Avatar3DWinActionCtrl;
   import flash.display.BitmapData;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.events.MouseEvent;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   
   public class HeroPieceActiveSuccess extends PopModuleView
   {
       
      
      private var ui:LotteryHeroResultHigthName;
      
      private var _avatar:UIUnit3D;
      
      private var floorImg:Image3D;
      
      private var coverImg:Image3D;
      
      private var moduleParam:nslm2.modules.cultivates.heroBag.HeroPieceActiveSuccessParam;
      
      public function HeroPieceActiveSuccess()
      {
         super();
         MornExpandUtil.setLayout(this);
         this.moduleFadeInType = 0;
         this.moduleFadeOutType = 0;
      }
      
      public function get layer3D() : ObjectContainer3D
      {
         return AppGlobalContext.stage3d.view3d2Layer3D;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         moduleParam = param1 as nslm2.modules.cultivates.heroBag.HeroPieceActiveSuccessParam;
         var _loc2_:GRect = new GRect();
         _loc2_.fillColor = 0;
         _loc2_.fillAlpha = 0;
         _loc2_.lineAlpha = 0;
         MornExpandUtil.setLayout(_loc2_);
         this.addChild(_loc2_);
         var _loc3_:HeroInfo = moduleParam.heroInfo;
         ui = new LotteryHeroResultHigthName();
         ui.clickToNextUI.visible = true;
         ui.clickToNextButtonTimeUI.visible = false;
         ui.centerX = 0;
         ui.centerY = 0;
         ui.show(_loc3_,false);
         this.addChild(ui);
         this._avatar = new UIUnit3D();
         this._avatar.y = -40;
         this._avatar.tag3DBottomBox.showShadow();
         this._avatar.initByStcNpcId(_loc3_.baseInfo.baseId);
         this._avatar.addEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
         this._avatar.visible = false;
         this.floorImg = new Image3D(UrlLib.tupoCpl_img_floor());
         this.coverImg = new Image3D(null,ClientConfig.SCENE_FIXED_W,ClientConfig.SCENE_FIXED_H);
         ObserverMgr.ins.sendNotice("MSG_POP_UI_PANEL_3D_INIT",[this.moduleId,null]);
      }
      
      private function avatarAsset_onCpl(... rest) : void
      {
         super.preShow(null);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         this.layer3D.addChild(_avatar);
         this.layer3D.addChild(floorImg);
         floorImg.z = 1000;
         this.layer3D.addChild(this.coverImg);
         this.coverImg.z = 2000;
         drawFakeBg();
         var _loc2_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc2_.setAnchor(0.5,0.5);
         _loc2_.init(8002);
         _loc2_.x = this.width / 2;
         _loc2_.y = this.height / 2;
         ui.fadeIn(1.66666666666667,11903);
         this.addChild(_loc2_);
         TimerManager.ins.doOnce(1458.33333333333,new Handler(effectHalfCpl,[moduleParam.heroInfo]));
      }
      
      private function effectHalfCpl(param1:HeroInfo) : void
      {
         var _loc2_:* = null;
         if(_avatar)
         {
            _loc2_ = param1;
            this._avatar.visible = true;
            new Avatar3DWinActionCtrl(_avatar,_avatar.actStd);
            this.stage.addEventListener("click",stage_click);
         }
      }
      
      private function drawFakeBg() : void
      {
         var _loc1_:BitmapData = new BitmapData(1,1,true,3707764736);
         this.coverImg.showByBmd(_loc1_);
         ModuleMgr.ins.sceneLayer.visible = false;
         ModuleMgr.ins.staticLayer.visible = false;
      }
      
      private function stage_click(param1:MouseEvent) : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         this.stage.removeEventListener("click",stage_click);
         this._avatar.dispose();
         this._avatar = null;
         this.floorImg.dispose();
         this.floorImg = null;
         this.coverImg.dispose();
         this.coverImg = null;
         if(UIPanel3D.insArr.length > 0)
         {
            UIPanel3D.insArr[UIPanel3D.insArr.length - 1].switchByPanel3D(true);
         }
         ObserverMgr.ins.sendNotice("MSG_POP_UI_PANEL_3D_DISPOSE",this.moduleId);
         ModuleMgr.ins.sceneLayer.visible = true;
         ModuleMgr.ins.staticLayer.visible = true;
         super.preClose(param1);
      }
      
      override public function close(param1:Object = null) : void
      {
         super.close(param1);
         Handler.execute(moduleParam.handler);
      }
   }
}
