package away3d.events
{
   import flash.events.Event;
   import away3d.core.base.Object3D;
   
   public class Object3DEvent extends Event
   {
      
      public static const IS_RENDERING:String = "is_rendering";
      
      public static const VISIBLITY_UPDATED:String = "visiblityUpdated";
      
      public static const SCENETRANSFORM_CHANGED:String = "scenetransformChanged";
      
      public static const SCENE_CHANGED:String = "sceneChanged";
      
      public static const POSITION_CHANGED:String = "positionChanged";
      
      public static const ROTATION_CHANGED:String = "rotationChanged";
      
      public static const SCALE_CHANGED:String = "scaleChanged";
      
      public static const JOINTS_EXCEED_LIMIT:String = "joints_exceed_limit";
       
      
      public var object:Object3D;
      
      public var data:Object;
      
      public function Object3DEvent(param1:String, param2:Object3D)
      {
         super(param1);
         this.object = param2;
      }
      
      override public function clone() : Event
      {
         return new Object3DEvent(type,object);
      }
   }
}
