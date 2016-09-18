package nslm2.common.scene.multiLayer.scripts
{
   import com.mz.core.interFace.IDispose;
   import nslm2.common.scene.multiLayer.configs.BgScriptVo;
   import nslm2.common.scene.multiLayer.BgLayer;
   import away3d.core.base.Object3D;
   
   public class BgScriptBase implements IDispose
   {
       
      
      public var vo:BgScriptVo;
      
      public var bgLayer:BgLayer;
      
      public var bgTarget:Object3D;
      
      public function BgScriptBase()
      {
         super();
      }
      
      public function dispose() : void
      {
      }
      
      public function init(param1:BgScriptVo, param2:BgLayer, param3:Object3D) : void
      {
         this.vo = param1;
         bgLayer = param2;
         bgTarget = param3;
      }
      
      public function start() : void
      {
      }
   }
}
