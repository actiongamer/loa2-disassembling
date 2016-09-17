package away3d.primitives.data
{
   import away3d.entities.SegmentSet;
   import flash.geom.Vector3D;
   import §away3d:arcane§._start;
   import §away3d:arcane§._end;
   import §away3d:arcane§._thickness;
   import §away3d:arcane§._startR;
   import §away3d:arcane§._startG;
   import §away3d:arcane§._startB;
   import §away3d:arcane§._endR;
   import §away3d:arcane§._endG;
   import §away3d:arcane§._endB;
   import §away3d:arcane§._segmentsBase;
   
   public class Segment
   {
       
      
      var _segmentsBase:SegmentSet;
      
      var _thickness:Number;
      
      var _start:Vector3D;
      
      var _end:Vector3D;
      
      var _startR:Number;
      
      var _startG:Number;
      
      var _startB:Number;
      
      var _endR:Number;
      
      var _endG:Number;
      
      var _endB:Number;
      
      private var _index:int = -1;
      
      private var _subSetIndex:int = -1;
      
      private var _startColor:uint;
      
      private var _endColor:uint;
      
      public function Segment(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:uint = 3355443, param5:uint = 3355443, param6:Number = 1)
      {
         super();
         param3 = null;
         _thickness = param6 * 0.5;
         _start = param1;
         _end = param2;
         startColor = param4;
         endColor = param5;
      }
      
      public function updateSegment(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:uint = 3355443, param5:uint = 3355443, param6:Number = 1) : void
      {
         param3 = null;
         _start = param1;
         _end = param2;
         if(_startColor != param4)
         {
            startColor = param4;
         }
         if(_endColor != param5)
         {
            endColor = param5;
         }
         _thickness = param6 * 0.5;
         update();
      }
      
      public function get start() : Vector3D
      {
         return _start;
      }
      
      public function set start(param1:Vector3D) : void
      {
         _start = param1;
         update();
      }
      
      public function get end() : Vector3D
      {
         return _end;
      }
      
      public function set end(param1:Vector3D) : void
      {
         _end = param1;
         update();
      }
      
      public function get thickness() : Number
      {
         return _thickness * 2;
      }
      
      public function set thickness(param1:Number) : void
      {
         _thickness = param1 * 0.5;
         update();
      }
      
      public function get startColor() : uint
      {
         return _startColor;
      }
      
      public function set startColor(param1:uint) : void
      {
         _startR = (param1 >> 16 & 255) / 255;
         _startG = (param1 >> 8 & 255) / 255;
         _startB = (param1 & 255) / 255;
         _startColor = param1;
         update();
      }
      
      public function get endColor() : uint
      {
         return _endColor;
      }
      
      public function set endColor(param1:uint) : void
      {
         _endR = (param1 >> 16 & 255) / 255;
         _endG = (param1 >> 8 & 255) / 255;
         _endB = (param1 & 255) / 255;
         _endColor = param1;
         update();
      }
      
      public function dispose() : void
      {
         _start = null;
         _end = null;
      }
      
      function get index() : int
      {
         return _index;
      }
      
      function set index(param1:int) : void
      {
         _index = param1;
      }
      
      function get subSetIndex() : int
      {
         return _subSetIndex;
      }
      
      function set subSetIndex(param1:int) : void
      {
         _subSetIndex = param1;
      }
      
      function set segmentsBase(param1:SegmentSet) : void
      {
         _segmentsBase = param1;
      }
      
      private function update() : void
      {
         if(!_segmentsBase)
         {
            return;
         }
         _segmentsBase.updateSegment(this);
      }
   }
}
