package away3d.core.base.data
{
   public class Vertex
   {
       
      
      private var _x:Number;
      
      private var _y:Number;
      
      private var _z:Number;
      
      private var _index:uint;
      
      public function Vertex(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:uint = 0)
      {
         super();
         _x = param1;
         _y = param2;
         _z = param3;
         _index = param4;
      }
      
      public function set index(param1:uint) : void
      {
         _index = param1;
      }
      
      public function get index() : uint
      {
         return _index;
      }
      
      public function get x() : Number
      {
         return _x;
      }
      
      public function set x(param1:Number) : void
      {
         _x = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set y(param1:Number) : void
      {
         _y = param1;
      }
      
      public function get z() : Number
      {
         return _z;
      }
      
      public function set z(param1:Number) : void
      {
         _z = param1;
      }
      
      public function clone() : Vertex
      {
         return new Vertex(_x,_y,_z);
      }
      
      public function toString() : String
      {
         return _x + "," + _y + "," + _z;
      }
   }
}
