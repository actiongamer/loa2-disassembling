package away3d.core.base.data
{
   public class UV
   {
       
      
      private var _u:Number;
      
      private var _v:Number;
      
      public function UV(param1:Number = 0, param2:Number = 0)
      {
         super();
         _u = param1;
         _v = param2;
      }
      
      public function get v() : Number
      {
         return _v;
      }
      
      public function set v(param1:Number) : void
      {
         _v = param1;
      }
      
      public function get u() : Number
      {
         return _u;
      }
      
      public function set u(param1:Number) : void
      {
         _u = param1;
      }
      
      public function clone() : UV
      {
         return new UV(_u,_v);
      }
      
      public function toString() : String
      {
         return _u + "," + _v;
      }
   }
}
