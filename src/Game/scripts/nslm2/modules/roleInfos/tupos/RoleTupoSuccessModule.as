package nslm2.modules.roleInfos.tupos
{
   import game.ui.roleInfos.tupos.RoleTupoSuccessModuleUI;
   import away3d.containers.ObjectContainer3D;
   import org.specter3d.context.AppGlobalContext;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.geom.Rectangle;
   import com.mz.core.mgrs.UIMgr;
   import flash.display.Sprite;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.core.components.Component;
   import com.mz.core.utils.FilterUtil;
   import flash.display.Shape;
   import com.greensock.TweenLite;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.ui.components.comp3ds.ctrls.Avatar3DWinActionCtrl;
   import flash.display.BitmapData;
   import nslm2.common.ui.components.comps2d.others.ClickToNext;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   
   public class RoleTupoSuccessModule extends RoleTupoSuccessModuleUI
   {
       
      
      private var _avatar:UIUnit3D;
      
      private var floorImg:Image3D;
      
      private var coverImg:Image3D;
      
      private var _whiteBg:Shape;
      
      private var oriSceneLayerVisible:Boolean = false;
      
      public function RoleTupoSuccessModule()
      {
         super();
         this.moduleFadeInType = 0;
         this.moduleFadeOutType = 0;
      }
      
      public function get layer3D() : ObjectContainer3D
      {
         return AppGlobalContext.stage3d.view3d2Layer3D;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc3_:* = null;
         if(ModuleMgr.ins.sceneLayer.curModuleId == 50700)
         {
            ObserverMgr.ins.sendNotice("MSG_POP_MODULE_HOLE",new Rectangle(UIMgr.root.x,UIMgr.root.y,UIMgr.gameWidth,UIMgr.gameHeight));
         }
         var _loc2_:RoleTupoSuccessInitVo = param1 as RoleTupoSuccessInitVo;
         var _loc4_:Sprite = new Sprite();
         _loc4_.graphics.beginFill(0,0);
         _loc4_.graphics.drawRect(0,0,ClientConfig.SCENE_FIXED_W,ClientConfig.SCENE_FIXED_H);
         _loc4_.graphics.endFill();
         _loc4_.x = this.width - ClientConfig.SCENE_FIXED_W >> 1;
         _loc4_.y = this.height - ClientConfig.SCENE_FIXED_H >> 1;
         this.addChild(_loc4_);
         this._avatar = new UIUnit3D();
         this._avatar.y = -40;
         this._avatar.tag3DBottomBox.showShadow();
         this._avatar.initByStcNpcId(_loc2_.stcNpcId);
         this._avatar.addEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
         this._avatar.visible = false;
         this.floorImg = new Image3D(UrlLib.tupoCpl_img_floor());
         this.coverImg = new Image3D(null,ClientConfig.SCENE_FIXED_W,ClientConfig.SCENE_FIXED_H);
         if(_loc2_.addComponent)
         {
            _loc3_ = _loc2_.addComponent;
            _loc3_.x = _loc2_.addComponentX;
            _loc3_.y = _loc2_.addComponentY;
            this.addChild(_loc3_);
            this.img_title.skin = _loc2_.titleUrl;
            this.img_title.filters = [FilterUtil.highLightFilter(-10)];
         }
         ObserverMgr.ins.sendNotice("MSG_POP_UI_PANEL_3D_INIT",[this.moduleId,null]);
      }
      
      private function onStageClick() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      private function avatarAsset_onCpl(... rest) : void
      {
         preShowCpl();
      }
      
      override protected function preShowCpl() : void
      {
         _whiteBg = new Shape();
         _whiteBg.graphics.beginFill(16777215,1);
         _whiteBg.alpha = 0.1;
         _whiteBg.graphics.drawRect(-this.x,-this.y,ClientConfig.SCENE_FIXED_W,ClientConfig.SCENE_FIXED_H);
         addChild(_whiteBg);
         super.preShowCpl();
      }
      
      override public function fadeIn(param1:Number = 0, param2:int = 0) : void
      {
         super.fadeIn(param1,param2);
         TweenLite.to(this._whiteBg,0.3,{
            "alpha":0.5,
            "onComplete":whiteBgDisappear
         });
      }
      
      private function whiteBgDisappear() : void
      {
         DisplayUtils.removeSelf(_whiteBg);
         this._avatar.visible = true;
         new Avatar3DWinActionCtrl(_avatar,_avatar.actStd);
         this.layer3D.addChild(_avatar);
         this.layer3D.addChild(floorImg);
         floorImg.z = 1000;
         this.layer3D.addChild(this.coverImg);
         this.coverImg.z = 2000;
         drawFakeBg();
      }
      
      private function drawFakeBg() : void
      {
         var _loc1_:BitmapData = new BitmapData(1,1,true,3707764736);
         this.coverImg.showByBmd(_loc1_);
         oriSceneLayerVisible = ModuleMgr.ins.sceneLayer.visible;
         ModuleMgr.ins.sceneLayer.visible = false;
         ModuleMgr.ins.staticLayer.visible = false;
         TweenLite.delayedCall(2,addBoxTipHandler);
      }
      
      private function addBoxTipHandler() : void
      {
         (this.box_tip as ClickToNext).addHandler(onStageClick);
      }
      
      override public function dispose() : void
      {
         this._avatar.dispose();
         this.floorImg.dispose();
         this.coverImg.dispose();
         this._avatar = null;
         if(UIPanel3D.insArr.length > 0)
         {
            UIPanel3D.insArr[UIPanel3D.insArr.length - 1].switchByPanel3D(true);
         }
         ObserverMgr.ins.sendNotice("MSG_POP_UI_PANEL_3D_DISPOSE",this.moduleId);
         ModuleMgr.ins.sceneLayer.visible = oriSceneLayerVisible;
         ModuleMgr.ins.staticLayer.visible = true;
         ObserverMgr.ins.sendNotice("tupoModuleClose");
         TweenLite.killDelayedCallsTo(addBoxTipHandler);
         super.dispose();
      }
   }
}
