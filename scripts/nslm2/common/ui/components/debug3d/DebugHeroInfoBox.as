package nslm2.common.ui.components.debug3d
{
   import morn.core.components.VBox;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.scenes.commons.Unit3DBase;
   import flash.system.System;
   import com.mz.core.logging.Log;
   import nslm2.modules.foundations.AlertUtil;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class DebugHeroInfoBox extends VBox
   {
       
      
      private var panel3D:UIPanel3D;
      
      private var debug_alphaThreshold:nslm2.common.ui.components.debug3d.Param3DRender;
      
      public var unit3d:Unit3DBase;
      
      public function DebugHeroInfoBox(param1:UIPanel3D)
      {
         var _loc3_:* = null;
         super();
         var _loc2_:Button = new Button(null,"导出");
         _loc2_.style = "按钮小绿";
         this.addChild(_loc2_);
         _loc2_.clickHandler = btn_clickHandler;
         debug_alphaThreshold = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc3_ = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc3_.paramType = "scale";
         _loc3_.countAutoSize();
         this.addChild(_loc3_);
         ModuleMgr.ins.debugBox.addChild(this);
         this.panel3D = param1;
      }
      
      public function bindTarget(param1:Unit3DBase) : void
      {
         this.unit3d = param1;
         this.debug_alphaThreshold.bind(param1.avatar,"alphaThreshold");
      }
      
      private function btn_clickHandler() : void
      {
         var _loc3_:Object = {};
         var _loc1_:Object = {};
         _loc3_["alphaThreshold"] = unit3d.avatar.alphaThreshold;
         _loc1_["model3d"] = _loc3_;
         var _loc2_:String = JSON.stringify(_loc1_);
         System.setClipboard(_loc2_);
         Log.debug(this,"导出数据:",_loc2_);
         AlertUtil.float("导出数据已经保存到剪贴板");
      }
   }
}
