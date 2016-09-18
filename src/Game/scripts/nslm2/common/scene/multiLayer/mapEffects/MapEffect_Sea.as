package nslm2.common.scene.multiLayer.mapEffects
{
   import nslm2.common.scene.multiLayer.BgLayerCtrlBase;
   import org.specter3d.display.Specter3D;
   import away3d.textures.BmcTexture;
   import away3d.entities.Mesh;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.common.scene.multiLayer.BgLayer;
   import away3d.primitives.PlaneGeometry;
   import away3d.materials.TextureMaterial;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import away3d.entities.Entity;
   import nslm2.common.scene.multiLayer.configs.BgTransfrom3DVo;
   
   public class MapEffect_Sea extends BgLayerCtrlBase
   {
      
      public static const effId:int = 301;
       
      
      private var box:Specter3D;
      
      public var bmcTexture:BmcTexture;
      
      private var _plane:Mesh;
      
      public function MapEffect_Sea(param1:BgLayer)
      {
         super(param1,null);
         var _loc2_:int = 8;
         bmcTexture = new BmcTexture(UrlLib.sceneMap(param1.configVo.mapId) + "sea.swf",8);
         _plane = new Mesh(new PlaneGeometry(500 * _loc2_,230,1,1,false,true),new TextureMaterial(new BmcTexture(UrlLib.sceneMap(param1.configVo.mapId) + "sea.swf",8),true,true,false));
         _plane.renderLayer = Entity.DECAL_LAYER;
         (_plane.material as TextureMaterial).alphaPremultiplied = true;
         (_plane.material as TextureMaterial).alphaBlending = true;
         (_plane.material as TextureMaterial).animateUVs = true;
         _plane.subMeshes[0].scaleU = _loc2_;
         this.bgLayer.childParent.addChild(_plane);
         BgTransfrom3DVo.setTransfrom(_plane,this.configVo.transfrom3D);
         TimerManager.ins.doFrameLoop(1,onLoop);
      }
      
      private function onLoop() : void
      {
         _plane.subMeshes[0].offsetU = _plane.subMeshes[0].offsetU + 0.0015;
         bmcTexture.update();
      }
      
      override public function dispose() : void
      {
         TimerManager.ins.clearTimer(onLoop);
         bmcTexture.dispose();
         bmcTexture = null;
         _plane.dispose();
         _plane = null;
         super.dispose();
      }
   }
}
