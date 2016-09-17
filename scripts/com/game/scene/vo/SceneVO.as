package com.game.scene.vo
{
   import org.specter3d.configs.Specter3DConfig;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class SceneVO extends Specter3DConfig
   {
       
      
      private var _mapId:int = 100;
      
      private var _sceneName:String;
      
      private var _sceneWidth:int;
      
      private var _sceneHeight:int;
      
      private var _sceneTileW:int = 256;
      
      private var _sceneTileH:int = 256;
      
      private var _effectList:Array;
      
      private var _useAlpa:Boolean;
      
      private var _fileType:String;
      
      public var subId:int = 1;
      
      public function SceneVO()
      {
         super(0);
      }
      
      public function get useAlpa() : Boolean
      {
         return _useAlpa;
      }
      
      public function set useAlpa(param1:Boolean) : void
      {
         _useAlpa = param1;
      }
      
      public function get sceneHeight() : int
      {
         return _sceneHeight;
      }
      
      public function set sceneHeight(param1:int) : void
      {
         _sceneHeight = param1;
      }
      
      public function get sceneWidth() : int
      {
         return _sceneWidth;
      }
      
      public function set sceneWidth(param1:int) : void
      {
         _sceneWidth = param1;
      }
      
      public function get mapId() : int
      {
         return _mapId;
      }
      
      public function set mapId(param1:int) : void
      {
         _mapId = param1;
      }
      
      public function get sceneName() : String
      {
         return _sceneName;
      }
      
      public function set sceneName(param1:String) : void
      {
         _sceneName = param1;
      }
      
      public function get sceneTileH() : int
      {
         return _sceneTileH;
      }
      
      public function set sceneTileH(param1:int) : void
      {
         _sceneTileH = param1;
      }
      
      public function get sceneTileW() : int
      {
         return _sceneTileW;
      }
      
      public function set sceneTileW(param1:int) : void
      {
         _sceneTileW = param1;
      }
      
      public function get effectList() : Array
      {
         return _effectList;
      }
      
      public function set effectList(param1:Array) : void
      {
         _effectList = param1;
      }
      
      public function get bigURL() : String
      {
         return UrlLib.sceneMap(this.mapId) + "big.jpg";
      }
      
      public function get path_mask() : String
      {
         return UrlLib.sceneMap(this.mapId) + "path_mask.png";
      }
      
      public function get miniMapUrl() : String
      {
         return UrlLib.sceneMap(this.mapId) + "small.jpg";
      }
      
      public function tileUrl(param1:int, param2:int) : String
      {
         return UrlLib.sceneMapTileImg(mapId,subId,param1,param2,_useAlpa);
      }
   }
}
