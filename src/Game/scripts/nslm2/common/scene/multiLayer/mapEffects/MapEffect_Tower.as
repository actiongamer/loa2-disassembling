package nslm2.common.scene.multiLayer.mapEffects
{
   import nslm2.common.scene.multiLayer.BgLayerCtrlBase;
   import org.specter3d.display.Specter3D;
   import org.specter3d.display.avatar2.AvatarBody3D;
   import nslm2.common.scene.multiLayer.configs.BgTransfrom3DVo;
   import flash.events.MouseEvent;
   import com.mz.core.configs.EnvConfig;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.utils.RTools;
   import nslm2.common.scene.multiLayer.BgLayer;
   import nslm2.modules.fightPlayer.FactoryUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import away3d.entities.Entity;
   import morn.core.components.HBox;
   import nslm2.common.ui.components.debug3d.Object3DParams;
   import com.mz.core.mgrs.UIMgr;
   
   public class MapEffect_Tower extends BgLayerCtrlBase
   {
       
      
      private var tower:Specter3D;
      
      private var box:Specter3D;
      
      private var model3D:Vector.<AvatarBody3D>;
      
      private var up:Boolean = true;
      
      private var towerYStart:int = 224;
      
      private var towerYEnd:int;
      
      public function MapEffect_Tower(param1:BgLayer)
      {
         var _loc8_:int = 0;
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc7_:* = null;
         model3D = new Vector.<AvatarBody3D>();
         towerYEnd = towerYStart - 410;
         super(param1,null);
         box = new Specter3D();
         this.bgLayer.addChild(new Specter3D());
         tower = new Specter3D();
         box.addChild(new Specter3D());
         var _loc4_:Vector.<BgTransfrom3DVo> = createTransform3DArr();
         var _loc6_:int = _loc4_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc6_)
         {
            _loc5_ = _loc4_[_loc8_];
            _loc3_ = FactoryUtil.add3D(false,StcMgr.ins.getModelVo(30010));
            _loc3_.rotationY = _loc5_.rotationY;
            _loc3_.y = _loc5_.y;
            _loc3_.scaleAll = 1;
            _loc3_.scaleX = _loc3_.scaleX * _loc5_.scaleX;
            _loc3_.renderLayer = Entity.DECAL_LAYER;
            this.tower.addChild(_loc3_);
            _loc8_++;
         }
         this.tower.scaleAll = 1;
         this.box.x = -560;
         this.box.y = -500;
         box.rotationX = -20;
         this.tower.y = towerYStart;
         TimerManager.ins.doFrameLoop(1,this.onLoop);
         if(false && EnvConfig.ins.showDebugModule)
         {
            _loc2_ = new HBox();
            _loc7_ = new Object3DParams("tower");
            _loc7_.bind(tower);
            _loc2_.addChild(_loc7_);
            _loc7_ = new Object3DParams("box");
            _loc7_.bind(box);
            _loc2_.addChild(_loc7_);
            UIMgr.stage.addChild(_loc2_);
            _loc2_.y = 30;
            UIMgr.stage.addEventListener("click",stage_onClick);
         }
      }
      
      private function createTransform3DArr() : Vector.<BgTransfrom3DVo>
      {
         var _loc2_:* = null;
         var _loc1_:Vector.<BgTransfrom3DVo> = new Vector.<BgTransfrom3DVo>();
         _loc2_ = new BgTransfrom3DVo();
         _loc2_.rotationY = 0;
         _loc2_.y = 0;
         _loc2_.scaleX = 1;
         _loc1_.push(_loc2_);
         _loc2_ = new BgTransfrom3DVo();
         _loc2_.rotationY = 180;
         _loc2_.y = 0;
         _loc2_.scaleX = -1;
         _loc1_.push(_loc2_);
         _loc2_ = new BgTransfrom3DVo();
         _loc2_.rotationY = 0;
         _loc2_.y = 410;
         _loc2_.scaleX = 1;
         _loc1_.push(_loc2_);
         _loc2_ = new BgTransfrom3DVo();
         _loc2_.rotationY = 180;
         _loc2_.y = 410;
         _loc2_.scaleX = -1;
         _loc1_.push(_loc2_);
         _loc2_ = new BgTransfrom3DVo();
         _loc2_.rotationY = 0;
         _loc2_.y = 820;
         _loc2_.scaleX = 1;
         _loc1_.push(_loc2_);
         _loc2_ = new BgTransfrom3DVo();
         _loc2_.rotationY = 180;
         _loc2_.y = 820;
         _loc2_.scaleX = -1;
         _loc1_.push(_loc2_);
         return _loc1_;
      }
      
      private function stage_onClick(param1:MouseEvent) : void
      {
         if(EnvConfig.ins.showDevModule && param1.altKey)
         {
            up = !up;
         }
      }
      
      private function onLoop() : void
      {
         if(up)
         {
            this.tower.rotationY = this.tower.rotationY + 0.2;
            this.tower.y = this.tower.y - 1;
            if(this.tower.y < towerYEnd)
            {
               this.tower.y = towerYStart;
            }
         }
      }
      
      override public function dispose() : void
      {
         TimerManager.ins.clearTimer(onLoop);
         box.dispose();
         tower.dispose();
         RTools.disposeArrOrVector(model3D);
         super.dispose();
      }
   }
}
