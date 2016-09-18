package away3d.primitives
{
   import away3d.core.base.CompactSubGeometry;
   
   public class CylinderGeometry extends PrimitiveBase
   {
       
      
      protected var _topRadius:Number;
      
      protected var _bottomRadius:Number;
      
      protected var _height:Number;
      
      protected var _segmentsW:uint;
      
      protected var _segmentsH:uint;
      
      protected var _topClosed:Boolean;
      
      protected var _bottomClosed:Boolean;
      
      protected var _surfaceClosed:Boolean;
      
      protected var _yUp:Boolean;
      
      private var _rawData:Vector.<Number>;
      
      private var _rawIndices:Vector.<uint>;
      
      private var _nextVertexIndex:uint;
      
      private var _currentIndex:uint;
      
      private var _currentTriangleIndex:uint;
      
      private var _numVertices:uint;
      
      private var _stride:uint;
      
      private var _vertexOffset:uint;
      
      public function CylinderGeometry(param1:Number = 50, param2:Number = 50, param3:Number = 100, param4:uint = 16, param5:uint = 1, param6:Boolean = true, param7:Boolean = true, param8:Boolean = true, param9:Boolean = true)
      {
         super();
         _topRadius = param1;
         _bottomRadius = param2;
         _height = param3;
         _segmentsW = param4;
         _segmentsH = param5;
         _topClosed = param6;
         _bottomClosed = param7;
         _surfaceClosed = param8;
         _yUp = param9;
      }
      
      private function addVertex(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         var _loc10_:uint = _vertexOffset + _nextVertexIndex * _stride;
         _rawData[_loc10_++] = param1;
         _rawData[_loc10_++] = param2;
         _rawData[_loc10_++] = param3;
         _rawData[_loc10_++] = param4;
         _rawData[_loc10_++] = param5;
         _rawData[_loc10_++] = param6;
         _rawData[_loc10_++] = param7;
         _rawData[_loc10_++] = param8;
         _rawData[_loc10_++] = param9;
         _nextVertexIndex = Number(_nextVertexIndex) + 1;
      }
      
      private function addTriangleClockWise(param1:uint, param2:uint, param3:uint) : void
      {
         _currentIndex = Number(_currentIndex) + 1;
         _rawIndices[Number(_currentIndex)] = param1;
         _currentIndex = Number(_currentIndex) + 1;
         _rawIndices[Number(_currentIndex)] = param2;
         _currentIndex = Number(_currentIndex) + 1;
         _rawIndices[Number(_currentIndex)] = param3;
         _currentTriangleIndex = Number(_currentTriangleIndex) + 1;
      }
      
      override protected function buildGeometry(param1:CompactSubGeometry) : void
      {
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc18_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc7_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc2_:* = 0;
         var _loc6_:* = 0;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc10_:uint = 0;
         _stride = param1.vertexStride;
         _vertexOffset = param1.vertexOffset;
         _numVertices = 0;
         _nextVertexIndex = 0;
         _currentIndex = 0;
         _currentTriangleIndex = 0;
         if(_surfaceClosed)
         {
            _numVertices = _numVertices + (_segmentsH + 1) * (_segmentsW + 1);
            _loc10_ = _loc10_ + _segmentsH * _segmentsW * 2;
         }
         if(_topClosed)
         {
            _numVertices = _numVertices + 2 * (_segmentsW + 1);
            _loc10_ = _loc10_ + _segmentsW;
         }
         if(_bottomClosed)
         {
            _numVertices = _numVertices + 2 * (_segmentsW + 1);
            _loc10_ = _loc10_ + _segmentsW;
         }
         if(_numVertices == param1.numVertices)
         {
            _rawData = param1.vertexData;
            _rawIndices = param1.indexData || new Vector.<uint>(_loc10_ * 3,true);
         }
         else
         {
            _loc7_ = uint(_numVertices * _stride);
            _rawData = new Vector.<Number>(_loc7_,true);
            _rawIndices = new Vector.<uint>(_loc10_ * 3,true);
         }
         var _loc13_:Number = 2 * 3.14159265358979 / _segmentsW;
         if(_topClosed && _topRadius > 0)
         {
            _loc17_ = -0.5 * _height;
            _loc9_ = uint(0);
            while(_loc9_ <= _segmentsW)
            {
               if(_yUp)
               {
                  addVertex(0,-_loc17_,0,0,1,0,1,0,0);
               }
               else
               {
                  addVertex(0,0,_loc17_,0,0,-1,1,0,0);
               }
               _loc12_ = _loc9_ * _loc13_;
               _loc19_ = _topRadius * Math.cos(_loc12_);
               _loc18_ = _topRadius * Math.sin(_loc12_);
               if(_yUp)
               {
                  addVertex(_loc19_,-_loc17_,_loc18_,0,1,0,1,0,0);
               }
               else
               {
                  addVertex(_loc19_,_loc18_,_loc17_,0,0,-1,1,0,0);
               }
               if(_loc9_ > 0)
               {
                  addTriangleClockWise(_nextVertexIndex - 1,_nextVertexIndex - 3,_nextVertexIndex - 2);
               }
               _loc9_++;
            }
         }
         if(_bottomClosed && _bottomRadius > 0)
         {
            _loc17_ = 0.5 * _height;
            _loc9_ = uint(0);
            while(_loc9_ <= _segmentsW)
            {
               if(_yUp)
               {
                  addVertex(0,-_loc17_,0,0,-1,0,1,0,0);
               }
               else
               {
                  addVertex(0,0,_loc17_,0,0,1,1,0,0);
               }
               _loc12_ = _loc9_ * _loc13_;
               _loc19_ = _bottomRadius * Math.cos(_loc12_);
               _loc18_ = _bottomRadius * Math.sin(_loc12_);
               if(_yUp)
               {
                  addVertex(_loc19_,-_loc17_,_loc18_,0,-1,0,1,0,0);
               }
               else
               {
                  addVertex(_loc19_,_loc18_,_loc17_,0,0,1,1,0,0);
               }
               if(_loc9_ > 0)
               {
                  addTriangleClockWise(_nextVertexIndex - 2,_nextVertexIndex - 3,_nextVertexIndex - 1);
               }
               _loc9_++;
            }
         }
         _loc20_ = _bottomRadius - _topRadius;
         _loc11_ = _loc20_ / _height;
         _loc3_ = _loc11_ == 0?1:Number(_height / _loc20_);
         if(_surfaceClosed)
         {
            _loc8_ = uint(0);
            while(_loc8_ <= _segmentsH)
            {
               _loc16_ = _topRadius - _loc8_ / _segmentsH * (_topRadius - _bottomRadius);
               _loc17_ = -(_height / 2) + _loc8_ / _segmentsH * _height;
               _loc9_ = uint(0);
               while(_loc9_ <= _segmentsW)
               {
                  _loc12_ = _loc9_ * _loc13_;
                  _loc19_ = _loc16_ * Math.cos(_loc12_);
                  _loc18_ = _loc16_ * Math.sin(_loc12_);
                  _loc15_ = _loc3_ * Math.cos(_loc12_);
                  _loc14_ = _loc3_ * Math.sin(_loc12_);
                  if(_yUp)
                  {
                     addVertex(_loc19_,-_loc17_,_loc18_,_loc15_,_loc11_,_loc14_,_loc14_,0,-_loc15_);
                  }
                  else
                  {
                     addVertex(_loc19_,_loc18_,_loc17_,_loc15_,_loc14_,_loc11_,_loc14_,-_loc15_,0);
                  }
                  if(_loc9_ > 0 && _loc8_ > 0)
                  {
                     _loc6_ = uint(_nextVertexIndex - 1);
                     _loc4_ = uint(_nextVertexIndex - 2);
                     _loc5_ = uint(_loc4_ - _segmentsW - 1);
                     _loc2_ = uint(_loc6_ - _segmentsW - 1);
                     addTriangleClockWise(_loc6_,_loc4_,_loc5_);
                     addTriangleClockWise(_loc6_,_loc5_,_loc2_);
                  }
                  _loc9_++;
               }
               _loc8_++;
            }
         }
         param1.updateData(_rawData);
         param1.updateIndexData(_rawIndices);
      }
      
      override protected function buildUVs(param1:CompactSubGeometry) : void
      {
         var _loc7_:int = 0;
         var _loc12_:int = 0;
         var _loc10_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc2_:* = undefined;
         var _loc8_:uint = param1.UVStride;
         var _loc6_:uint = _loc8_ - 2;
         var _loc5_:uint = _numVertices * _loc8_;
         if(param1.UVData && _loc5_ == param1.UVData.length)
         {
            _loc2_ = param1.UVData;
         }
         else
         {
            _loc2_ = new Vector.<Number>(_loc5_,true);
            invalidateGeometry();
         }
         var _loc4_:Number = 2 * 3.14159265358979 / _segmentsW;
         var _loc9_:uint = param1.UVOffset;
         if(_topClosed)
         {
            _loc12_ = 0;
            while(_loc12_ <= _segmentsW)
            {
               _loc3_ = _loc12_ * _loc4_;
               _loc11_ = 0.5 + 0.5 * Math.cos(_loc3_);
               _loc10_ = 0.5 + 0.5 * Math.sin(_loc3_);
               _loc2_[_loc9_++] = 0.5;
               _loc2_[_loc9_++] = 0.5;
               _loc9_ = _loc9_ + _loc6_;
               _loc2_[_loc9_++] = _loc11_;
               _loc2_[_loc9_++] = _loc10_;
               _loc9_ = _loc9_ + _loc6_;
               _loc12_++;
            }
         }
         if(_bottomClosed)
         {
            _loc12_ = 0;
            while(_loc12_ <= _segmentsW)
            {
               _loc3_ = _loc12_ * _loc4_;
               _loc11_ = 0.5 + 0.5 * Math.cos(_loc3_);
               _loc10_ = 0.5 + 0.5 * Math.sin(_loc3_);
               _loc2_[_loc9_++] = 0.5;
               _loc2_[_loc9_++] = 0.5;
               _loc9_ = _loc9_ + _loc6_;
               _loc2_[_loc9_++] = _loc11_;
               _loc2_[_loc9_++] = _loc10_;
               _loc9_ = _loc9_ + _loc6_;
               _loc12_++;
            }
         }
         if(_surfaceClosed)
         {
            _loc7_ = 0;
            while(_loc7_ <= _segmentsH)
            {
               _loc12_ = 0;
               while(_loc12_ <= _segmentsW)
               {
                  _loc2_[_loc9_++] = _loc12_ / _segmentsW;
                  _loc2_[_loc9_++] = _loc7_ / _segmentsH;
                  _loc9_ = _loc9_ + _loc6_;
                  _loc12_++;
               }
               _loc7_++;
            }
         }
         param1.updateData(_loc2_);
      }
      
      public function get topRadius() : Number
      {
         return _topRadius;
      }
      
      public function set topRadius(param1:Number) : void
      {
         _topRadius = param1;
         invalidateGeometry();
      }
      
      public function get bottomRadius() : Number
      {
         return _bottomRadius;
      }
      
      public function set bottomRadius(param1:Number) : void
      {
         _bottomRadius = param1;
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
      
      public function get topClosed() : Boolean
      {
         return _topClosed;
      }
      
      public function set topClosed(param1:Boolean) : void
      {
         _topClosed = param1;
         invalidateGeometry();
      }
      
      public function get bottomClosed() : Boolean
      {
         return _bottomClosed;
      }
      
      public function set bottomClosed(param1:Boolean) : void
      {
         _bottomClosed = param1;
         invalidateGeometry();
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
