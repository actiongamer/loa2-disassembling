package common.findPath
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import morn.core.utils.ColorUtil;
   import nslm2.modules.scenes.commons.SceneNpc3D;
   import com.greensock.TweenLite;
   import com.mz.core.utils.ArrayUtil;
   import com.mz.core.utils.MathUtil;
   import nslm2.modules.scenes.commons.SceneModel;
   import com.mz.core.configs.EnvConfig;
   import morn.customs.tests.TestTimerCount;
   
   public class FindPathMed
   {
       
      
      private var findPathCounter:common.findPath.FindPath8;
      
      private var pathMap:Array;
      
      private var _curPathMaskBmd:BitmapData;
      
      private var findPathCounterVec:Vector.<common.findPath.FindPath8>;
      
      public var sceneSize:Point;
      
      public var mapMaskArr:Vector.<SceneNpc3D>;
      
      public var pathMaskBmdArr:Vector.<BitmapData>;
      
      public function FindPathMed()
      {
         mapMaskArr = new Vector.<SceneNpc3D>();
         super();
      }
      
      public function get curPathMaskBmd() : BitmapData
      {
         return _curPathMaskBmd;
      }
      
      public function clear() : void
      {
         this.findPathCounter = null;
         mapMaskArr.length = 0;
      }
      
      public function initFindPathMed(param1:Array = null) : void
      {
         var _loc10_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc13_:* = 0;
         if(param1 == null)
         {
            param1 = [0];
         }
         var _loc3_:BitmapData = getPathMaskBmd(param1);
         _curPathMaskBmd = _loc3_;
         var _loc2_:int = sceneSize.x;
         var _loc9_:int = sceneSize.y;
         var _loc6_:Array = [];
         var _loc11_:int = _loc9_ / 50;
         var _loc12_:Vector.<uint> = _loc3_.getVector(new Rectangle(0,0,_loc3_.width,_loc3_.height));
         _loc10_ = 0;
         while(_loc10_ < _loc11_)
         {
            _loc6_[_loc10_] = [];
            _loc7_ = _loc2_ / 50;
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc4_ = (_loc8_ * 50 + 50 / 2) / (_loc2_ / _loc3_.width);
               _loc5_ = (_loc10_ * 50 + 50 / 2) / (_loc9_ / _loc3_.height);
               _loc13_ = uint(_loc12_[_loc5_ * _loc3_.width + _loc4_]);
               _loc6_[_loc10_][_loc8_] = checkState(_loc13_);
               _loc8_++;
            }
            _loc10_++;
         }
         pathMap = _loc6_;
         reCountMaskPath();
      }
      
      private function checkState(param1:uint) : uint
      {
         var _loc2_:* = 0;
         param1 = ColorUtil.getRed(param1);
         if(param1 >= 170)
         {
            _loc2_ = uint(1);
         }
         else if(param1 >= 51)
         {
            _loc2_ = uint(2);
         }
         else
         {
            _loc2_ = uint(0);
         }
         return _loc2_;
      }
      
      public function initFindPathMedVector(param1:Array) : void
      {
         var _loc17_:* = null;
         var _loc16_:* = null;
         var _loc10_:int = 0;
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc11_:int = 0;
         var _loc6_:* = null;
         var _loc13_:int = 0;
         var _loc14_:* = undefined;
         var _loc12_:int = 0;
         var _loc9_:int = 0;
         var _loc8_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc15_:* = 0;
         findPathCounterVec = new Vector.<common.findPath.FindPath8>();
         var _loc7_:int = param1.length;
         _loc10_ = 0;
         while(_loc10_ < _loc7_)
         {
            _loc3_ = getPathMaskBmd([_loc10_]);
            _loc17_ = _loc3_;
            _loc2_ = sceneSize.x;
            _loc11_ = sceneSize.y;
            _loc6_ = [];
            _loc13_ = _loc11_ / 50;
            _loc14_ = _loc3_.getVector(new Rectangle(0,0,_loc3_.width,_loc3_.height));
            _loc12_ = 0;
            while(_loc12_ < _loc13_)
            {
               _loc6_[_loc12_] = [];
               _loc9_ = _loc2_ / 50;
               _loc8_ = 0;
               while(_loc8_ < _loc9_)
               {
                  _loc4_ = (_loc8_ * 50 + 50 / 2) / (_loc2_ / _loc3_.width);
                  _loc5_ = (_loc12_ * 50 + 50 / 2) / (_loc11_ / _loc3_.height);
                  _loc15_ = uint(_loc14_[_loc5_ * _loc3_.width + _loc4_]);
                  _loc6_[_loc12_][_loc8_] = checkState(_loc15_);
                  _loc8_++;
               }
               _loc12_++;
            }
            _loc16_ = new common.findPath.FindPath8(_loc6_);
            findPathCounterVec.push(_loc16_);
            _loc10_++;
         }
      }
      
      public function addNpcMapMask(param1:SceneNpc3D) : void
      {
         if(mapMaskArr.indexOf(param1) == -1)
         {
            mapMaskArr.push(param1);
            TweenLite.killDelayedCallsTo(this.reCountMaskPath);
            TweenLite.delayedCall(1,reCountMaskPath);
         }
      }
      
      public function removeNpcMapMask(param1:SceneNpc3D) : void
      {
         ArrayUtil.removeItem(this.mapMaskArr,param1);
         TweenLite.killDelayedCallsTo(this.reCountMaskPath);
         TweenLite.delayedCall(1,reCountMaskPath);
      }
      
      public function getPathMaskBmd(param1:Array) : BitmapData
      {
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc5_:int = param1.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param1[_loc6_];
            _loc3_ = pathMaskBmdArr[_loc4_];
            if(_loc2_ == null)
            {
               _loc2_ = _loc3_.clone();
            }
            else
            {
               _loc2_.copyChannel(_loc3_,new Rectangle(0,0,_loc3_.width,_loc3_.height),new Point(0,0),1,1);
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      private function getPathStateAtPathMask(param1:BitmapData, param2:int, param3:int, param4:int) : uint
      {
         var _loc9_:int = 0;
         var _loc7_:* = 0;
         var _loc8_:int = 0;
         var _loc12_:int = 0;
         var _loc6_:* = 0;
         var _loc5_:int = 0;
         var _loc11_:Object = {};
         _loc11_[1] = 0;
         _loc11_[0] = 0;
         _loc11_[2] = 0;
         var _loc10_:int = param4 * 2;
         _loc9_ = 0;
         while(_loc9_ < _loc10_)
         {
            _loc7_ = _loc10_;
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc6_ = uint(ColorUtil.getRed(getColorAtPathMask(param1,param2 - param4 + _loc9_,param3 - param4 + _loc8_)));
               if(_loc6_ >= 170)
               {
                  _loc12_ = 1;
               }
               else if(_loc6_ >= 51)
               {
                  _loc12_ = 2;
               }
               else
               {
                  _loc12_ = 0;
               }
               _loc8_++;
            }
            var _loc14_:* = _loc11_;
            var _loc15_:* = _loc12_;
            var _loc16_:* = Number(_loc14_[_loc15_]) + 1;
            _loc14_[_loc15_] = _loc16_;
            _loc9_++;
         }
         var _loc18_:int = 0;
         var _loc17_:* = _loc11_;
         for(var _loc13_ in _loc11_)
         {
            if(_loc5_ < _loc11_[_loc13_])
            {
               _loc5_ = _loc11_[_loc13_];
               _loc12_ = _loc13_;
            }
         }
         return _loc12_;
      }
      
      private function getColorAtPathMask(param1:BitmapData, param2:int, param3:int) : uint
      {
         return param1.getPixel(param2,param3);
      }
      
      private function reCountMaskPath() : void
      {
         if(pathMap)
         {
            findPathCounter = new common.findPath.FindPath8(pathMap);
         }
      }
      
      private function checkMaskPoi(param1:int, param2:int) : Boolean
      {
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc4_:int = 0;
         var _loc3_:Point = this.pathToScenePoi(new Point(param1,param2));
         var _loc5_:int = this.mapMaskArr.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc6_ = this.mapMaskArr[_loc7_];
            _loc4_ = MathUtil.disWith2Point(_loc6_.pos2d,_loc3_);
            if(_loc4_ < 64)
            {
               return false;
            }
            _loc7_++;
         }
         return true;
      }
      
      public function isAlpha(param1:Point) : Boolean
      {
         if(pathMap == null)
         {
            return false;
         }
         param1 = sceneToPathPoi(param1);
         if(pathMap[param1.y])
         {
            return pathMap[param1.y][param1.x] != 0;
         }
         return false;
      }
      
      public function getCanMovePoiNearest(param1:Point, param2:int = -1) : Point
      {
         var _loc3_:* = null;
         param1 = this.sceneToPathPoi(param1);
         if(param2 != -1)
         {
            _loc3_ = findPathCounterVec[param2];
         }
         else
         {
            _loc3_ = findPathCounter;
         }
         param1 = _loc3_.getCanMovePoiNearest(param1);
         param1 = this.pathToScenePoi(param1);
         return param1;
      }
      
      public function getMovePath(param1:Point, param2:Point, param3:Boolean, param4:int = -1) : Array
      {
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc6_:* = null;
         if(param3 == false)
         {
            if(SceneModel.canFindPath)
            {
               SceneModel.canFindPath = false;
            }
            else
            {
               return [param2];
            }
         }
         if(findPathCounter == null)
         {
            return [param2];
         }
         if(EnvConfig.ins.showDebugModule)
         {
            TestTimerCount.ins.start();
         }
         var _loc7_:Point = sceneToPathPoi(param1);
         var _loc5_:Point = sceneToPathPoi(param2);
         if(param4 != -1)
         {
            _loc9_ = findPathCounterVec[param4];
         }
         else
         {
            _loc9_ = findPathCounter;
         }
         _loc9_.find(_loc7_,_loc5_);
         _loc9_.removeSameRoPath();
         var _loc8_:Array = _loc9_.path;
         if(_loc8_)
         {
            _loc8_.shift();
            _loc10_ = _loc8_.length;
            _loc11_ = 0;
            while(_loc11_ < _loc10_)
            {
               _loc6_ = _loc8_[_loc11_];
               _loc8_[_loc11_] = pathToScenePoi(_loc6_);
               _loc11_++;
            }
         }
         return _loc8_;
      }
      
      private function sceneToPathPoi(param1:Point) : Point
      {
         return new Point(Math.floor(param1.x / 50),Math.floor(param1.y / 50));
      }
      
      private function pathToScenePoi(param1:Point) : Point
      {
         return new Point(param1.x * 50 + 50 / 2,param1.y * 50 + 50 / 2);
      }
   }
}
