package nslm2.common.ui.components.debug3d
{
   import morn.core.components.VBox;
   import away3d.filters.BloomFilter3D;
   import com.mz.core.utils.DisplayUtils;
   
   public class DebugBloomFilterBox extends VBox
   {
      
      public static const KEY_BloomFilter:String = "BloomFilter";
       
      
      private var pr_blurX:nslm2.common.ui.components.debug3d.Param3DRender;
      
      private var pr_blurY:nslm2.common.ui.components.debug3d.Param3DRender;
      
      private var pr_exposure:nslm2.common.ui.components.debug3d.Param3DRender;
      
      private var pr_threshold:nslm2.common.ui.components.debug3d.Param3DRender;
      
      public function DebugBloomFilterBox()
      {
         super();
      }
      
      public function bind(param1:BloomFilter3D) : void
      {
         var _loc2_:* = null;
         pr_blurX = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc2_ = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc2_.paramType = "position";
         _loc2_.min = 2;
         _loc2_.max = 50;
         _loc2_.bind(param1,"blurX");
         _loc2_.countAutoSize();
         this.addChild(_loc2_);
         pr_blurY = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc2_ = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc2_.paramType = "position";
         _loc2_.min = 2;
         _loc2_.max = 50;
         _loc2_.bind(param1,"blurY");
         _loc2_.countAutoSize();
         this.addChild(_loc2_);
         pr_exposure = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc2_ = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc2_.paramType = "scale";
         _loc2_.bind(param1,"exposure");
         _loc2_.countAutoSize();
         this.addChild(_loc2_);
         pr_threshold = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc2_ = new nslm2.common.ui.components.debug3d.Param3DRender();
         _loc2_.paramType = "scale";
         _loc2_.bind(param1,"threshold");
         _loc2_.countAutoSize();
         this.addChild(_loc2_);
         this.commitMeasure();
         DisplayUtils.drawTestRect(this,this.width,this.height);
      }
      
      public function exportConfig() : Object
      {
         var _loc1_:Object = {};
         _loc1_["blurX"] = pr_blurX.value;
         _loc1_["blurY"] = pr_blurY.value;
         _loc1_["exposure"] = pr_exposure.value;
         _loc1_["threshold"] = pr_threshold.value;
         return _loc1_;
      }
   }
}
