package away3d.primitives
{
   import away3d.core.base.CompactSubGeometry;
   
   public class SphereGeometry extends PrimitiveBase
   {
       
      
      private var _radius:Number;
      
      private var _segmentsW:uint;
      
      private var _segmentsH:uint;
      
      private var _yUp:Boolean;
      
      public function SphereGeometry(param1:Number = 50, param2:uint = 16, param3:uint = 12, param4:Boolean = true)
      {
         super();
         _radius = param1;
         _segmentsW = param2;
         _segmentsH = param3;
         _yUp = param4;
      }
      
      override protected function buildGeometry(param1:CompactSubGeometry) : void
      {
         var _loc9_:* = undefined;
         var _loc17_:* = undefined;
         var _loc13_:* = 0;
         var _loc18_:int = 0;
         var _loc16_:* = 0;
         var _loc10_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc8_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:uint = (_segmentsH + 1) * (_segmentsW + 1);
         var _loc15_:uint = param1.vertexStride;
         var _loc14_:uint = _loc15_ - 9;
         if(_loc2_ == param1.numVertices)
         {
            _loc9_ = param1.vertexData;
            _loc17_ = param1.indexData || new Vector.<uint>((_segmentsH - 1) * _segmentsW * 6,true);
         }
         else
         {
            _loc9_ = new Vector.<Number>(_loc2_ * _loc15_,true);
            _loc17_ = new Vector.<uint>((_segmentsH - 1) * _segmentsW * 6,true);
            invalidateGeometry();
         }
         var _loc4_:uint = param1.vertexOffset;
         _loc13_ = uint(0);
         while(_loc13_ <= _segmentsH)
         {
            _loc10_ = 3.14159265358979 * _loc13_ / _segmentsH;
            _loc19_ = -_radius * Math.cos(_loc10_);
            _loc11_ = _radius * Math.sin(_loc10_);
            _loc16_ = uint(0);
            while(_loc16_ <= _segmentsW)
            {
               _loc7_ = 2 * 3.14159265358979 * _loc16_ / _segmentsW;
               _loc22_ = _loc11_ * Math.cos(_loc7_);
               _loc20_ = _loc11_ * Math.sin(_loc7_);
               _loc12_ = 1 / Math.sqrt(_loc22_ * _loc22_ + _loc20_ * _loc20_ + _loc19_ * _loc19_);
               _loc21_ = Math.sqrt(_loc20_ * _loc20_ + _loc22_ * _loc22_);
               if(_yUp)
               {
                  _loc9_[_loc4_++] = _loc22_;
                  _loc9_[_loc4_++] = -_loc19_;
                  _loc9_[_loc4_++] = _loc20_;
                  _loc9_[_loc4_++] = _loc22_ * _loc12_;
                  _loc9_[_loc4_++] = -_loc19_ * _loc12_;
                  _loc9_[_loc4_++] = _loc20_ * _loc12_;
                  _loc9_[_loc4_++] = _loc21_ > 0.007?-_loc20_ / _loc21_:1;
                  _loc9_[_loc4_++] = 0;
                  _loc9_[_loc4_++] = _loc21_ > 0.007?_loc22_ / _loc21_:0;
               }
               else
               {
                  _loc9_[_loc4_++] = _loc22_;
                  _loc9_[_loc4_++] = _loc20_;
                  _loc9_[_loc4_++] = _loc19_;
                  _loc9_[_loc4_++] = _loc22_ * _loc12_;
                  _loc9_[_loc4_++] = _loc20_ * _loc12_;
                  _loc9_[_loc4_++] = _loc19_ * _loc12_;
                  _loc9_[_loc4_++] = _loc21_ > 0.007?-_loc20_ / _loc21_:1;
                  _loc9_[_loc4_++] = _loc21_ > 0.007?_loc22_ / _loc21_:0;
                  _loc9_[_loc4_++] = 0;
               }
               _loc4_ = _loc4_ + _loc14_;
               if(_loc16_ > 0 && _loc13_ > 0)
               {
                  _loc8_ = (_segmentsW + 1) * _loc13_ + _loc16_;
                  _loc5_ = (_segmentsW + 1) * _loc13_ + _loc16_ - 1;
                  _loc6_ = (_segmentsW + 1) * (_loc13_ - 1) + _loc16_ - 1;
                  _loc3_ = (_segmentsW + 1) * (_loc13_ - 1) + _loc16_;
                  if(_loc13_ == _segmentsH)
                  {
                     _loc17_[_loc18_++] = _loc8_;
                     _loc17_[_loc18_++] = _loc6_;
                     _loc17_[_loc18_++] = _loc3_;
                  }
                  else if(_loc13_ == 1)
                  {
                     _loc17_[_loc18_++] = _loc8_;
                     _loc17_[_loc18_++] = _loc5_;
                     _loc17_[_loc18_++] = _loc6_;
                  }
                  else
                  {
                     _loc17_[_loc18_++] = _loc8_;
                     _loc17_[_loc18_++] = _loc5_;
                     _loc17_[_loc18_++] = _loc6_;
                     _loc17_[_loc18_++] = _loc8_;
                     _loc17_[_loc18_++] = _loc6_;
                     _loc17_[_loc18_++] = _loc3_;
                  }
               }
               _loc16_++;
            }
            _loc13_++;
         }
         param1.updateData(_loc9_);
         param1.updateIndexData(_loc17_);
      }
      
      override protected function buildUVs(param1:CompactSubGeometry) : void
      {
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc3_:* = undefined;
         var _loc7_:uint = param1.UVStride;
         var _loc4_:uint = (_segmentsH + 1) * (_segmentsW + 1) * _loc7_;
         var _loc5_:uint = _loc7_ - 2;
         if(param1.UVData && _loc4_ == param1.UVData.length)
         {
            _loc3_ = param1.UVData;
         }
         else
         {
            _loc3_ = new Vector.<Number>(_loc4_,true);
            invalidateGeometry();
         }
         var _loc2_:int = param1.UVOffset;
         _loc6_ = 0;
         while(_loc6_ <= _segmentsH)
         {
            _loc8_ = 0;
            while(_loc8_ <= _segmentsW)
            {
               _loc2_++;
               _loc3_[_loc2_] = _loc8_ / _segmentsW;
               _loc2_++;
               _loc3_[_loc2_] = _loc6_ / _segmentsH;
               _loc2_ = _loc2_ + _loc5_;
               _loc8_++;
            }
            _loc6_++;
         }
         param1.updateData(_loc3_);
      }
      
      public function get radius() : Number
      {
         return _radius;
      }
      
      public function set radius(param1:Number) : void
      {
         _radius = param1;
         invalidateGeometry();
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
   }
}
