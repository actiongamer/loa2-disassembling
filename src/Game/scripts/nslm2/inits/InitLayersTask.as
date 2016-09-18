package nslm2.inits
{
   import com.mz.core.utils2.task.TaskBase;
   import com.mz.core.mgrs.UIMgr;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import morn.core.components.Component;
   import com.mz.core.configs.ClientConfig;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class InitLayersTask extends TaskBase
   {
       
      
      public function InitLayersTask()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         var _loc1_:DisplayObjectContainer = UIMgr.root as DisplayObjectContainer;
         UIMgr.spriteFor3D = new Sprite();
         _loc1_.addChild(UIMgr.spriteFor3D);
         UIMgr.layer2D = new Component();
         _loc1_.addChild(UIMgr.layer2D);
         UIMgr.spriteFor3D.x = -ClientConfig.SCENE_BG_MARGIN;
         UIMgr.spriteFor3D.y = -ClientConfig.SCENE_BG_MARGIN;
         UIMgr.ins.dragLayer = new Sprite();
         _loc1_.addChild(UIMgr.ins.dragLayer);
         var _loc2_:Component = new Component();
         MornExpandUtil.setLayout(_loc2_);
         _loc2_.mouseChildren = true;
         ModuleMgr.ins.dramaLayer = _loc2_;
         UIMgr.layer2D.addChild(_loc2_);
         this.onComplete();
      }
   }
}
