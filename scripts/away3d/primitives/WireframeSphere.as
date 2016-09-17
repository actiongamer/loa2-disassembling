package away3d.primitives
{
   import flash.geom.Vector3D;
   
   public class WireframeSphere extends WireframePrimitiveBase
   {
       
      
      private var _segmentsW:uint;
      
      private var _segmentsH:uint;
      
      private var _radius:Number;
      
      public function WireframeSphere(param1:Number = 50, param2:uint = 16, param3:uint = 12, param4:uint = 16777215, param5:Number = 1)
      {
         super(param4,param5);
         _radius = param1;
         _segmentsW = param2;
         _segmentsH = param3;
      }
      
      override protected function buildGeometry() : void
      {
         var _loc13_:* = 0;
         var _loc14_:* = 0;
         var _loc5_:int = 0;
         var _loc11_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc9_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:int = 0;
         var _loc10_:Vector.<Number> = new Vector.<Number>();
         var _loc3_:Vector3D = new Vector3D();
         var _loc1_:Vector3D = new Vector3D();
         var _loc2_:uint = 0;
         _loc13_ = uint(0);
         while(_loc13_ <= _segmentsH)
         {
            _loc11_ = 3.14159265358979 * _loc13_ / _segmentsH;
            _loc15_ = -_radius * Math.cos(_loc11_);
            _loc12_ = _radius * Math.sin(_loc11_);
            _loc14_ = uint(0);
            while(_loc14_ <= _segmentsW)
            {
               _loc8_ = 2 * 3.14159265358979 * _loc14_ / _segmentsW;
               _loc17_ = _loc12_ * Math.cos(_loc8_);
               _loc16_ = _loc12_ * Math.sin(_loc8_);
               _loc10_[_loc2_++] = _loc17_;
               _loc10_[_loc2_++] = -_loc15_;
               _loc10_[_loc2_++] = _loc16_;
               _loc14_++;
            }
            _loc13_++;
         }
         _loc13_ = uint(1);
         while(_loc13_ <= _segmentsH)
         {
            _loc14_ = uint(1);
            while(_loc14_ <= _segmentsW)
            {
               _loc9_ = ((_segmentsW + 1) * _loc13_ + _loc14_) * 3;
               _loc6_ = ((_segmentsW + 1) * _loc13_ + _loc14_ - 1) * 3;
               _loc7_ = ((_segmentsW + 1) * (_loc13_ - 1) + _loc14_ - 1) * 3;
               _loc4_ = ((_segmentsW + 1) * (_loc13_ - 1) + _loc14_) * 3;
               if(_loc13_ == _segmentsH)
               {
                  _loc3_.x = _loc10_[_loc7_];
                  _loc3_.y = _loc10_[_loc7_ + 1];
                  _loc3_.z = _loc10_[_loc7_ + 2];
                  _loc1_.x = _loc10_[_loc4_];
                  _loc1_.y = _loc10_[_loc4_ + 1];
                  _loc1_.z = _loc10_[_loc4_ + 2];
                  _loc5_++;
                  updateOrAddSegment(_loc5_,_loc3_,_loc1_);
                  _loc3_.x = _loc10_[_loc9_];
                  _loc3_.y = _loc10_[_loc9_ + 1];
                  _loc3_.z = _loc10_[_loc9_ + 2];
                  _loc5_++;
                  updateOrAddSegment(_loc5_,_loc3_,_loc1_);
               }
               else if(_loc13_ == 1)
               {
                  _loc1_.x = _loc10_[_loc6_];
                  _loc1_.y = _loc10_[_loc6_ + 1];
                  _loc1_.z = _loc10_[_loc6_ + 2];
                  _loc3_.x = _loc10_[_loc7_];
                  _loc3_.y = _loc10_[_loc7_ + 1];
                  _loc3_.z = _loc10_[_loc7_ + 2];
                  _loc5_++;
                  updateOrAddSegment(_loc5_,_loc3_,_loc1_);
               }
               else
               {
                  _loc1_.x = _loc10_[_loc6_];
                  _loc1_.y = _loc10_[_loc6_ + 1];
                  _loc1_.z = _loc10_[_loc6_ + 2];
                  _loc3_.x = _loc10_[_loc7_];
                  _loc3_.y = _loc10_[_loc7_ + 1];
                  _loc3_.z = _loc10_[_loc7_ + 2];
                  _loc5_++;
                  updateOrAddSegment(_loc5_,_loc3_,_loc1_);
                  _loc1_.x = _loc10_[_loc4_];
                  _loc1_.y = _loc10_[_loc4_ + 1];
                  _loc1_.z = _loc10_[_loc4_ + 2];
                  _loc5_++;
                  updateOrAddSegment(_loc5_,_loc3_,_loc1_);
               }
               _loc14_++;
            }
            _loc13_++;
         }
      }
   }
}
