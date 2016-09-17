package org.specter3d.events
{
   import flash.events.Event;
   import flash.geom.Vector3D;
   
   public class Specter3DMouseEvent extends Event
   {
      
      public static const MOUSE_DOWN:String = "specter3d_mouse_down";
      
      public static const MOUSE_UP:String = "specter3d_mouse_up";
      
      public static const MOUSE_OVER:String = "specter3d_mouse_over";
      
      public static const MOUSE_OUT:String = "specter3d_mouse_out";
      
      public static const MOUSE_MOVE:String = "specter3d_mouse_move";
      
      public static const MOUSE_CLICK:String = "specter3d_mouse_click";
      
      public static const MOUSE_RIGHT_CLICK:String = "specter3d_mouse_right_click";
      
      public static const MOUSE_DOUBLE_CLICK:String = "specter3d_mouse_double_click";
      
      public static const MOUSE_WHEEL:String = "specter3d_mouse_wheel";
       
      
      private var _localPosition:Vector3D;
      
      public function Specter3DMouseEvent(param1:String, param2:Vector3D, param3:Boolean = false, param4:Boolean = false)
      {
         _localPosition = param2;
         super(param1,param3,param4);
      }
      
      public function get localPosition() : Vector3D
      {
         return _localPosition;
      }
   }
}
