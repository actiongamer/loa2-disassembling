package away3d.primitives
{
   import away3d.entities.SegmentSet;
   import away3d.cameras.Camera3D;
   import away3d.bounds.BoundingVolumeBase;
   import away3d.errors.AbstractMethodError;
   import flash.geom.Vector3D;
   import away3d.primitives.data.Segment;
   import §away3d:arcane§._ancestorsAllowMouseEnabled;
   
   public class WireframePrimitiveBase extends SegmentSet
   {
       
      
      private var _geomDirty:Boolean = true;
      
      private var _color:uint;
      
      private var _thickness:Number;
      
      public function WireframePrimitiveBase(param1:uint = 16777215, param2:Number = 1)
      {
         super();
         if(param2 <= 0)
         {
            param2 = 1;
         }
         _color = param1;
         _thickness = param2;
         mouseChildren = false;
         mouseEnabled = false;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function set color(param1:uint) : void
      {
         var _loc3_:int = 0;
         var _loc2_:uint = _segments.length;
         _color = param1;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var _loc4_:* = param1;
            _segments[_loc3_].endColor = _loc4_;
            _segments[_loc3_].startColor = _loc4_;
            _loc3_++;
         }
      }
      
      public function get thickness() : Number
      {
         return _thickness;
      }
      
      public function set thickness(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc2_:uint = _segments.length;
         _thickness = param1;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var _loc4_:* = param1;
            _segments[_loc3_].thickness = _loc4_;
            _segments[_loc3_].thickness = _loc4_;
            _loc3_++;
         }
      }
      
      override public function removeAllSegments() : void
      {
         super.removeAllSegments();
      }
      
      override public function pushModelViewProjection(param1:Camera3D, param2:Boolean = true) : void
      {
         if(_geomDirty)
         {
            updateGeometry();
         }
         super.pushModelViewProjection(param1,param2);
      }
      
      override public function get bounds() : BoundingVolumeBase
      {
         if(_geomDirty)
         {
            updateGeometry();
         }
         return super.bounds;
      }
      
      protected function buildGeometry() : void
      {
         throw new AbstractMethodError();
      }
      
      protected function invalidateGeometry() : void
      {
         _geomDirty = true;
         invalidateBounds();
      }
      
      private function updateGeometry() : void
      {
         buildGeometry();
         _geomDirty = false;
      }
      
      protected function updateOrAddSegment(param1:uint, param2:Vector3D, param3:Vector3D) : void
      {
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(_segments.length > param1)
         {
            _loc6_ = _segments[param1];
            _loc5_ = _loc6_.start;
            _loc4_ = _loc6_.end;
            _loc5_.x = param2.x;
            _loc5_.y = param2.y;
            _loc5_.z = param2.z;
            _loc4_.x = param3.x;
            _loc4_.y = param3.y;
            _loc4_.z = param3.z;
            _segments[param1].updateSegment(_loc5_,_loc4_,null,_color,_color,_thickness);
         }
         else
         {
            addSegment(new LineSegment(param2.clone(),param3.clone(),_color,_color,_thickness));
         }
      }
      
      override protected function updateMouseChildren() : void
      {
         _ancestorsAllowMouseEnabled = false;
      }
   }
}
