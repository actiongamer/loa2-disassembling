package away3d.debug.data
{
   import away3d.entities.SegmentSet;
   import flash.geom.Vector3D;
   import away3d.primitives.LineSegment;
   
   public class TridentLines extends SegmentSet
   {
       
      
      public function TridentLines(param1:Vector.<Vector.<Vector3D>>, param2:Vector.<uint>)
      {
         super();
         build(param1,param2);
      }
      
      private function build(param1:Vector.<Vector.<Vector3D>>, param2:Vector.<uint>) : void
      {
         var _loc6_:* = undefined;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         _loc8_ = uint(0);
         while(_loc8_ < param1.length)
         {
            _loc5_ = uint(param2[_loc8_]);
            _loc6_ = param1[_loc8_];
            _loc7_ = uint(0);
            while(_loc7_ < _loc6_.length)
            {
               _loc4_ = _loc6_[_loc7_];
               _loc3_ = _loc6_[_loc7_ + 1];
               addSegment(new LineSegment(_loc4_,_loc3_,_loc5_,_loc5_,1));
               _loc7_ = uint(_loc7_ + 2);
            }
            _loc8_++;
         }
      }
   }
}
