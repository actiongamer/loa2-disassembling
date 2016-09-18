package nslm2.common.ui.components.comp3ds
{
   import away3d.entities.Mesh;
   import com.mz.core.interFace.IDispose;
   import flash.utils.Dictionary;
   import org.specter3d.utils.LifePool;
   import flash.display.BitmapData;
   import com.spriteSheet.SpriteSheetData;
   import away3d.primitives.PlaneGeometry;
   import morn.core.managers.timerMgrs.TimerManager;
   import away3d.textures.BitmapTexture;
   import morn.core.managers.parseImgMgrs.ParseImgMgr;
   import morn.core.handlers.Handler;
   import org.specter3d.loaders.parsers.data.ImageObject;
   import nslm2.utils.TransformUtil;
   import away3d.materials.TextureMaterial;
   import away3d.entities.Entity;
   
   public class Effect3D extends Mesh implements IDispose
   {
      
      private static var _bmpGlobalCache:Dictionary;
      
      private static var _bmpUseCount:Dictionary;
      
      private static var _callbackDic:Dictionary;
      
      private static var _lifePool:LifePool;
      
      private static const LIFE:int = 20000;
       
      
      private var _bmpDic:Vector.<String>;
      
      private var _loop:int;
      
      private var _uid:String;
      
      private var _data:SpriteSheetData;
      
      private var mPlaying:Boolean;
      
      private var _isDisposed:Boolean;
      
      public var outX:int;
      
      public var outY:int;
      
      public function Effect3D(param1:String, param2:SpriteSheetData)
      {
         super(new PlaneGeometry(10,10,1,1,false),null,false);
         _uid = param1;
         _data = param2;
         if(_bmpGlobalCache == null)
         {
            _bmpGlobalCache = new Dictionary();
         }
         if(_lifePool == null)
         {
            _lifePool = new LifePool(disposeSheet);
         }
         if(_callbackDic == null)
         {
            _callbackDic = new Dictionary();
         }
         if(_bmpUseCount == null)
         {
            _bmpUseCount = new Dictionary();
         }
         this.renderLayer = Entity.TOP_LAYER;
         this.ignoreCameraRotation = true;
         parseBmd();
      }
      
      private static function parseImgHandler(param1:String, param2:int, param3:BitmapData) : void
      {
         var _loc5_:Vector.<Function> = _callbackDic[param1];
         var _loc7_:int = 0;
         var _loc6_:* = _loc5_;
         for each(var _loc4_ in _loc5_)
         {
            _loc4_(param1,param2,param3);
         }
      }
      
      public function get planeGeometry() : PlaneGeometry
      {
         return this.geometry as PlaneGeometry;
      }
      
      public function stop() : void
      {
         mPlaying = false;
         TimerManager.ins.clearTimer(loopFrame);
      }
      
      private function parseBmd() : void
      {
         var _loc1_:* = null;
         var _loc4_:* = null;
         var _loc2_:* = undefined;
         var _loc5_:int = 0;
         var _loc3_:int = _data.byteArrayVec.length;
         _bmpDic = new Vector.<String>(_loc3_);
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc1_ = _uid + String.fromCharCode(1) + String(_loc5_);
            _loc4_ = _bmpGlobalCache[_loc1_];
            if(_loc4_)
            {
               _bmpDic[_loc5_] = _loc1_;
               _lifePool.remove(_loc1_);
            }
            else
            {
               _loc2_ = _callbackDic[_loc1_];
               if(_loc2_ == null)
               {
                  _loc2_ = new Vector.<Function>();
                  _callbackDic[_loc1_] = new Vector.<Function>();
                  _loc2_.push(parseImgDone);
                  ParseImgMgr.ins.add(_loc1_,_data.byteArrayVec[_loc5_],new Handler(parseImgHandler,[_loc1_,_loc5_]));
               }
               else
               {
                  _loc2_.push(parseImgDone);
               }
            }
            if(_bmpUseCount[_loc1_] == null)
            {
               _bmpUseCount[_loc1_] = 0;
            }
            var _loc6_:* = _bmpUseCount;
            var _loc7_:* = _loc1_;
            var _loc8_:* = Number(_loc6_[_loc7_]) + 1;
            _loc6_[_loc7_] = _loc8_;
            _loc5_++;
         }
         TimerManager.ins.doFrameLoop(5,loopFrame);
      }
      
      private function disposeSheet(param1:String) : void
      {
         var _loc2_:BitmapTexture = _bmpGlobalCache[param1];
         if(_loc2_ && _bmpUseCount[param1])
         {
            _loc2_.dispose();
            _loc2_.bitmapData.dispose();
            delete _bmpGlobalCache[param1];
         }
      }
      
      private function parseImgDone(param1:String, param2:int, param3:BitmapData) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param3)
         {
            _loc4_ = new ImageObject(TransformUtil.validateBmd(param3,true));
            _loc5_ = _loc4_.bitmapTexture;
            _bmpGlobalCache[param1] = _loc5_;
            if(_isDisposed)
            {
               _lifePool.put(param1);
               return;
            }
            _bmpDic[param2] = param1;
            _lifePool.remove(param1);
            return;
         }
      }
      
      private function get currentSheetID() : String
      {
         return _uid + String.fromCharCode(1) + String(_loop);
      }
      
      private function loopFrame() : void
      {
         if(_bmpDic == null || !_bmpDic.length)
         {
            return;
         }
         if(_loop >= _bmpDic.length)
         {
            _loop = 0;
         }
         if(_bmpDic[_loop] == null)
         {
            return;
         }
         var _loc1_:BitmapTexture = _bmpGlobalCache[currentSheetID];
         if(material)
         {
            (material as TextureMaterial).texture = _loc1_;
         }
         else
         {
            material = new TextureMaterial(_loc1_,false);
            material.blendMode = "layer";
            material.alphaPremultiplied = true;
            (material as TextureMaterial).alphaBlending = true;
         }
         (geometry as PlaneGeometry).width = _loc1_.width;
         (geometry as PlaneGeometry).height = _loc1_.height;
         x = Math.ceil((_data.frames[_loop].offX * 2 - (int(_data.oriWidth) - _data.frames[_loop].width) + outX * 2) / 2);
         y = Math.ceil((-_data.frames[_loop].offY * 2 + (int(_data.oriHeight) - _data.frames[_loop].height) + outY * 2) / 2);
         transform;
         _loop = Number(_loop) + 1;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc3_:int = 0;
         if(_isDisposed)
         {
            return;
         }
         _isDisposed = true;
         this.stop();
         if(_bmpDic)
         {
            var _loc5_:* = 0;
            var _loc4_:* = _bmpDic;
            for(_loc1_ in _bmpDic)
            {
               _lifePool.put(_loc1_,20000);
            }
            _bmpDic = null;
         }
         var _loc2_:int = _data.byteArrayVec.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = _uid + String.fromCharCode(1) + String(_loc3_);
            if(_bmpUseCount[_loc1_] > 0)
            {
               _loc5_ = _bmpUseCount;
               _loc4_ = _loc1_;
               var _loc6_:* = Number(_loc5_[_loc4_]) - 1;
               _loc5_[_loc4_] = _loc6_;
            }
            _loc3_++;
         }
         _data = null;
         material.dispose();
         geometry.dispose();
         super.dispose();
      }
   }
}
