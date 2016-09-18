package away3d.core.pick
{
   import away3d.core.base.SubMesh;
   import flash.geom.Vector3D;
   
   public class AS3PickingCollider extends PickingColliderBase implements IPickingCollider
   {
       
      
      private var _findClosestCollision:Boolean;
      
      public function AS3PickingCollider(param1:Boolean = false)
      {
         super();
         _findClosestCollision = param1;
      }
      
      public function testSubMeshCollision(param1:SubMesh, param2:PickingCollisionVO, param3:Number, param4:Boolean) : Boolean
      {
         var _loc52_:Number = NaN;
         var _loc30_:* = 0;
         var _loc28_:* = 0;
         var _loc23_:* = 0;
         var _loc31_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc51_:Number = NaN;
         var _loc50_:Number = NaN;
         var _loc49_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc39_:Number = NaN;
         var _loc44_:Number = NaN;
         var _loc42_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc33_:Number = NaN;
         var _loc37_:Number = NaN;
         var _loc55_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc48_:Number = NaN;
         var _loc45_:Number = NaN;
         var _loc46_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc17_:* = 0;
         var _loc47_:Vector.<uint> = param1.indexData;
         var _loc43_:Vector.<Number> = param1.vertexData;
         var _loc38_:Vector.<Number> = param1.UVData;
         var _loc5_:int = -1;
         var _loc41_:uint = param1.vertexStride;
         var _loc54_:uint = param1.vertexOffset;
         var _loc22_:uint = param1.UVStride;
         var _loc53_:uint = param1.UVOffset;
         var _loc32_:int = _loc47_.length;
         _loc17_ = uint(0);
         while(_loc17_ < _loc32_)
         {
            _loc23_ = uint(_loc54_ + _loc47_[_loc17_] * _loc41_);
            _loc30_ = uint(_loc54_ + _loc47_[uint(_loc17_ + 1)] * _loc41_);
            _loc28_ = uint(_loc54_ + _loc47_[uint(_loc17_ + 2)] * _loc41_);
            _loc42_ = _loc43_[_loc23_];
            _loc39_ = _loc43_[uint(_loc23_ + 1)];
            _loc44_ = _loc43_[uint(_loc23_ + 2)];
            _loc25_ = _loc43_[_loc30_];
            _loc27_ = _loc43_[uint(_loc30_ + 1)];
            _loc26_ = _loc43_[uint(_loc30_ + 2)];
            _loc15_ = _loc43_[_loc28_];
            _loc14_ = _loc43_[uint(_loc28_ + 1)];
            _loc16_ = _loc43_[uint(_loc28_ + 2)];
            _loc36_ = _loc25_ - _loc42_;
            _loc34_ = _loc27_ - _loc39_;
            _loc35_ = _loc26_ - _loc44_;
            _loc11_ = _loc15_ - _loc42_;
            _loc9_ = _loc14_ - _loc39_;
            _loc7_ = _loc16_ - _loc44_;
            _loc10_ = _loc34_ * _loc7_ - _loc35_ * _loc9_;
            _loc8_ = _loc35_ * _loc11_ - _loc36_ * _loc7_;
            _loc6_ = _loc36_ * _loc9_ - _loc34_ * _loc11_;
            _loc55_ = 1 / Math.sqrt(_loc10_ * _loc10_ + _loc8_ * _loc8_ + _loc6_ * _loc6_);
            _loc10_ = _loc10_ * _loc55_;
            _loc8_ = _loc8_ * _loc55_;
            _loc6_ = _loc6_ * _loc55_;
            _loc18_ = _loc10_ * rayDirection.x + _loc8_ * rayDirection.y + _loc6_ * rayDirection.z;
            if(param4 && _loc18_ < 0 || !param4 && _loc18_ != 0)
            {
               _loc33_ = -(_loc10_ * _loc42_ + _loc8_ * _loc39_ + _loc6_ * _loc44_);
               _loc37_ = -(_loc10_ * rayPosition.x + _loc8_ * rayPosition.y + _loc6_ * rayPosition.z + _loc33_);
               _loc52_ = _loc37_ / _loc18_;
               _loc21_ = rayPosition.x + _loc52_ * rayDirection.x;
               _loc20_ = rayPosition.y + _loc52_ * rayDirection.y;
               _loc19_ = rayPosition.z + _loc52_ * rayDirection.z;
               _loc13_ = _loc36_ * _loc11_ + _loc34_ * _loc9_ + _loc35_ * _loc7_;
               _loc12_ = _loc36_ * _loc36_ + _loc34_ * _loc34_ + _loc35_ * _loc35_;
               _loc48_ = _loc11_ * _loc11_ + _loc9_ * _loc9_ + _loc7_ * _loc7_;
               _loc29_ = _loc21_ - _loc42_;
               _loc31_ = _loc20_ - _loc39_;
               _loc24_ = _loc19_ - _loc44_;
               _loc45_ = _loc29_ * _loc36_ + _loc31_ * _loc34_ + _loc24_ * _loc35_;
               _loc46_ = _loc29_ * _loc11_ + _loc31_ * _loc9_ + _loc24_ * _loc7_;
               _loc40_ = 1 / (_loc12_ * _loc48_ - _loc13_ * _loc13_);
               _loc50_ = _loc40_ * (_loc48_ * _loc45_ - _loc13_ * _loc46_);
               _loc49_ = _loc40_ * (-_loc13_ * _loc45_ + _loc12_ * _loc46_);
               if(_loc50_ >= 0)
               {
                  if(_loc49_ >= 0)
                  {
                     _loc51_ = 1 - _loc50_ - _loc49_;
                     if(_loc51_ >= 0 && _loc52_ > 0 && _loc52_ < param3)
                     {
                        param3 = _loc52_;
                        _loc5_ = _loc17_ / 3;
                        param2.rayEntryDistance = _loc52_;
                        param2.localPosition = new Vector3D(_loc21_,_loc20_,_loc19_);
                        param2.localNormal = new Vector3D(_loc10_,_loc8_,_loc6_);
                        param2.uv = getCollisionUV(_loc47_,_loc38_,_loc17_,_loc50_,_loc49_,_loc51_,_loc53_,_loc22_);
                        if(!_findClosestCollision)
                        {
                           return true;
                        }
                     }
                  }
               }
            }
            _loc17_ = uint(_loc17_ + 3);
         }
         if(_loc5_ >= 0)
         {
            return true;
         }
         return false;
      }
   }
}
