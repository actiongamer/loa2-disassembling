package away3d.tools.utils
{
   import away3d.core.base.ISubGeometry;
   import away3d.core.base.CompactSubGeometry;
   import away3d.core.base.SkinnedSubGeometry;
   import away3d.core.base.SubMesh;
   
   public class GeomUtil
   {
       
      
      public function GeomUtil()
      {
         super();
      }
      
      public static function fromVectors(param1:Vector.<Number>, param2:Vector.<uint>, param3:Vector.<Number>, param4:Vector.<Number>, param5:Vector.<Number>, param6:Vector.<Number>, param7:Vector.<Number>, param8:int = 0) : Vector.<ISubGeometry>
      {
         var _loc33_:int = 0;
         _loc33_ = 196605;
         var _loc11_:int = 0;
         _loc11_ = 983025;
         var _loc28_:* = 0;
         var _loc27_:* = 0;
         var _loc30_:* = 0;
         var _loc32_:* = 0;
         var _loc18_:* = undefined;
         var _loc9_:* = undefined;
         var _loc12_:* = undefined;
         var _loc31_:* = undefined;
         var _loc10_:* = undefined;
         var _loc35_:* = undefined;
         var _loc34_:* = undefined;
         var _loc15_:* = undefined;
         var _loc13_:* = 0;
         var _loc29_:* = 0;
         var _loc26_:* = 0;
         var _loc23_:* = 0;
         var _loc20_:* = 0;
         var _loc25_:* = 0;
         var _loc22_:* = 0;
         var _loc16_:* = 0;
         var _loc24_:* = 0;
         var _loc17_:* = 0;
         var _loc21_:* = 0;
         var _loc19_:* = 0;
         var _loc14_:Vector.<ISubGeometry> = new Vector.<ISubGeometry>();
         if(param3 && !param3.length)
         {
            param3 = null;
         }
         if(param4 && !param4.length)
         {
            param4 = null;
         }
         if(param5 && !param5.length)
         {
            param5 = null;
         }
         if(param6 && !param6.length)
         {
            param6 = null;
         }
         if(param7 && !param7.length)
         {
            param7 = null;
         }
         if(param2.length >= 983025 || param1.length >= 196605)
         {
            _loc18_ = new Vector.<Number>();
            _loc9_ = new Vector.<uint>();
            _loc12_ = param3 != null?new Vector.<Number>():null;
            _loc31_ = param4 != null?new Vector.<Number>():null;
            _loc10_ = param5 != null?new Vector.<Number>():null;
            _loc35_ = param6 != null?new Vector.<Number>():null;
            _loc34_ = param7 != null?new Vector.<Number>():null;
            _loc15_ = new Vector.<int>(param1.length / 3,true);
            _loc32_ = uint(_loc15_.length);
            while(_loc32_-- > 0)
            {
               _loc15_[_loc32_] = -1;
            }
            _loc27_ = uint(0);
            _loc28_ = uint(param2.length);
            _loc32_ = uint(0);
            while(_loc32_ < _loc28_)
            {
               _loc29_ = uint(_loc18_.length + 6);
               if(_loc27_ + 2 >= 983025 || _loc29_ >= 196605)
               {
                  _loc14_.push(constructSubGeometry(_loc18_,_loc9_,_loc12_,_loc31_,_loc10_,_loc35_,_loc34_,param8));
                  _loc18_ = new Vector.<Number>();
                  _loc9_ = new Vector.<uint>();
                  _loc12_ = param3 != null?new Vector.<Number>():null;
                  _loc31_ = param4 != null?new Vector.<Number>():null;
                  _loc10_ = param5 != null?new Vector.<Number>():null;
                  _loc35_ = param6 != null?new Vector.<Number>():null;
                  _loc34_ = param7 != null?new Vector.<Number>():null;
                  _loc29_ = uint(0);
                  _loc30_ = uint(_loc15_.length);
                  while(_loc30_-- > 0)
                  {
                     _loc15_[_loc30_] = -1;
                  }
                  _loc27_ = uint(0);
               }
               _loc30_ = uint(0);
               while(_loc30_ < 3)
               {
                  _loc13_ = uint(param2[_loc32_ + _loc30_]);
                  if(_loc15_[_loc13_] >= 0)
                  {
                     _loc29_ = uint(_loc15_[_loc13_]);
                  }
                  else
                  {
                     _loc19_ = uint(_loc13_ * 3 + 0);
                     _loc26_ = uint(_loc13_ * 3 + 1);
                     _loc23_ = uint(_loc13_ * 3 + 2);
                     _loc29_ = uint(_loc18_.length / 3);
                     _loc20_ = uint(_loc29_ * 3 + 0);
                     _loc25_ = uint(_loc29_ * 3 + 1);
                     _loc22_ = uint(_loc29_ * 3 + 2);
                     _loc18_[_loc20_] = param1[_loc19_];
                     _loc18_[_loc25_] = param1[_loc26_];
                     _loc18_[_loc22_] = param1[_loc23_];
                     if(param3)
                     {
                        _loc16_ = uint(_loc29_ * 2 + 0);
                        _loc17_ = uint(_loc29_ * 2 + 1);
                        _loc24_ = uint(_loc13_ * 2 + 0);
                        _loc21_ = uint(_loc13_ * 2 + 1);
                        _loc12_[_loc16_] = param3[_loc24_];
                        _loc12_[_loc17_] = param3[_loc21_];
                     }
                     if(param4)
                     {
                        _loc31_[_loc20_] = param4[_loc19_];
                        _loc31_[_loc25_] = param4[_loc26_];
                        _loc31_[_loc22_] = param4[_loc23_];
                     }
                     if(param5)
                     {
                        _loc10_[_loc20_] = param5[_loc19_];
                        _loc10_[_loc25_] = param5[_loc26_];
                        _loc10_[_loc22_] = param5[_loc23_];
                     }
                     if(param6)
                     {
                        _loc35_[_loc20_] = param6[_loc19_];
                        _loc35_[_loc25_] = param6[_loc26_];
                        _loc35_[_loc22_] = param6[_loc23_];
                     }
                     if(param7)
                     {
                        _loc34_[_loc20_] = param7[_loc19_];
                        _loc34_[_loc25_] = param7[_loc26_];
                        _loc34_[_loc22_] = param7[_loc23_];
                     }
                     _loc15_[_loc13_] = _loc29_;
                  }
                  _loc9_[_loc27_ + _loc30_] = _loc29_;
                  _loc30_++;
               }
               _loc27_ = uint(_loc27_ + 3);
               _loc32_ = uint(_loc32_ + 3);
            }
            if(_loc18_.length > 0)
            {
               _loc14_.push(constructSubGeometry(_loc18_,_loc9_,_loc12_,_loc31_,_loc10_,_loc35_,_loc34_,param8));
            }
         }
         else
         {
            _loc14_.push(constructSubGeometry(param1,param2,param3,param4,param5,param6,param7,param8));
         }
         return _loc14_;
      }
      
      public static function constructSubGeometry(param1:Vector.<Number>, param2:Vector.<uint>, param3:Vector.<Number>, param4:Vector.<Number>, param5:Vector.<Number>, param6:Vector.<Number>, param7:Vector.<Number>, param8:int) : CompactSubGeometry
      {
         var _loc9_:* = null;
         if(param6 && param7)
         {
            _loc9_ = new SkinnedSubGeometry(param6.length / (param1.length / 3));
            SkinnedSubGeometry(_loc9_).updateJointWeightsData(param6);
            SkinnedSubGeometry(_loc9_).updateJointIndexData(param7);
         }
         else
         {
            _loc9_ = new CompactSubGeometry();
         }
         _loc9_.updateIndexData(param2);
         _loc9_.fromVectors(param1,param3,param4,param5);
         return _loc9_;
      }
      
      public static function interleaveBuffers(param1:uint, param2:Vector.<Number> = null, param3:Vector.<Number> = null, param4:Vector.<Number> = null, param5:Vector.<Number> = null, param6:Vector.<Number> = null) : Vector.<Number>
      {
         var _loc10_:* = 0;
         var _loc9_:* = 0;
         var _loc7_:* = 0;
         var _loc11_:* = 0;
         var _loc8_:* = undefined;
         _loc8_ = new Vector.<Number>();
         _loc11_ = uint(0);
         while(_loc11_ < param1)
         {
            _loc9_ = uint(_loc11_ * 2);
            _loc10_ = uint(_loc11_ * 3);
            _loc7_ = uint(_loc11_ * 13);
            _loc8_[_loc7_] = !!param2?param2[_loc10_]:0;
            _loc8_[_loc7_ + 1] = !!param2?param2[_loc10_ + 1]:0;
            _loc8_[_loc7_ + 2] = !!param2?param2[_loc10_ + 2]:0;
            _loc8_[_loc7_ + 3] = !!param3?param3[_loc10_]:0;
            _loc8_[_loc7_ + 4] = !!param3?param3[_loc10_ + 1]:0;
            _loc8_[_loc7_ + 5] = !!param3?param3[_loc10_ + 2]:0;
            _loc8_[_loc7_ + 6] = !!param4?param4[_loc10_]:0;
            _loc8_[_loc7_ + 7] = !!param4?param4[_loc10_ + 1]:0;
            _loc8_[_loc7_ + 8] = !!param4?param4[_loc10_ + 2]:0;
            _loc8_[_loc7_ + 9] = !!param5?param5[_loc9_]:0;
            _loc8_[_loc7_ + 10] = !!param5?param5[_loc9_ + 1]:0;
            _loc8_[_loc7_ + 11] = !!param6?param6[_loc9_]:0;
            _loc8_[_loc7_ + 12] = !!param6?param6[_loc9_ + 1]:0;
            _loc11_++;
         }
         return _loc8_;
      }
      
      public static function getMeshSubgeometryIndex(param1:ISubGeometry) : uint
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc2_:Vector.<ISubGeometry> = param1.parentGeometry.subGeometries;
         _loc4_ = uint(0);
         while(_loc4_ < _loc2_.length)
         {
            if(_loc2_[_loc4_] == param1)
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function getMeshSubMeshIndex(param1:SubMesh) : uint
      {
         var _loc2_:* = 0;
         var _loc4_:* = 0;
         var _loc3_:Vector.<SubMesh> = param1.parentMesh.subMeshes;
         _loc4_ = uint(0);
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_] == param1)
            {
               _loc2_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         return _loc2_;
      }
   }
}
