package nslm2.common.scene.multiLayer
{
   import org.specter3d.display.Specter3D;
   import nslm2.common.scene.multiLayer.configs.BgLayerConfigVo;
   import nslm2.common.ui.components.comp3ds.TileImg;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import away3d.core.base.Object3D;
   import com.mz.core.configs.ClientConfig;
   import nslm2.common.scene.multiLayer.mapEffects.BgLayerCtrl_1051;
   import nslm2.common.scene.multiLayer.mapEffects.BgLayerCtrl_1052;
   import nslm2.common.scene.multiLayer.mapEffects.BgLayerCtrl_1053;
   import nslm2.common.scene.multiLayer.mapEffects.BgLayerCtrl_1054;
   import nslm2.utils.RTools;
   
   public class BgLayer extends Specter3D
   {
       
      
      public var multiBg:nslm2.common.scene.multiLayer.DungeonMultilayerBg;
      
      public var configVo:BgLayerConfigVo;
      
      public var ctrlVec:Vector.<nslm2.common.scene.multiLayer.BgLayerCtrlBase>;
      
      public var extraLayer:Specter3D;
      
      public var model3d:nslm2.common.scene.multiLayer.BgModel3D;
      
      public var tileImg:TileImg;
      
      public var img3D:Image3D;
      
      public function BgLayer()
      {
         super();
      }
      
      public function get childObject3D() : Object3D
      {
         return img3D || tileImg;
      }
      
      public function get childParent() : Specter3D
      {
         return this.extraLayer || this;
      }
      
      public function init() : void
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:* = null;
         this.z = configVo.layerZ;
         if(this.configVo.extraLayer)
         {
            extraLayer = new Specter3D();
            extraLayer.x = -ClientConfig.SCENE_BG_W / 2 + this.configVo.extraLayer.offsetX;
            extraLayer.y = ClientConfig.SCENE_BG_H / 2 + this.configVo.extraLayer.offsetY;
            this.addChild(extraLayer);
         }
         if(configVo.ctrlKindVec)
         {
            _loc1_ = configVo.ctrlKindVec.length;
            if(_loc1_)
            {
               this.ctrlVec = new Vector.<nslm2.common.scene.multiLayer.BgLayerCtrlBase>();
               _loc3_ = 0;
               while(_loc3_ < _loc1_)
               {
                  if(this.configVo.ctrlKindVec[_loc3_])
                  {
                     switch(int(this.configVo.ctrlKindVec[_loc3_].id) - 1051)
                     {
                        case 0:
                           _loc2_ = new BgLayerCtrl_1051(this,this.configVo.ctrlKindVec[_loc3_]);
                           break;
                        case 1:
                           _loc2_ = new BgLayerCtrl_1052(this,this.configVo.ctrlKindVec[_loc3_]);
                           break;
                        case 2:
                           _loc2_ = new BgLayerCtrl_1053(this,this.configVo.ctrlKindVec[_loc3_]);
                           break;
                        case 3:
                           _loc2_ = new BgLayerCtrl_1054(this,this.configVo.ctrlKindVec[_loc3_]);
                     }
                     if(_loc2_)
                     {
                        ctrlVec.push(_loc2_);
                     }
                  }
                  _loc3_++;
               }
            }
         }
      }
      
      override public function dispose() : void
      {
         if(this.ctrlVec)
         {
            RTools.disposeArrOrVector(ctrlVec);
         }
         if(model3d)
         {
            model3d.dispose();
            model3d = null;
         }
         if(this.img3D)
         {
            this.img3D.dispose();
            this.img3D = null;
         }
         if(this.tileImg)
         {
            this.tileImg.dispose();
            this.tileImg = null;
         }
         if(this.extraLayer)
         {
            extraLayer.dispose();
            extraLayer = null;
         }
         super.dispose();
      }
   }
}
