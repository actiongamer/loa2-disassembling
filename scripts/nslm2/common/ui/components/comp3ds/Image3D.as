package nslm2.common.ui.components.comp3ds
{
   import away3d.entities.Mesh;
   import away3d.primitives.PlaneGeometry;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   import flash.geom.Point;
   import flash.display.BitmapData;
   import org.specter3d.loaders.parsers.data.ImageObject;
   import nslm2.utils.TransformUtil;
   import away3d.textures.BitmapTexture;
   import org.specter3d.loaders.AssetLib;
   import away3d.materials.TextureMaterial;
   import flash.events.Event;
   import away3d.materials.methods.EffectMethodBase;
   import away3d.materials.SinglePassMaterialBase;
   import away3d.entities.Entity;
   
   public class Image3D extends Mesh
   {
      
      public static const LOAD_CPL:String = "Image3DloadCpl";
       
      
      public var url:String;
      
      public var initW:int;
      
      public var initH:int;
      
      private var smooth:Boolean;
      
      private var transparent:Boolean;
      
      private var keepOriImage:Boolean;
      
      public var isDispose:Boolean;
      
      private var _blendMode:String;
      
      private var bmdOriSize:Point;
      
      private var _alpha:Number = 1;
      
      public function Image3D(param1:String, param2:int = 0, param3:int = 0, param4:int = 4000, param5:Boolean = true, param6:Boolean = false, param7:Boolean = true)
      {
         super(null,null,false);
         this.renderLayer = Entity.ALL_LAYER;
         this.smooth = param5;
         this.transparent = param7;
         this.keepOriImage = param6;
         initW = param2;
         initH = param3;
         if(param2 == 0)
         {
            param2 = 1;
         }
         if(param3 == 0)
         {
            param3 = 1;
         }
         geometry = new PlaneGeometry(param2,param3,1,1,false);
         this.show(param1);
         this.z = param4;
      }
      
      public function get planeGeometry() : PlaneGeometry
      {
         return this.geometry as PlaneGeometry;
      }
      
      public function set_renderLayer(param1:int) : Image3D
      {
         this.renderLayer = param1;
         return this;
      }
      
      public function show(param1:String) : void
      {
         if(param1)
         {
            url = param1;
            AppGlobalContext.QueueLoader.loadOne(new ResourceVo(url),load_res_onCompl);
         }
      }
      
      override public function dispose() : void
      {
         this.isDispose = true;
         super.dispose();
      }
      
      public function get blendMode() : String
      {
         return _blendMode;
      }
      
      public function set blendMode(param1:String) : void
      {
         _blendMode = param1;
         if(this.material)
         {
            this.material.blendMode = _blendMode;
         }
      }
      
      public function showByBmd(param1:BitmapData) : void
      {
         var _loc3_:ImageObject = new ImageObject(TransformUtil.validateBmd(param1,keepOriImage));
         var _loc2_:BitmapTexture = _loc3_.bitmapTexture;
         showByBmt(_loc2_);
      }
      
      private function load_res_onCompl() : void
      {
         if(this.isDispose)
         {
            return;
         }
         TransformUtil.validateBmdByUrl(url,keepOriImage);
         var _loc1_:BitmapTexture = AssetLib.getBitmapTexture(url);
         showByBmt(_loc1_);
      }
      
      public function showByBmt(param1:BitmapTexture) : void
      {
         if(initW == 0)
         {
            this.width = param1.width;
         }
         else
         {
            this.width = initW;
         }
         if(initH == 0)
         {
            this.height = param1.height;
         }
         else
         {
            this.height = initH;
         }
         var _loc2_:TextureMaterial = new TextureMaterial(param1,smooth,false,false);
         if(transparent)
         {
            _loc2_.alphaPremultiplied = true;
            _loc2_.alphaBlending = true;
            _loc2_.alpha = this.alpha;
         }
         if(this.blendMode)
         {
            _loc2_.blendMode = blendMode;
         }
         this.material = _loc2_;
         this.dispatchEvent(new Event("Image3DloadCpl"));
      }
      
      public function get alpha() : Number
      {
         if(this.material)
         {
            return (this.material as TextureMaterial).alpha;
         }
         return _alpha;
      }
      
      public function set alpha(param1:Number) : void
      {
         _alpha = param1;
         if(this.material)
         {
            (this.material as TextureMaterial).alpha = param1;
         }
      }
      
      public function get width() : int
      {
         return planeGeometry.width;
      }
      
      public function set width(param1:int) : void
      {
         planeGeometry.width = param1;
      }
      
      public function get height() : int
      {
         return planeGeometry.height;
      }
      
      public function set height(param1:int) : void
      {
         planeGeometry.height = param1;
      }
      
      public function addMethod(param1:EffectMethodBase) : void
      {
         var _loc2_:SinglePassMaterialBase = this.material as SinglePassMaterialBase;
         if(_loc2_ && !_loc2_.hasMethod(param1))
         {
            _loc2_.addMethod(param1);
         }
      }
      
      public function removeMethod(param1:EffectMethodBase) : void
      {
         var _loc2_:SinglePassMaterialBase = this.material as SinglePassMaterialBase;
         if(_loc2_ && _loc2_.hasMethod(param1))
         {
            _loc2_.removeMethod(param1);
         }
      }
   }
}
