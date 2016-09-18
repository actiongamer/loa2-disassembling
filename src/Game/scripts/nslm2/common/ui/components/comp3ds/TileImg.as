package nslm2.common.ui.components.comp3ds
{
   import org.specter3d.display.Specter3D;
   import nslm2.common.scene.multiLayer.configs.BgTileImgConfigVo;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import org.specter3d.loaders.AssetLib;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   import flash.display.BitmapData;
   import nslm2.utils.TransformUtil;
   import away3d.textures.BitmapTexture;
   import away3d.materials.TextureMaterial;
   import flash.geom.Point;
   import com.mz.core.configs.ClientConfig;
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.geom.Rectangle;
   import com.mz.core.logging.Log;
   import flash.events.Event;
   import away3d.materials.methods.EffectMethodBase;
   import flash.geom.Vector3D;
   import away3d.entities.Entity;
   
   public class TileImg extends Specter3D
   {
       
      
      public var renderLayer:uint;
      
      protected var _tileList:Vector.<nslm2.common.ui.components.comp3ds.TileImgTile>;
      
      public var configVo:BgTileImgConfigVo;
      
      public var blendMode:String;
      
      private var mapCol:int;
      
      private var mapRow:int;
      
      public var viewRangeHalf:Point;
      
      private var lookAtDirty:Boolean = false;
      
      private var _lookAtPoi:Point;
      
      public var isLoadAll:Boolean = false;
      
      private var waitLoadArr:Vector.<nslm2.common.ui.components.comp3ds.TileImgTile>;
      
      private var loadingTile:nslm2.common.ui.components.comp3ds.TileImgTile;
      
      private var _repeatStartPoi:Point;
      
      public function TileImg(param1:BgTileImgConfigVo, param2:String = null)
      {
         waitLoadArr = new Vector.<nslm2.common.ui.components.comp3ds.TileImgTile>();
         _repeatStartPoi = new Point();
         super();
         this.blendMode = param2;
         this.renderLayer = Entity.ALL_LAYER;
         this.configVo = param1;
         this.z = 7000;
         elementType = -1;
         if(configVo.needLoadConfigXML)
         {
            initScene();
         }
         else
         {
            loadConfigXML_cplReal();
         }
      }
      
      private function initScene() : void
      {
         ResMgr.ins.load(82,UrlLib.asset3d(configVo.configLayerXML),loadConfigXML_cpl,2);
      }
      
      private function loadConfigXML_cpl() : void
      {
         if(this.isDispose)
         {
            return;
         }
         var _loc1_:XML = ResMgr.ins.getRes(UrlLib.asset3d(configVo.configLayerXML));
         if(_loc1_)
         {
            configVo.oriWidth = int(_loc1_.oriWidth);
            configVo.oriHeight = int(_loc1_.oriHeight);
            configVo.tileWidth = 256;
            configVo.tileHeight = 256;
            configVo.useAlpha = !!_loc1_.hasOwnProperty("imgKind")?_loc1_.imgKind == "png":false;
            loadConfigXML_cplReal();
         }
      }
      
      private function loadConfigXML_cplReal() : void
      {
         if(AssetLib.hasAsset(configVo.smallURL))
         {
            loadSmallCpl();
         }
         else
         {
            AppGlobalContext.asynLoader.loadOne(new ResourceVo(configVo.smallURL),loadSmallCpl,"default_group");
         }
      }
      
      protected function loadSmallCpl() : void
      {
         var _loc7_:* = null;
         var _loc2_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:* = null;
         if(this.isDispose)
         {
            return;
         }
         var _loc3_:BitmapData = AssetLib.getBitmapData(configVo.smallURL);
         if(_loc3_ != null)
         {
            TransformUtil.validateBmdByUrl(configVo.smallURL,false,"default_group");
         }
         _loc7_ = AssetLib.getBitmapTexture(configVo.smallURL);
         if(_loc7_ == null)
         {
            return;
         }
         _tileList = new Vector.<nslm2.common.ui.components.comp3ds.TileImgTile>();
         mapCol = Math.ceil(configVo.oriWidth / configVo.tileWidth);
         mapRow = Math.ceil(configVo.oriHeight / configVo.tileHeight);
         var _loc6_:int = 0;
         var _loc1_:TextureMaterial = new TextureMaterial(_loc7_,true,false,false);
         _loc1_.animateUVs = true;
         if(this.blendMode)
         {
            _loc1_.blendMode = this.blendMode;
         }
         while(_loc2_ < mapCol)
         {
            _loc6_ = 0;
            while(_loc6_ < mapRow)
            {
               _loc4_ = configVo.useAlpha;
               if((_loc2_ + 1) * configVo.tileWidth > configVo.oriWidth || (_loc6_ + 1) * configVo.tileHeight > configVo.oriHeight)
               {
                  _loc4_ = true;
               }
               _loc5_ = new nslm2.common.ui.components.comp3ds.TileImgTile(configVo.tileUrl(_loc2_,_loc6_),this,_loc1_,_loc6_,_loc2_,configVo.oriWidth,configVo.oriHeight,configVo.tileWidth,configVo.tileHeight,_loc4_,renderLayer,this.blendMode);
               _loc5_.x = _loc2_ * configVo.tileWidth + configVo.tileWidth / 2;
               _loc5_.y = _loc6_ * -configVo.tileHeight - configVo.tileHeight / 2;
               _tileList.push(_loc5_);
               _loc6_++;
            }
            _loc2_++;
         }
         viewRangeHalf = new Point(ClientConfig.SCENE_FIXED_W_HALF,ClientConfig.SCENE_FIXED_H_HALF);
         if(isLoadAll)
         {
            this.loadTileAll();
         }
         if(this.repeatStartX != 0 || this.repeatStartY != 0)
         {
            this.repeatStartPoi = new Point(repeatStartX,repeatStartY);
         }
         TimerManager.ins.doFrameLoop(5,onLoop);
      }
      
      public function set lookAtPoi(param1:Point) : void
      {
         if(_lookAtPoi != null && _lookAtPoi.equals(param1))
         {
            return;
         }
         _lookAtPoi = param1;
         lookAtDirty = true;
      }
      
      public function get isSmallLoadCpl() : Boolean
      {
         return _tileList != null;
      }
      
      public function loadTileAll() : void
      {
         var _loc1_:* = null;
         if(this.isDispose)
         {
            return;
         }
         isLoadAll = true;
         if(isSmallLoadCpl)
         {
            _loc1_ = new Point(Math.floor(viewRangeHalf.x / this.configVo.tileWidth),Math.floor(viewRangeHalf.y / this.configVo.tileHeight));
            this.waitLoadArr = getTileListByCenterRect(_loc1_,new Rectangle(0,0,mapCol,mapRow));
         }
      }
      
      private function onLoop() : void
      {
         if(!this.isLoadAll)
         {
            if(lookAtDirty)
            {
               lookAtDirty = false;
               waitLoadArr = getTileListByLookAtPoi(this._lookAtPoi,this.viewRangeHalf);
            }
         }
         if(loadingTile == null && waitLoadArr.length > 0)
         {
            loadingTile = waitLoadArr.shift();
            loadingTile.addEventListener("TEX_LOAD_CPL",tile_loadCpl);
            if(loadingTile.isload)
            {
               Log.fatal(this,"loadingTile is isload!!!");
            }
            loadingTile.show();
         }
      }
      
      public function getTileListByLookAtPoi(param1:Point, param2:Point) : Vector.<nslm2.common.ui.components.comp3ds.TileImgTile>
      {
         var _loc3_:Point = new Point(Math.floor(param1.x / this.configVo.tileWidth),Math.floor(param1.y / this.configVo.tileHeight));
         var _loc6_:int = Math.floor((param1.x - param2.x) / this.configVo.tileWidth);
         var _loc7_:int = Math.floor((param1.x + param2.x) / this.configVo.tileWidth);
         var _loc5_:int = Math.floor((param1.y - param2.y) / this.configVo.tileHeight);
         var _loc4_:int = Math.floor((param1.y + param2.y) / this.configVo.tileHeight);
         return this.getTileListByCenterRect(_loc3_,new Rectangle(_loc6_,_loc5_,_loc7_ - _loc6_ + 1,_loc4_ - _loc5_ + 1));
      }
      
      private function getTileListByCenterRect(param1:Point, param2:Rectangle) : Vector.<nslm2.common.ui.components.comp3ds.TileImgTile>
      {
         var _loc9_:int = 0;
         var _loc7_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:Vector.<nslm2.common.ui.components.comp3ds.TileImgTile> = new Vector.<nslm2.common.ui.components.comp3ds.TileImgTile>();
         var _loc6_:CountCWPoi = new CountCWPoi();
         _loc6_.center = param1;
         _loc6_.range = param2;
         _loc6_.count();
         var _loc8_:int = _loc6_.rs.length;
         _loc9_ = 0;
         while(_loc9_ < _loc8_)
         {
            _loc7_ = _loc6_.rs[_loc9_];
            _loc5_ = _loc7_.y + _loc7_.x * this.mapRow;
            if(_tileList.hasOwnProperty(_loc5_))
            {
               _loc4_ = _tileList[_loc5_];
               if(_loc4_ != this.loadingTile && _loc4_.isload == false)
               {
                  _loc3_.push(_loc4_);
               }
            }
            _loc9_++;
         }
         return _loc3_;
      }
      
      private function inRange(param1:IndexPoint, param2:Rectangle) : Boolean
      {
         return param1.x >= param2.x && param1.x < param2.width && param1.y >= param2.y && param1.y < param2.height;
      }
      
      private function tile_loadCpl(param1:Event) : void
      {
         if(this.isDispose)
         {
            return;
         }
         if(loadingTile != param1.currentTarget)
         {
            Log.fatal(this,"loadingTile is not equal e.currentTarget");
         }
         else
         {
            loadingTile = null;
         }
      }
      
      override public function addMethod(param1:EffectMethodBase) : void
      {
         super.addMethod(param1);
         this.update(0,0);
      }
      
      override public function removeMethod(param1:EffectMethodBase) : void
      {
         super.removeMethod(param1);
         this.update(0,0);
      }
      
      override public function dispose() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:* = null;
         if(_tileList)
         {
            _loc2_ = _tileList.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc1_ = _tileList[_loc3_];
               _loc1_.dispose();
               _loc3_++;
            }
            _tileList = null;
         }
         this.loadingTile = null;
         TimerManager.ins.clearTimer(this.onLoop);
         super.dispose();
      }
      
      public function set repeatStartPoi(param1:Point) : void
      {
         _repeatStartPoi = param1;
      }
      
      private function validateRepeat() : void
      {
         var _loc5_:int = 0;
         var _loc8_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc6_:* = null;
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         if(this.isSmallLoadCpl)
         {
            _loc5_ = mapCol * configVo.tileWidth;
            _loc8_ = mapRow * configVo.tileHeight;
            _loc4_ = _repeatStartPoi.x;
            _loc2_ = _repeatStartPoi.y;
            _loc4_ = _loc4_ % configVo.oriWidth;
            _loc2_ = _loc2_ % configVo.oriHeight;
            _loc7_ = this._tileList.length;
            _loc9_ = 0;
            while(_loc9_ < _loc7_)
            {
               _loc6_ = this._tileList[_loc9_];
               _loc1_ = _loc6_._column * configVo.tileWidth + configVo.tileWidth / 2 + _loc4_;
               if(_loc1_ > _loc5_ - this.configVo.tileWidth)
               {
                  _loc1_ = _loc1_ - configVo.oriWidth;
               }
               if(_loc1_ < -configVo.tileWidth / 2)
               {
                  _loc1_ = _loc1_ + configVo.oriWidth;
               }
               _loc3_ = _loc6_._row * -configVo.tileHeight - configVo.tileHeight / 2 - _loc2_;
               if(_loc3_ < -_loc8_ + configVo.tileHeight / 2)
               {
                  _loc3_ = _loc3_ + configVo.oriHeight;
               }
               if(_loc3_ > configVo.tileHeight / 2)
               {
                  _loc3_ = _loc3_ - configVo.oriHeight;
               }
               _loc6_.position = new Vector3D(_loc1_,_loc3_,_loc6_.z);
               _loc9_++;
            }
         }
      }
      
      public function get repeatStartX() : int
      {
         return _repeatStartPoi.x;
      }
      
      public function set repeatStartX(param1:int) : void
      {
         _repeatStartPoi.x = param1;
         this.validateRepeat();
      }
      
      public function get repeatStartY() : int
      {
         return _repeatStartPoi.y;
      }
      
      public function set repeatStartY(param1:int) : void
      {
         _repeatStartPoi.y = param1;
         this.validateRepeat();
      }
   }
}
