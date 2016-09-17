package common.findPath
{
   import flash.geom.Point;
   import com.mz.core.utils.MathUtil;
   import nslm2.common.ui.components.comp3ds.CountCWPoiNext;
   import flash.geom.Rectangle;
   import com.mz.core.logging.Log;
   import com.mz.core.utils.ArrayUtil;
   
   public class FindPath8
   {
       
      
      private var _map:Array;
      
      private var _w:int;
      
      private var _h:int;
      
      private var _open:Array;
      
      private var _starPoint:common.findPath.PathNode;
      
      private var _endPoint:common.findPath.PathNode;
      
      protected var _path:Array;
      
      public function FindPath8(param1:Array)
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         _path = [];
         super();
         _map = [];
         _w = param1[0].length;
         _h = param1.length;
         _loc3_ = 0;
         while(_loc3_ < _h)
         {
            if(_map[_loc3_] == undefined)
            {
               _map[_loc3_] = [];
            }
            _loc4_ = 0;
            while(_loc4_ < _w)
            {
               if(param1[_loc3_][_loc4_] == 1)
               {
                  _loc2_ = 1;
               }
               else
               {
                  _loc2_ = 0;
               }
               _map[_loc3_][_loc4_] = new common.findPath.PathNode(_w * _loc3_ + _loc4_,_loc4_,_loc3_,_loc2_,false,false,0,0,0,null);
               _loc4_++;
            }
            _loc3_++;
         }
      }
      
      public function get path() : Array
      {
         return _path;
      }
      
      public function getCanMovePoiNearest(param1:Point) : Point
      {
         var _loc2_:common.findPath.PathNode = findAvailablePoint(param1.x,param1.y);
         _loc2_ = findNearAvailablePoint(_loc2_);
         return new Point(_loc2_.x,_loc2_.y);
      }
      
      private function findAvailablePoint(param1:int, param2:int) : common.findPath.PathNode
      {
         var _loc4_:int = _map.length - 1;
         var _loc3_:int = (_map[0] as Array).length - 1;
         param2 = MathUtil.maxMin(param2,_loc4_,0);
         param1 = MathUtil.maxMin(param1,_loc3_,0);
         return _map[param2][param1];
      }
      
      private function inRange(param1:int, param2:int) : Boolean
      {
         return param1 >= 0 && param1 < _map[0].length && param2 >= 0 && param2 < _map.length;
      }
      
      private function findNearAvailablePoint(param1:common.findPath.PathNode) : common.findPath.PathNode
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         if(param1.value != 1)
         {
            return param1;
         }
         var _loc5_:CountCWPoiNext = new CountCWPoiNext();
         _loc5_.range = new Rectangle(0,0,this._map[0].length,this._map.length);
         _loc5_.center = new Point(param1.x,param1.y);
         _loc5_.init();
         var _loc3_:int = 0;
         while(true)
         {
            _loc2_ = _loc5_.next();
            if(_loc2_ == null)
            {
               break;
            }
            _loc4_ = this._map[_loc2_.y][_loc2_.x];
            if(_loc4_.value == 1)
            {
               _loc3_++;
               continue;
            }
            Log.info(this,"计算次数",_loc3_);
            return _loc4_;
         }
         return null;
      }
      
      public function findRoundPoint(param1:Point, param2:int) : Array
      {
         var _loc9_:int = 0;
         var _loc8_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = [];
         var _loc3_:int = param2 * 2 + 1;
         _loc9_ = 0;
         while(_loc9_ < _loc3_)
         {
            _loc8_ = param2 * 2 + 1;
            _loc7_ = 0;
            while(_loc7_ < _loc8_)
            {
               _loc4_ = _loc7_ - param2;
               _loc5_ = _loc9_ - param2;
               _loc7_++;
            }
            _loc9_++;
         }
         return _loc6_;
      }
      
      private function getNearPoiArr(param1:common.findPath.PathNode, param2:Array) : void
      {
         addNearPoiArr(param1.x - 1,param1.y - 1,param2);
         addNearPoiArr(param1.x,param1.y - 1,param2);
         addNearPoiArr(param1.x + 1,param1.y - 1,param2);
         addNearPoiArr(param1.x + 1,param1.y,param2);
         addNearPoiArr(param1.x + 1,param1.y + 1,param2);
         addNearPoiArr(param1.x,param1.y + 1,param2);
         addNearPoiArr(param1.x - 1,param1.y + 1,param2);
         addNearPoiArr(param1.x - 1,param1.y,param2);
      }
      
      private function addNearPoiArr(param1:int, param2:int, param3:Array) : void
      {
         var _loc5_:* = null;
         var _loc4_:int = 0;
         if(this.inRange(param1,param2))
         {
            _loc5_ = this._map[param2][param1];
            _loc4_ = ArrayUtil.indexByAttr(param3,"order",_loc5_.order);
            if(_loc4_ == -1)
            {
               param3.push(_loc5_);
            }
         }
      }
      
      public function find(param1:Point, param2:Point) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc8_:int = 0;
         var _loc6_:* = null;
         _path = [];
         _starPoint = findAvailablePoint(param1.x,param1.y);
         _endPoint = findAvailablePoint(param2.x,param2.y);
         if(_endPoint == null)
         {
            _path = null;
            return;
         }
         _starPoint = findNearAvailablePoint(_starPoint);
         _endPoint = findNearAvailablePoint(_endPoint);
         if(_endPoint.x == _starPoint.x && _endPoint.y == _starPoint.y)
         {
            _path = null;
            return;
         }
         var _loc7_:Boolean = false;
         initBlock();
         var _loc3_:common.findPath.PathNode = _starPoint;
         while(true)
         {
            if(_loc7_)
            {
               drawPath();
               return;
            }
            _loc3_.block = true;
            _loc4_ = [];
            if(_loc3_.y > 0)
            {
               _loc4_.push(_map[_loc3_.y - 1][_loc3_.x]);
            }
            if(_loc3_.x > 0)
            {
               _loc4_.push(_map[_loc3_.y][_loc3_.x - 1]);
            }
            if(_loc3_.x < _w - 1)
            {
               _loc4_.push(_map[_loc3_.y][_loc3_.x + 1]);
            }
            if(_loc3_.y < _h - 1)
            {
               _loc4_.push(_map[_loc3_.y + 1][_loc3_.x]);
            }
            if(_loc3_.y > 0 && _loc3_.x > 0)
            {
               _loc4_.push(_map[_loc3_.y - 1][_loc3_.x - 1]);
            }
            if(_loc3_.y < _h - 1 && _loc3_.x > 0)
            {
               _loc4_.push(_map[_loc3_.y + 1][_loc3_.x - 1]);
            }
            if(_loc3_.y > 0 && _loc3_.x < _w - 1)
            {
               _loc4_.push(_map[_loc3_.y - 1][_loc3_.x + 1]);
            }
            if(_loc3_.y < _h - 1 && _loc3_.x < _w - 1)
            {
               _loc4_.push(_map[_loc3_.y + 1][_loc3_.x + 1]);
            }
            _loc5_ = _loc4_.length;
            _loc8_ = 0;
            while(_loc8_ < _loc5_)
            {
               _loc6_ = _loc4_[_loc8_];
               if(_loc6_ == _endPoint)
               {
                  _loc6_.nodeparent = _loc3_;
                  _loc7_ = true;
                  break;
               }
               if(_loc6_.value == 0)
               {
                  count(_loc6_,_loc3_);
               }
               _loc8_++;
            }
            if(!_loc7_)
            {
               if(_open.length > 0)
               {
                  _loc3_ = _open.splice(getMin(),1)[0];
                  continue;
               }
               break;
            }
         }
         _path = [];
      }
      
      public function optimizePath() : Array
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:int = _path.length;
         var _loc7_:Array = [];
         var _loc5_:Array = [];
         var _loc3_:Boolean = true;
         var _loc4_:Point = _path[0];
         _loc7_.push(_path[0]);
         var _loc2_:int = 0;
         _loc9_ = 1;
         while(_loc9_ < _loc1_)
         {
            _loc2_++;
            _loc5_ = Diagonal.each(_loc4_,_path[_loc9_]);
            _loc8_ = _loc5_.length;
            _loc3_ = true;
            _loc6_ = 0;
            while(_loc6_ < _loc8_)
            {
               if(_map[_loc5_[_loc6_].y][_loc5_[_loc6_].x].value == 1)
               {
                  _loc3_ = false;
                  break;
               }
               _loc6_++;
            }
            if(_loc2_ > 1)
            {
               _loc3_ = false;
            }
            if(!_loc3_)
            {
               if(_loc9_ > 1)
               {
                  _loc4_ = _path[_loc9_ - 1];
                  _loc7_.push(_path[_loc9_ - 1]);
                  _loc2_ = 0;
               }
            }
            _loc9_++;
         }
         _loc7_.push(_path[_loc1_ - 1]);
         return _loc7_;
      }
      
      private function initBlock() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < _h)
         {
            _loc2_ = 0;
            while(_loc2_ < _w)
            {
               _map[_loc1_][_loc2_].open = false;
               _map[_loc1_][_loc2_].block = false;
               _map[_loc1_][_loc2_].value_g = 0;
               _map[_loc1_][_loc2_].value_h = 0;
               _map[_loc1_][_loc2_].value_f = 0;
               _map[_loc1_][_loc2_].nodeparent = null;
               _loc2_++;
            }
            _loc1_++;
         }
         _open = [];
      }
      
      private function count(param1:common.findPath.PathNode, param2:common.findPath.PathNode) : void
      {
         var _loc3_:Number = NaN;
         if(!param1.block)
         {
            _loc3_ = param2.value_g + 10;
            if(Math.abs(param1.x - param2.x) == 1 && Math.abs(param1.y - param2.y) == 1)
            {
               _loc3_ = param2.value_g + 14;
            }
            else
            {
               _loc3_ = param2.value_g + 10;
            }
            if(param1.x > param2.x && param1.y < param2.y)
            {
               if(_map[param1.y][param1.x - 1].value == 1 && _map[param1.y + 1][param1.x].value == 1)
               {
                  _loc3_ = _loc3_ + 10000;
               }
            }
            else if(param1.x > param2.x && param1.y > param2.y)
            {
               if(_map[param1.y][param1.x - 1].value == 1 && _map[param1.y - 1][param1.x].value == 1)
               {
                  _loc3_ = _loc3_ + 10000;
               }
            }
            else if(param1.x < param2.x && param1.y > param2.y)
            {
               if(_map[param1.y][param1.x + 1].value == 1 && _map[param1.y - 1][param1.x].value == 1)
               {
                  _loc3_ = _loc3_ + 10000;
               }
            }
            else if(param1.x < param2.x && param1.y < param2.y)
            {
               if(_map[param1.y + 1][param1.x].value == 1 && _map[param1.y][param1.x + 1].value == 1)
               {
                  _loc3_ = _loc3_ + 10000;
               }
            }
            if(param1.open)
            {
               if(param1.value_g >= _loc3_)
               {
                  param1.value_g = _loc3_;
                  ghf(param1);
                  param1.nodeparent = param2;
               }
            }
            else
            {
               addToOpen(param1);
               param1.value_g = _loc3_;
               ghf(param1);
               param1.nodeparent = param2;
            }
         }
      }
      
      public function removeSameRoPath() : void
      {
         var _loc7_:int = 0;
         var _loc1_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc8_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(_path && _path.length >= 2)
         {
            _loc7_ = _path.length;
            _loc1_ = _path[0];
            _loc5_ = _path[1];
            _loc4_ = new Point(_loc5_.x - _loc1_.x,_loc5_.y - _loc1_.y);
            _loc6_ = [_loc1_];
            _loc8_ = 2;
            while(_loc8_ < _loc7_)
            {
               _loc2_ = _path[_loc8_];
               _loc3_ = new Point(_loc2_.x - _loc5_.x,_loc2_.y - _loc5_.y);
               if(!_loc3_.equals(_loc4_))
               {
                  _loc4_ = _loc3_;
                  _loc6_.push(_loc5_);
               }
               _loc5_ = _loc2_;
               _loc8_++;
            }
            _loc6_.push(_loc5_);
            _path = _loc6_;
         }
      }
      
      private function drawPath() : void
      {
         var _loc1_:common.findPath.PathNode = _endPoint;
         while(_loc1_ != _starPoint)
         {
            _path.unshift(new Point(_loc1_.x,_loc1_.y));
            _loc1_ = _loc1_.nodeparent;
         }
         _path.unshift(new Point(_loc1_.x,_loc1_.y));
      }
      
      private function addToOpen(param1:common.findPath.PathNode) : void
      {
         _open.push(param1);
         param1.open = true;
      }
      
      private function ghf(param1:common.findPath.PathNode) : void
      {
         var _loc2_:Number = Math.abs(param1.x - _endPoint.x);
         var _loc3_:Number = Math.abs(param1.y - _endPoint.y);
         param1.value_h = 10 * (_loc2_ + _loc3_);
         param1.value_f = param1.value_g + param1.value_h;
      }
      
      private function getMin() : int
      {
         var _loc4_:int = 0;
         var _loc1_:int = _open.length;
         var _loc3_:* = 100000;
         var _loc2_:* = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc1_)
         {
            if(_loc3_ > _open[_loc4_].value_f)
            {
               _loc3_ = Number(_open[_loc4_].value_f);
               _loc2_ = _loc4_;
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      private function find_ex(param1:common.findPath.PathNode, param2:common.findPath.PathNode) : void
      {
         var _loc3_:int = param1.x;
         var _loc4_:int = param1.y;
         if(param1.x == param2.x)
         {
            while(_loc4_ != param2.y)
            {
               if(_map[_loc4_][_loc3_].value == 1)
               {
                  _path = [];
                  return;
               }
               _path.push(new Point(_loc3_,_loc4_));
               if(param1.y < param2.y)
               {
                  _loc4_++;
               }
               else
               {
                  _loc4_--;
               }
            }
         }
         else if(param1.y == param2.y)
         {
            while(_loc3_ != param2.x)
            {
               if(_map[_loc4_][_loc3_].value == 1)
               {
                  _path = [];
                  return;
               }
               _path.push(new Point(_loc3_,_loc4_));
               if(param1.x < param2.x)
               {
                  _loc3_++;
               }
               else
               {
                  _loc3_--;
               }
            }
         }
         else if(Math.abs((param1.y - param2.y) / (param1.x - param2.x)) == 1)
         {
            while(_loc3_ != param2.x && _loc4_ != param2.y)
            {
               if(_map[_loc4_][_loc3_].value == 1 || _map[_loc4_ - 1][_loc3_].value == 1 && _map[_loc4_][_loc3_ + 1].value == 1 || _map[_loc4_ + 1][_loc3_].value == 1 && _map[_loc4_][_loc3_ + 1].value == 1 || _map[_loc4_ - 1][_loc3_].value == 1 && _map[_loc4_][_loc3_ - 1].value == 1 || _map[_loc4_ + 1][_loc3_].value == 1 && _map[_loc4_][_loc3_ - 1].value == 1)
               {
                  _path = [];
                  return;
               }
               _path.push(new Point(_loc3_,_loc4_));
               if(param2.x < param1.x && param2.y < param1.y)
               {
                  _loc3_--;
                  _loc4_--;
               }
               else if(param2.x < param1.x && param2.y > param1.y)
               {
                  _loc3_--;
                  _loc4_++;
               }
               else if(param2.x > param1.x && param2.y < param1.y)
               {
                  _loc3_++;
                  _loc4_--;
               }
               else
               {
                  _loc3_++;
                  _loc4_++;
               }
            }
         }
         else if(param2.x > param1.x && param2.y > param1.y)
         {
            if(param2.y > param2.x - param1.x + param1.y)
            {
               while(_loc3_ <= param2.x)
               {
                  if(_map[_loc4_][_loc3_].value == 1 || _map[_loc4_ + 1][_loc3_].value == 1 && _map[_loc4_][_loc3_ + 1].value == 1)
                  {
                     _path = [];
                     return;
                  }
                  _path.push(new Point(_loc3_,_loc4_));
                  _loc3_++;
                  _loc4_++;
               }
               _loc3_--;
               _loc4_--;
               while(_loc4_ <= param2.y)
               {
                  if(_map[_loc4_][_loc3_].value == 1)
                  {
                     _path = [];
                     return;
                  }
                  _path.push(new Point(_loc3_,_loc4_));
                  _loc4_++;
               }
            }
            else
            {
               while(_loc4_ <= param2.y)
               {
                  if(_map[_loc4_][_loc3_].value == 1 || _map[_loc4_ + 1][_loc3_].value == 1 && _map[_loc4_][_loc3_ + 1].value == 1)
                  {
                     _path = [];
                     return;
                  }
                  _path.push(new Point(_loc3_,_loc4_));
                  _loc3_++;
                  _loc4_++;
               }
               _loc3_--;
               _loc4_--;
               while(_loc3_ <= param2.x)
               {
                  if(_map[_loc4_][_loc3_].value == 1)
                  {
                     _path = [];
                     return;
                  }
                  _path.push(new Point(_loc3_,_loc4_));
                  _loc3_++;
               }
            }
         }
         else if(param2.x > param1.x && param2.y < param1.y)
         {
            if(param2.y > param1.x + param1.y - param2.x)
            {
               while(_loc4_ >= param2.y)
               {
                  if(_map[_loc4_][_loc3_].value == 1 || _map[_loc4_ - 1][_loc3_].value == 1 && _map[_loc4_][_loc3_ + 1].value == 1)
                  {
                     _path = [];
                     return;
                  }
                  _path.push(new Point(_loc3_,_loc4_));
                  _loc3_++;
                  _loc4_--;
               }
               _loc3_--;
               _loc4_++;
               while(_loc3_ <= param2.x)
               {
                  if(_map[_loc4_][_loc3_].value == 1)
                  {
                     _path = [];
                     return;
                  }
                  _path.push(new Point(_loc3_,_loc4_));
                  _loc3_++;
               }
            }
            else
            {
               while(_loc3_ <= param2.x)
               {
                  if(_map[_loc4_][_loc3_].value == 1 || _map[_loc4_ - 1][_loc3_].value == 1 && _map[_loc4_][_loc3_ + 1].value == 1)
                  {
                     _path = [];
                     return;
                  }
                  _path.push(new Point(_loc3_,_loc4_));
                  _loc3_++;
                  _loc4_--;
               }
               _loc3_--;
               _loc4_++;
               while(_loc4_ >= param2.y)
               {
                  if(_map[_loc4_][_loc3_].value == 1)
                  {
                     _path = [];
                     return;
                  }
                  _path.push(new Point(_loc3_,_loc4_));
                  _loc4_--;
               }
            }
         }
         else if(param2.x < param1.x && param2.y < param1.y)
         {
            if(param2.y < param2.x - param1.x + param1.y)
            {
               while(_loc3_ >= param2.x)
               {
                  if(_map[_loc4_][_loc3_].value == 1 || _map[_loc4_ - 1][_loc3_].value == 1 && _map[_loc4_][_loc3_ - 1].value == 1)
                  {
                     _path = [];
                     return;
                  }
                  _path.push(new Point(_loc3_,_loc4_));
                  _loc3_--;
                  _loc4_--;
               }
               _loc3_++;
               _loc4_++;
               while(_loc4_ >= param2.y)
               {
                  if(_map[_loc4_][_loc3_].value == 1)
                  {
                     _path = [];
                     return;
                  }
                  _path.push(new Point(_loc3_,_loc4_));
                  _loc4_--;
               }
            }
            else
            {
               while(_loc4_ >= param2.y)
               {
                  if(_map[_loc4_][_loc3_].value == 1 || _map[_loc4_ - 1][_loc3_].value == 1 && _map[_loc4_][_loc3_ - 1].value == 1)
                  {
                     _path = [];
                     return;
                  }
                  _path.push(new Point(_loc3_,_loc4_));
                  _loc4_--;
                  _loc3_--;
               }
               _loc4_++;
               _loc3_++;
               while(_loc3_ >= param2.x)
               {
                  if(_map[_loc4_][_loc3_].value == 1)
                  {
                     _path = [];
                     return;
                  }
                  _path.push(new Point(_loc3_,_loc4_));
                  _loc3_--;
               }
            }
         }
         else if(param2.y < param1.x + param1.y - param2.x)
         {
            while(_loc4_ <= param2.y)
            {
               if(_map[_loc4_][_loc3_].value == 1 || _map[_loc4_ + 1][_loc3_].value == 1 && _map[_loc4_][_loc3_ - 1].value == 1)
               {
                  _path = [];
                  return;
               }
               _path.push(new Point(_loc3_,_loc4_));
               _loc3_--;
               _loc4_++;
            }
            _loc3_++;
            _loc4_--;
            while(_loc3_ >= param2.x)
            {
               if(_map[_loc4_][_loc3_].value == 1)
               {
                  _path = [];
                  return;
               }
               _path.push(new Point(_loc3_,_loc4_));
               _loc3_--;
            }
         }
         else
         {
            while(_loc3_ >= param2.x)
            {
               if(_map[_loc4_][_loc3_].value == 1 || _map[_loc4_ + 1][_loc3_].value == 1 && _map[_loc4_][_loc3_ - 1].value == 1)
               {
                  _path = [];
                  return;
               }
               _path.push(new Point(_loc3_,_loc4_));
               _loc3_--;
               _loc4_++;
            }
            _loc3_++;
            _loc4_--;
            while(_loc4_ <= param2.y)
            {
               if(_map[_loc4_][_loc3_].value == 1)
               {
                  _path = [];
                  return;
               }
               _path.push(new Point(_loc3_,_loc4_));
               _loc4_++;
            }
         }
      }
   }
}
