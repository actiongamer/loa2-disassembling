package away3d.materials.utils
{
   import away3d.materials.MaterialBase;
   
   public class MultipleMaterials
   {
       
      
      private var _left:MaterialBase;
      
      private var _right:MaterialBase;
      
      private var _bottom:MaterialBase;
      
      private var _top:MaterialBase;
      
      private var _front:MaterialBase;
      
      private var _back:MaterialBase;
      
      public function MultipleMaterials(param1:MaterialBase = null, param2:MaterialBase = null, param3:MaterialBase = null, param4:MaterialBase = null, param5:MaterialBase = null)
      {
         super();
         _left = param3;
         _right = param4;
         _bottom = bottom;
         _top = param5;
         _front = param1;
         _back = param2;
      }
      
      public function get left() : MaterialBase
      {
         return _left;
      }
      
      public function set left(param1:MaterialBase) : void
      {
         if(_left == param1)
         {
            return;
         }
         _left = param1;
      }
      
      public function get right() : MaterialBase
      {
         return _right;
      }
      
      public function set right(param1:MaterialBase) : void
      {
         if(_right == param1)
         {
            return;
         }
         _right = param1;
      }
      
      public function get bottom() : MaterialBase
      {
         return _bottom;
      }
      
      public function set bottom(param1:MaterialBase) : void
      {
         if(_bottom == param1)
         {
            return;
         }
         _bottom = param1;
      }
      
      public function get top() : MaterialBase
      {
         return _top;
      }
      
      public function set top(param1:MaterialBase) : void
      {
         if(_top == param1)
         {
            return;
         }
         _top = param1;
      }
      
      public function get front() : MaterialBase
      {
         return _front;
      }
      
      public function set front(param1:MaterialBase) : void
      {
         if(_front == param1)
         {
            return;
         }
         _front = param1;
      }
      
      public function get back() : MaterialBase
      {
         return _back;
      }
      
      public function set back(param1:MaterialBase) : void
      {
         if(_back == param1)
         {
            return;
         }
         _back = param1;
      }
   }
}
