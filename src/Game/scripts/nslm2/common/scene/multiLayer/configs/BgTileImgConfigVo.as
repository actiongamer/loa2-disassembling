package nslm2.common.scene.multiLayer.configs
{
   import away3d.entities.Entity;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class BgTileImgConfigVo extends BgTargetConfigVoBase
   {
       
      
      public var mapId:int;
      
      public var id:int;
      
      public var imgKind:String;
      
      public var oriWidth:int;
      
      public var oriHeight:int;
      
      public var tileWidth:int;
      
      public var tileHeight:int;
      
      public var smallScale:int;
      
      public var offsetX:int;
      
      public var offsetY:int;
      
      public var transfrom3D:nslm2.common.scene.multiLayer.configs.BgTransfrom3DVo;
      
      public var needLoadConfigXML:Boolean;
      
      public var _useAlpha:Boolean = false;
      
      public function BgTileImgConfigVo()
      {
         super();
      }
      
      public function get useAlpha() : Boolean
      {
         return _useAlpha;
      }
      
      public function set useAlpha(param1:Boolean) : void
      {
         _useAlpha = param1;
      }
      
      override public function parse(param1:XML) : void
      {
         super.parse(param1);
         this.id = param1.id;
         this.renderLayer = BgConfigVoUtil.parseXMLInt(param1.renderLayer,Entity.DECAL_LAYER);
         this.imgKind = String(param1.imgKind);
         this.oriWidth = param1.oriWidth;
         this.oriHeight = param1.oriHeight;
         this.tileWidth = param1.tileWidth;
         this.tileHeight = param1.tileHeight;
         this.smallScale = param1.smallScale;
         this.offsetX = param1.offsetX;
         this.offsetY = param1.offsetY;
         if(param1.transfrom3d.length() > 0)
         {
            transfrom3D = new nslm2.common.scene.multiLayer.configs.BgTransfrom3DVo();
            transfrom3D.parse(param1.transfrom3d[0]);
         }
         if(this.imgKind == "png")
         {
            _useAlpha = true;
         }
      }
      
      public function get smallURL() : String
      {
         if(_useAlpha)
         {
            return UrlLib.sceneMap(this.mapId) + String(id) + "/" + "small.png";
         }
         return UrlLib.sceneMap(this.mapId) + String(id) + "/" + "small.jpg";
      }
      
      public function tileUrl(param1:int, param2:int) : String
      {
         return UrlLib.sceneMapTileImg(mapId,id,param1,param2,_useAlpha);
      }
      
      public function get configLayerXML() : String
      {
         return UrlLib.sceneMap(this.mapId) + String(id) + "/" + "config_layer.xml";
      }
   }
}
