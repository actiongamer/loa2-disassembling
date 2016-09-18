package nslm2.common.scene.multiLayer
{
   import com.mz.core.interFace.IDispose;
   import nslm2.common.scene.multiLayer.configs.BgLayerCtrlKindVo;
   import nslm2.common.scene.multiLayer.configs.BgEffectConfigVo;
   
   public class BgLayerCtrlBase implements IDispose
   {
       
      
      public var bgLayer:nslm2.common.scene.multiLayer.BgLayer;
      
      public var ctrlKind:BgLayerCtrlKindVo;
      
      public var configVo:BgEffectConfigVo;
      
      public var isBattling:Boolean = false;
      
      public var isDisposed:Boolean;
      
      public function BgLayerCtrlBase(param1:nslm2.common.scene.multiLayer.BgLayer, param2:BgLayerCtrlKindVo)
      {
         super();
         this.bgLayer = param1;
         this.ctrlKind = param2;
         this.configVo = param1.configVo.effect;
      }
      
      public function get multiBg() : DungeonMultilayerBg
      {
         return this.bgLayer.multiBg;
      }
      
      public function play() : void
      {
      }
      
      public function dispose() : void
      {
         isDisposed = true;
      }
   }
}
