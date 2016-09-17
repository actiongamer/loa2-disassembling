package away3d.primitives
{
   import away3d.core.base.CompactSubGeometry;
   
   public class CubeGeometry extends PrimitiveBase
   {
       
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _depth:Number;
      
      private var _tile6:Boolean;
      
      private var _segmentsW:Number;
      
      private var _segmentsH:Number;
      
      private var _segmentsD:Number;
      
      public function CubeGeometry(param1:Number = 100, param2:Number = 100, param3:Number = 100, param4:uint = 1, param5:uint = 1, param6:uint = 1, param7:Boolean = true)
      {
         super();
         _width = param1;
         _height = param2;
         _depth = param3;
         _segmentsW = param4;
         _segmentsH = param5;
         _segmentsD = param6;
         _tile6 = param7;
      }
      
      public function get width() : Number
      {
         return _width;
      }
      
      public function set width(param1:Number) : void
      {
         _width = param1;
         invalidateGeometry();
      }
      
      public function get height() : Number
      {
         return _height;
      }
      
      public function set height(param1:Number) : void
      {
         _height = param1;
         invalidateGeometry();
      }
      
      public function get depth() : Number
      {
         return _depth;
      }
      
      public function set depth(param1:Number) : void
      {
         _depth = param1;
         invalidateGeometry();
      }
      
      public function get tile6() : Boolean
      {
         return _tile6;
      }
      
      public function set tile6(param1:Boolean) : void
      {
         _tile6 = param1;
         invalidateUVs();
      }
      
      public function get segmentsW() : Number
      {
         return _segmentsW;
      }
      
      public function set segmentsW(param1:Number) : void
      {
         _segmentsW = param1;
         invalidateGeometry();
         invalidateUVs();
      }
      
      public function get segmentsH() : Number
      {
         return _segmentsH;
      }
      
      public function set segmentsH(param1:Number) : void
      {
         _segmentsH = param1;
         invalidateGeometry();
         invalidateUVs();
      }
      
      public function get segmentsD() : Number
      {
         return _segmentsD;
      }
      
      public function set segmentsD(param1:Number) : void
      {
         _segmentsD = param1;
         invalidateGeometry();
         invalidateUVs();
      }
      
      override protected function buildGeometry(param1:CompactSubGeometry) : void
      {
         var _loc8_:* = undefined;
         var _loc20_:* = undefined;
         var _loc7_:* = 0;
         var _loc19_:* = 0;
         var _loc14_:* = 0;
         var _loc5_:* = 0;
         var _loc12_:* = 0;
         var _loc15_:* = 0;
         var _loc3_:* = 0;
         var _loc21_:* = 0;
         var _loc10_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc17_:uint = 0;
         var _loc2_:uint = ((_segmentsW + 1) * (_segmentsH + 1) + (_segmentsW + 1) * (_segmentsD + 1) + (_segmentsH + 1) * (_segmentsD + 1)) * 2;
         var _loc13_:uint = param1.vertexStride;
         var _loc11_:uint = _loc13_ - 9;
         if(_loc2_ == param1.numVertices)
         {
            _loc8_ = param1.vertexData;
            _loc20_ = param1.indexData || new Vector.<uint>((_segmentsW * _segmentsH + _segmentsW * _segmentsD + _segmentsH * _segmentsD) * 12,true);
         }
         else
         {
            _loc8_ = new Vector.<Number>(_loc2_ * _loc13_,true);
            _loc20_ = new Vector.<uint>((_segmentsW * _segmentsH + _segmentsW * _segmentsD + _segmentsH * _segmentsD) * 12,true);
            invalidateUVs();
         }
         _loc21_ = uint(param1.vertexOffset);
         _loc3_ = uint(0);
         _loc6_ = _width / 2;
         _loc10_ = _height / 2;
         _loc9_ = _depth / 2;
         _loc4_ = _width / _segmentsW;
         _loc18_ = _height / _segmentsH;
         _loc16_ = _depth / _segmentsD;
         _loc15_ = uint(0);
         while(_loc15_ <= _segmentsW)
         {
            _loc22_ = -_loc6_ + _loc15_ * _loc4_;
            _loc12_ = uint(0);
            while(_loc12_ <= _segmentsH)
            {
               _loc8_[_loc21_++] = _loc22_;
               _loc8_[_loc21_++] = -_loc10_ + _loc12_ * _loc18_;
               _loc8_[_loc21_++] = -_loc9_;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = -1;
               _loc8_[_loc21_++] = 1;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = 0;
               _loc21_ = uint(_loc21_ + _loc11_);
               _loc8_[_loc21_++] = _loc22_;
               _loc8_[_loc21_++] = -_loc10_ + _loc12_ * _loc18_;
               _loc8_[_loc21_++] = _loc9_;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = 1;
               _loc8_[_loc21_++] = -1;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = 0;
               _loc21_ = uint(_loc21_ + _loc11_);
               if(_loc15_ && uint(_loc12_))
               {
                  _loc5_ = uint(2 * ((_loc15_ - 1) * (_segmentsH + 1) + (_loc12_ - 1)));
                  _loc7_ = uint(2 * (_loc15_ * (_segmentsH + 1) + (_loc12_ - 1)));
                  _loc19_ = uint(_loc5_ + 2);
                  _loc14_ = uint(_loc7_ + 2);
                  _loc20_[_loc3_++] = _loc5_;
                  _loc20_[_loc3_++] = _loc19_;
                  _loc20_[_loc3_++] = _loc14_;
                  _loc20_[_loc3_++] = _loc5_;
                  _loc20_[_loc3_++] = _loc14_;
                  _loc20_[_loc3_++] = _loc7_;
                  _loc20_[_loc3_++] = _loc7_ + 1;
                  _loc20_[_loc3_++] = _loc14_ + 1;
                  _loc20_[_loc3_++] = _loc19_ + 1;
                  _loc20_[_loc3_++] = _loc7_ + 1;
                  _loc20_[_loc3_++] = _loc19_ + 1;
                  _loc20_[_loc3_++] = _loc5_ + 1;
               }
               _loc12_++;
            }
            _loc15_++;
         }
         _loc17_ = _loc17_ + 2 * (_segmentsW + 1) * (_segmentsH + 1);
         _loc15_ = uint(0);
         while(_loc15_ <= _segmentsW)
         {
            _loc22_ = -_loc6_ + _loc15_ * _loc4_;
            _loc12_ = uint(0);
            while(_loc12_ <= _segmentsD)
            {
               _loc8_[_loc21_++] = _loc22_;
               _loc8_[_loc21_++] = _loc10_;
               _loc8_[_loc21_++] = -_loc9_ + _loc12_ * _loc16_;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = 1;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = 1;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = 0;
               _loc21_ = uint(_loc21_ + _loc11_);
               _loc8_[_loc21_++] = _loc22_;
               _loc8_[_loc21_++] = -_loc10_;
               _loc8_[_loc21_++] = -_loc9_ + _loc12_ * _loc16_;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = -1;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = 1;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = 0;
               _loc21_ = uint(_loc21_ + _loc11_);
               if(_loc15_ && uint(_loc12_))
               {
                  _loc5_ = uint(_loc17_ + 2 * ((_loc15_ - 1) * (_segmentsD + 1) + (_loc12_ - 1)));
                  _loc7_ = uint(_loc17_ + 2 * (_loc15_ * (_segmentsD + 1) + (_loc12_ - 1)));
                  _loc19_ = uint(_loc5_ + 2);
                  _loc14_ = uint(_loc7_ + 2);
                  _loc20_[_loc3_++] = _loc5_;
                  _loc20_[_loc3_++] = _loc19_;
                  _loc20_[_loc3_++] = _loc14_;
                  _loc20_[_loc3_++] = _loc5_;
                  _loc20_[_loc3_++] = _loc14_;
                  _loc20_[_loc3_++] = _loc7_;
                  _loc20_[_loc3_++] = _loc7_ + 1;
                  _loc20_[_loc3_++] = _loc14_ + 1;
                  _loc20_[_loc3_++] = _loc19_ + 1;
                  _loc20_[_loc3_++] = _loc7_ + 1;
                  _loc20_[_loc3_++] = _loc19_ + 1;
                  _loc20_[_loc3_++] = _loc5_ + 1;
               }
               _loc12_++;
            }
            _loc15_++;
         }
         _loc17_ = _loc17_ + 2 * (_segmentsW + 1) * (_segmentsD + 1);
         _loc15_ = uint(0);
         while(_loc15_ <= _segmentsD)
         {
            _loc22_ = _loc9_ - _loc15_ * _loc16_;
            _loc12_ = uint(0);
            while(_loc12_ <= _segmentsH)
            {
               _loc8_[_loc21_++] = -_loc6_;
               _loc8_[_loc21_++] = -_loc10_ + _loc12_ * _loc18_;
               _loc8_[_loc21_++] = _loc22_;
               _loc8_[_loc21_++] = -1;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = -1;
               _loc21_ = uint(_loc21_ + _loc11_);
               _loc8_[_loc21_++] = _loc6_;
               _loc8_[_loc21_++] = -_loc10_ + _loc12_ * _loc18_;
               _loc8_[_loc21_++] = _loc22_;
               _loc8_[_loc21_++] = 1;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = 0;
               _loc8_[_loc21_++] = 1;
               _loc21_ = uint(_loc21_ + _loc11_);
               if(_loc15_ && uint(_loc12_))
               {
                  _loc5_ = uint(_loc17_ + 2 * ((_loc15_ - 1) * (_segmentsH + 1) + (_loc12_ - 1)));
                  _loc7_ = uint(_loc17_ + 2 * (_loc15_ * (_segmentsH + 1) + (_loc12_ - 1)));
                  _loc19_ = uint(_loc5_ + 2);
                  _loc14_ = uint(_loc7_ + 2);
                  _loc20_[_loc3_++] = _loc5_;
                  _loc20_[_loc3_++] = _loc19_;
                  _loc20_[_loc3_++] = _loc14_;
                  _loc20_[_loc3_++] = _loc5_;
                  _loc20_[_loc3_++] = _loc14_;
                  _loc20_[_loc3_++] = _loc7_;
                  _loc20_[_loc3_++] = _loc7_ + 1;
                  _loc20_[_loc3_++] = _loc14_ + 1;
                  _loc20_[_loc3_++] = _loc19_ + 1;
                  _loc20_[_loc3_++] = _loc7_ + 1;
                  _loc20_[_loc3_++] = _loc19_ + 1;
                  _loc20_[_loc3_++] = _loc5_ + 1;
               }
               _loc12_++;
            }
            _loc15_++;
         }
         param1.updateData(_loc8_);
         param1.updateIndexData(_loc20_);
      }
      
      override protected function buildUVs(param1:CompactSubGeometry) : void
      {
         var _loc8_:* = 0;
         var _loc16_:* = 0;
         var _loc13_:* = 0;
         var _loc4_:* = undefined;
         var _loc17_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc9_:uint = param1.UVStride;
         var _loc18_:uint = ((_segmentsW + 1) * (_segmentsH + 1) + (_segmentsW + 1) * (_segmentsD + 1) + (_segmentsH + 1) * (_segmentsD + 1)) * 2 * _loc9_;
         var _loc7_:uint = _loc9_ - 2;
         if(param1.UVData && _loc18_ == param1.UVData.length)
         {
            _loc4_ = param1.UVData;
         }
         else
         {
            _loc4_ = new Vector.<Number>(_loc18_,true);
            invalidateGeometry();
         }
         if(_tile6)
         {
            _loc11_ = 0.333333333333333;
            _loc15_ = 0.333333333333333;
            _loc14_ = 0.5;
            _loc17_ = 0.5;
         }
         else
         {
            _loc17_ = 1;
            _loc15_ = 1;
            _loc14_ = 0;
            _loc11_ = 0;
         }
         _loc16_ = uint(param1.UVOffset);
         _loc10_ = 1 * _loc11_;
         _loc12_ = 1 * _loc14_;
         _loc5_ = 2 * _loc11_;
         _loc6_ = 0 * _loc14_;
         _loc2_ = _loc15_ / _segmentsW;
         _loc3_ = _loc17_ / _segmentsH;
         _loc13_ = uint(0);
         while(_loc13_ <= _segmentsW)
         {
            _loc8_ = uint(0);
            while(_loc8_ <= _segmentsH)
            {
               _loc4_[_loc16_++] = _loc10_ + _loc13_ * _loc2_;
               _loc4_[_loc16_++] = _loc12_ + (_loc17_ - _loc8_ * _loc3_);
               _loc16_ = uint(_loc16_ + _loc7_);
               _loc4_[_loc16_++] = _loc5_ + (_loc15_ - _loc13_ * _loc2_);
               _loc4_[_loc16_++] = _loc6_ + (_loc17_ - _loc8_ * _loc3_);
               _loc16_ = uint(_loc16_ + _loc7_);
               _loc8_++;
            }
            _loc13_++;
         }
         _loc10_ = 1 * _loc11_;
         _loc12_ = 0 * _loc14_;
         _loc5_ = 0 * _loc11_;
         _loc6_ = 0 * _loc14_;
         _loc2_ = _loc15_ / _segmentsW;
         _loc3_ = _loc17_ / _segmentsD;
         _loc13_ = uint(0);
         while(_loc13_ <= _segmentsW)
         {
            _loc8_ = uint(0);
            while(_loc8_ <= _segmentsD)
            {
               _loc4_[_loc16_++] = _loc10_ + _loc13_ * _loc2_;
               _loc4_[_loc16_++] = _loc12_ + (_loc17_ - _loc8_ * _loc3_);
               _loc16_ = uint(_loc16_ + _loc7_);
               _loc4_[_loc16_++] = _loc5_ + _loc13_ * _loc2_;
               _loc4_[_loc16_++] = _loc6_ + _loc8_ * _loc3_;
               _loc16_ = uint(_loc16_ + _loc7_);
               _loc8_++;
            }
            _loc13_++;
         }
         _loc10_ = 0 * _loc11_;
         _loc12_ = 1 * _loc14_;
         _loc5_ = 2 * _loc11_;
         _loc6_ = 1 * _loc14_;
         _loc2_ = _loc15_ / _segmentsD;
         _loc3_ = _loc17_ / _segmentsH;
         _loc13_ = uint(0);
         while(_loc13_ <= _segmentsD)
         {
            _loc8_ = uint(0);
            while(_loc8_ <= _segmentsH)
            {
               _loc4_[_loc16_++] = _loc10_ + _loc13_ * _loc2_;
               _loc4_[_loc16_++] = _loc12_ + (_loc17_ - _loc8_ * _loc3_);
               _loc16_ = uint(_loc16_ + _loc7_);
               _loc4_[_loc16_++] = _loc5_ + (_loc15_ - _loc13_ * _loc2_);
               _loc4_[_loc16_++] = _loc6_ + (_loc17_ - _loc8_ * _loc3_);
               _loc16_ = uint(_loc16_ + _loc7_);
               _loc8_++;
            }
            _loc13_++;
         }
         param1.updateData(_loc4_);
      }
   }
}
