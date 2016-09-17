package nslm2.common.scene.multiLayer.mapEffects
{
   import nslm2.common.scene.multiLayer.BgLayerCtrlBase;
   import org.specter3d.display.Specter3D;
   import away3d.entities.Mesh;
   import org.specter3d.loaders.AssetLib;
   import away3d.textures.BitmapTexture;
   import away3d.materials.TextureMaterial;
   import nslm2.common.scene.multiLayer.BgLayer;
   import away3d.primitives.CubeGeometry;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   import morn.core.components.HBox;
   import nslm2.common.ui.components.debug3d.Object3DParams;
   
   public class MapEffect_Mesh extends BgLayerCtrlBase
   {
      
      public static const effId:int = 301;
       
      
      private var box:Specter3D;
      
      private var floorMesh:Mesh;
      
      private var floorTextureUrl:String;
      
      public function MapEffect_Mesh(param1:BgLayer)
      {
         var _loc3_:* = null;
         super(param1,null);
         box = new Specter3D();
         this.bgLayer.addChild(new Specter3D());
         box.rotationX = -20;
         floorMesh = new Mesh(new CubeGeometry(1200,600,800),null,false);
         box.addChild(floorMesh);
         floorMesh.scaleX = 0.54;
         floorMesh.scaleY = 0.06;
         floorMesh.scaleZ = 0.54;
         floorMesh.x = -286;
         floorMesh.y = -169;
         this.floorTextureUrl = UrlLib.sceneMap(101) + "floor.png";
         AppGlobalContext.QueueLoader.loadOne(new ResourceVo(floorTextureUrl),load_texture_onCompl);
         var _loc2_:HBox = new HBox();
         _loc3_ = new Object3DParams("floorMesh");
         _loc3_.bind(floorMesh);
         _loc2_.addChild(_loc3_);
         _loc3_ = new Object3DParams("box");
         _loc3_.bind(box);
         _loc2_.addChild(_loc3_);
      }
      
      private function load_texture_onCompl(... rest) : void
      {
         var _loc3_:BitmapTexture = AssetLib.getBitmapTexture(floorTextureUrl);
         var _loc2_:TextureMaterial = new TextureMaterial(_loc3_,true,false,false);
         this.floorMesh.material = _loc2_;
      }
      
      override public function dispose() : void
      {
         box.dispose();
         super.dispose();
      }
   }
}
