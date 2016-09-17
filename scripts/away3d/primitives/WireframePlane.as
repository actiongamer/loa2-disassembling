package away3d.primitives
{
   import flash.geom.Vector3D;
   
   public class WireframePlane extends WireframePrimitiveBase
   {
      
      public static const ORIENTATION_YZ:String = "yz";
      
      public static const ORIENTATION_XY:String = "xy";
      
      public static const ORIENTATION_XZ:String = "xz";
       
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _segmentsW:int;
      
      private var _segmentsH:int;
      
      private var _orientation:String;
      
      public function WireframePlane(param1:Number, param2:Number, param3:int = 10, param4:int = 10, param5:uint = 16777215, param6:Number = 1, param7:String = "yz")
      {
         super(param5,param6);
         _width = param1;
         _height = param2;
         _segmentsW = param3;
         _segmentsH = param4;
         _orientation = param7;
      }
      
      public function get orientation() : String
      {
         return _orientation;
      }
      
      public function set orientation(param1:String) : void
      {
         _orientation = param1;
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
         if(param1 <= 0)
         {
            throw new Error("Value needs to be greater than 0");
         }
         _height = param1;
         invalidateGeometry();
      }
      
      public function get segmentsW() : int
      {
         return _segmentsW;
      }
      
      public function set segmentsW(param1:int) : void
      {
         _segmentsW = param1;
         removeAllSegments();
         invalidateGeometry();
      }
      
      public function get segmentsH() : int
      {
         return _segmentsH;
      }
      
      public function set segmentsH(param1:int) : void
      {
         _segmentsH = param1;
         removeAllSegments();
         invalidateGeometry();
      }
      
      override protected function buildGeometry() : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:Vector3D = new Vector3D();
         var _loc1_:Vector3D = new Vector3D();
         var _loc5_:Number = _width * 0.5;
         var _loc6_:Number = _height * 0.5;
         if(_orientation == "xy")
         {
            _loc3_.y = _loc6_;
            _loc3_.z = 0;
            _loc1_.y = -_loc6_;
            _loc1_.z = 0;
            _loc7_ = 0;
            while(_loc7_ <= _segmentsW)
            {
               var _loc8_:* = (_loc7_ / _segmentsW - 0.5) * _width;
               _loc1_.x = _loc8_;
               _loc3_.x = _loc8_;
               _loc4_++;
               updateOrAddSegment(_loc4_,_loc3_,_loc1_);
               _loc7_++;
            }
            _loc3_.x = -_loc5_;
            _loc1_.x = _loc5_;
            _loc2_ = 0;
            while(_loc2_ <= _segmentsH)
            {
               _loc8_ = (_loc2_ / _segmentsH - 0.5) * _height;
               _loc1_.y = _loc8_;
               _loc3_.y = _loc8_;
               _loc4_++;
               updateOrAddSegment(_loc4_,_loc3_,_loc1_);
               _loc2_++;
            }
         }
         else if(_orientation == "xz")
         {
            _loc3_.z = _loc6_;
            _loc3_.y = 0;
            _loc1_.z = -_loc6_;
            _loc1_.y = 0;
            _loc7_ = 0;
            while(_loc7_ <= _segmentsW)
            {
               _loc8_ = (_loc7_ / _segmentsW - 0.5) * _width;
               _loc1_.x = _loc8_;
               _loc3_.x = _loc8_;
               _loc4_++;
               updateOrAddSegment(_loc4_,_loc3_,_loc1_);
               _loc7_++;
            }
            _loc3_.x = -_loc5_;
            _loc1_.x = _loc5_;
            _loc2_ = 0;
            while(_loc2_ <= _segmentsH)
            {
               _loc8_ = (_loc2_ / _segmentsH - 0.5) * _height;
               _loc1_.z = _loc8_;
               _loc3_.z = _loc8_;
               _loc4_++;
               updateOrAddSegment(_loc4_,_loc3_,_loc1_);
               _loc2_++;
            }
         }
         else if(_orientation == "yz")
         {
            _loc3_.y = _loc6_;
            _loc3_.x = 0;
            _loc1_.y = -_loc6_;
            _loc1_.x = 0;
            _loc7_ = 0;
            while(_loc7_ <= _segmentsW)
            {
               _loc8_ = (_loc7_ / _segmentsW - 0.5) * _width;
               _loc1_.z = _loc8_;
               _loc3_.z = _loc8_;
               _loc4_++;
               updateOrAddSegment(_loc4_,_loc3_,_loc1_);
               _loc7_++;
            }
            _loc3_.z = _loc5_;
            _loc1_.z = -_loc5_;
            _loc2_ = 0;
            while(_loc2_ <= _segmentsH)
            {
               _loc8_ = (_loc2_ / _segmentsH - 0.5) * _height;
               _loc1_.y = _loc8_;
               _loc3_.y = _loc8_;
               _loc4_++;
               updateOrAddSegment(_loc4_,_loc3_,_loc1_);
               _loc2_++;
            }
         }
      }
   }
}
