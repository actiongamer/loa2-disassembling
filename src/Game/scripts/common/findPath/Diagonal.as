package common.findPath
{
   import flash.geom.Point;
   
   public class Diagonal
   {
       
      
      public function Diagonal()
      {
         super();
      }
      
      public static function each(param1:Point, param2:Point) : Array
      {
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         var _loc13_:int = 0;
         var _loc11_:int = 0;
         var _loc3_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc4_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:int = 0;
         var _loc15_:Array = [];
         var _loc7_:int = 0;
         var _loc14_:* = param1.x < param2.x == param1.y < param2.y;
         if(param1.x < param2.x)
         {
            _loc13_ = param1.x;
            _loc11_ = param1.y;
            _loc6_ = param2.x - _loc13_;
            _loc5_ = Math.abs(param2.y - _loc11_);
         }
         else
         {
            _loc13_ = param2.x;
            _loc11_ = param2.y;
            _loc6_ = param1.x - _loc13_;
            _loc5_ = Math.abs(param1.y - _loc11_);
         }
         if(_loc6_ == _loc5_)
         {
            _loc10_ = 0;
            while(_loc10_ <= _loc6_)
            {
               !!_loc14_?_loc15_.push(new Point(_loc13_ + _loc10_,_loc11_ + _loc10_)):uint(_loc15_.push(new Point(_loc13_ + _loc10_,_loc11_ - _loc10_)));
               if(_loc10_ > 0)
               {
                  !!_loc14_?_loc15_.push(new Point(_loc13_ + _loc10_ - 1,_loc11_ + _loc10_)):uint(_loc15_.push(new Point(_loc13_ + _loc10_ - 1,_loc11_ - _loc10_)));
               }
               if(_loc10_ < _loc6_)
               {
                  !!_loc14_?_loc15_.push(new Point(_loc13_ + _loc10_ + 1,_loc11_ + _loc10_)):uint(_loc15_.push(new Point(_loc13_ + _loc10_ + 1,_loc11_ - _loc10_)));
               }
               _loc10_++;
            }
         }
         else if(_loc6_ > _loc5_)
         {
            _loc3_ = _loc5_ / _loc6_;
            _loc15_.push(new Point(_loc13_,_loc11_));
            _loc10_ = 1;
            while(_loc10_ <= _loc6_)
            {
               _loc12_ = (_loc10_ - 0.5) * _loc3_;
               _loc8_ = (_loc10_ + 0.5) * _loc3_;
               _loc4_ = _loc12_ > _loc7_ - 0.5 && _loc12_ < _loc7_ + 0.5;
               _loc9_ = _loc8_ > _loc7_ - 0.5 && _loc8_ < _loc7_ + 0.5;
               if(_loc4_ || _loc9_)
               {
                  !!_loc14_?_loc15_.push(new Point(_loc13_ + _loc10_,_loc11_ + _loc7_)):uint(_loc15_.push(new Point(_loc13_ + _loc10_,_loc11_ - _loc7_)));
                  if(!_loc9_)
                  {
                     _loc7_++;
                     !!_loc14_?_loc15_.push(new Point(_loc13_ + _loc10_,_loc11_ + _loc7_)):uint(_loc15_.push(new Point(_loc13_ + _loc10_,_loc11_ - _loc7_)));
                  }
               }
               _loc10_++;
            }
         }
         else if(_loc6_ < _loc5_)
         {
            _loc3_ = _loc6_ / _loc5_;
            _loc15_.push(new Point(_loc13_,_loc11_));
            _loc10_ = 1;
            while(_loc10_ <= _loc5_)
            {
               _loc12_ = (_loc10_ - 0.5) * _loc3_;
               _loc8_ = (_loc10_ + 0.5) * _loc3_;
               _loc4_ = _loc12_ > _loc7_ - 0.5 && _loc12_ < _loc7_ + 0.5;
               _loc9_ = _loc8_ > _loc7_ - 0.5 && _loc8_ < _loc7_ + 0.5;
               if(_loc4_ || _loc9_)
               {
                  !!_loc14_?_loc15_.push(new Point(_loc13_ + _loc7_,_loc11_ + _loc10_)):uint(_loc15_.push(new Point(_loc13_ + _loc7_,_loc11_ - _loc10_)));
                  if(!_loc9_)
                  {
                     _loc7_++;
                     !!_loc14_?_loc15_.push(new Point(_loc13_ + _loc7_,_loc11_ + _loc10_)):uint(_loc15_.push(new Point(_loc13_ + _loc7_,_loc11_ - _loc10_)));
                  }
               }
               _loc10_++;
            }
         }
         return _loc15_;
      }
   }
}
