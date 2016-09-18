package away3d.primitives
{
   import away3d.core.base.CompactSubGeometry;
   
   public class PlaneGeometry extends PrimitiveBase
   {
       
      
      private var _segmentsW:uint;
      
      private var _segmentsH:uint;
      
      private var _yUp:Boolean;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _doubleSided:Boolean;
      
      public function PlaneGeometry(param1:Number = 100, param2:Number = 100, param3:uint = 1, param4:uint = 1, param5:Boolean = true, param6:Boolean = false)
      {
         super();
         _segmentsW = param3;
         _segmentsH = param4;
         _yUp = param5;
         _width = param1;
         _height = param2;
         _doubleSided = param6;
      }
      
      public function get segmentsW() : uint
      {
         return _segmentsW;
      }
      
      public function set segmentsW(param1:uint) : void
      {
         _segmentsW = param1;
         invalidateGeometry();
         invalidateUVs();
      }
      
      public function get segmentsH() : uint
      {
         return _segmentsH;
      }
      
      public function set segmentsH(param1:uint) : void
      {
         _segmentsH = param1;
         invalidateGeometry();
         invalidateUVs();
      }
      
      public function get yUp() : Boolean
      {
         return _yUp;
      }
      
      public function set yUp(param1:Boolean) : void
      {
         _yUp = param1;
         invalidateGeometry();
      }
      
      public function get doubleSided() : Boolean
      {
         return _doubleSided;
      }
      
      public function set doubleSided(param1:Boolean) : void
      {
         _doubleSided = param1;
         invalidateGeometry();
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
      
      override protected function buildGeometry(param1:CompactSubGeometry) : void
      {
         var _loc6_:* = undefined;
         var _loc13_:* = undefined;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc2_:* = 0;
         var _loc12_:* = 0;
         var _loc16_:* = 0;
         var _loc5_:* = 0;
         var _loc10_:int = 0;
         var _loc3_:int = 0;
         var _loc11_:uint = _segmentsW + 1;
         var _loc8_:uint = (_segmentsH + 1) * _loc11_;
         var _loc9_:uint = param1.vertexStride;
         var _loc7_:uint = _loc9_ - 9;
         if(_doubleSided)
         {
            _loc8_ = _loc8_ * 2;
         }
         _loc2_ = uint(_segmentsH * _segmentsW * 6);
         if(_doubleSided)
         {
            _loc2_ = uint(_loc2_ << 1);
         }
         if(_loc8_ == param1.numVertices)
         {
            _loc6_ = param1.vertexData;
            _loc13_ = param1.indexData || new Vector.<uint>(_loc2_,true);
         }
         else
         {
            _loc6_ = new Vector.<Number>(_loc8_ * _loc9_,true);
            _loc13_ = new Vector.<uint>(_loc2_,true);
            invalidateUVs();
         }
         _loc2_ = uint(0);
         var _loc4_:uint = param1.vertexOffset;
         _loc16_ = uint(0);
         while(_loc16_ <= _segmentsH)
         {
            _loc5_ = uint(0);
            while(_loc5_ <= _segmentsW)
            {
               _loc15_ = (_loc5_ / _segmentsW - 0.5) * _width;
               _loc14_ = (_loc16_ / _segmentsH - 0.5) * _height;
               _loc6_[_loc4_++] = _loc15_;
               if(_yUp)
               {
                  _loc6_[_loc4_++] = 0;
                  _loc6_[_loc4_++] = _loc14_;
               }
               else
               {
                  _loc6_[_loc4_++] = _loc14_;
                  _loc6_[_loc4_++] = 0;
               }
               _loc6_[_loc4_++] = 0;
               if(_yUp)
               {
                  _loc6_[_loc4_++] = 1;
                  _loc6_[_loc4_++] = 0;
               }
               else
               {
                  _loc6_[_loc4_++] = 0;
                  _loc6_[_loc4_++] = -1;
               }
               _loc6_[_loc4_++] = 1;
               _loc6_[_loc4_++] = 0;
               _loc6_[_loc4_++] = 0;
               _loc4_ = _loc4_ + _loc7_;
               if(_doubleSided)
               {
                  _loc10_ = 0;
                  while(_loc10_ < 3)
                  {
                     _loc6_[_loc4_] = _loc6_[_loc4_ - _loc9_];
                     _loc4_++;
                     _loc10_++;
                  }
                  _loc10_ = 0;
                  while(_loc10_ < 3)
                  {
                     _loc6_[_loc4_] = -_loc6_[_loc4_ - _loc9_];
                     _loc4_++;
                     _loc10_++;
                  }
                  _loc10_ = 0;
                  while(_loc10_ < 3)
                  {
                     _loc6_[_loc4_] = -_loc6_[_loc4_ - _loc9_];
                     _loc4_++;
                     _loc10_++;
                  }
                  _loc4_ = _loc4_ + _loc7_;
               }
               if(_loc5_ != _segmentsW && _loc16_ != _segmentsH)
               {
                  _loc12_ = uint(_loc5_ + _loc16_ * _loc11_);
                  _loc3_ = !!_doubleSided?2:1;
                  _loc13_[_loc2_++] = _loc12_ * _loc3_;
                  _loc13_[_loc2_++] = (_loc12_ + _loc11_) * _loc3_;
                  _loc13_[_loc2_++] = (_loc12_ + _loc11_ + 1) * _loc3_;
                  _loc13_[_loc2_++] = _loc12_ * _loc3_;
                  _loc13_[_loc2_++] = (_loc12_ + _loc11_ + 1) * _loc3_;
                  _loc13_[_loc2_++] = (_loc12_ + 1) * _loc3_;
                  if(_doubleSided)
                  {
                     _loc13_[_loc2_++] = (_loc12_ + _loc11_ + 1) * _loc3_ + 1;
                     _loc13_[_loc2_++] = (_loc12_ + _loc11_) * _loc3_ + 1;
                     _loc13_[_loc2_++] = _loc12_ * _loc3_ + 1;
                     _loc13_[_loc2_++] = (_loc12_ + 1) * _loc3_ + 1;
                     _loc13_[_loc2_++] = (_loc12_ + _loc11_ + 1) * _loc3_ + 1;
                     _loc13_[_loc2_++] = _loc12_ * _loc3_ + 1;
                  }
               }
               _loc5_++;
            }
            _loc16_++;
         }
         param1.updateData(_loc6_);
         param1.updateIndexData(_loc13_);
      }
      
      override protected function buildUVs(param1:CompactSubGeometry) : void
      {
         var _loc4_:* = undefined;
         var _loc8_:* = 0;
         var _loc3_:* = 0;
         var _loc7_:uint = param1.UVStride;
         var _loc5_:uint = (_segmentsH + 1) * (_segmentsW + 1) * _loc7_;
         var _loc6_:uint = _loc7_ - 2;
         if(_doubleSided)
         {
            _loc5_ = _loc5_ * 2;
         }
         if(param1.UVData && _loc5_ == param1.UVData.length)
         {
            _loc4_ = param1.UVData;
         }
         else
         {
            _loc4_ = new Vector.<Number>(_loc5_,true);
            invalidateGeometry();
         }
         var _loc2_:uint = param1.UVOffset;
         _loc8_ = uint(0);
         while(_loc8_ <= _segmentsH)
         {
            _loc3_ = uint(0);
            while(_loc3_ <= _segmentsW)
            {
               _loc4_[_loc2_++] = _loc3_ / _segmentsW;
               _loc4_[_loc2_++] = 1 - _loc8_ / _segmentsH;
               _loc2_ = _loc2_ + _loc6_;
               if(_doubleSided)
               {
                  _loc4_[_loc2_++] = _loc3_ / _segmentsW;
                  _loc4_[_loc2_++] = 1 - _loc8_ / _segmentsH;
                  _loc2_ = _loc2_ + _loc6_;
               }
               _loc3_++;
            }
            _loc8_++;
         }
         param1.updateData(_loc4_);
      }
   }
}
