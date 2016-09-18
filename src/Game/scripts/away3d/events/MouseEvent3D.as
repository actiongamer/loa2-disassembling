package away3d.events
{
   import flash.events.Event;
   import away3d.containers.View3D;
   import away3d.containers.ObjectContainer3D;
   import away3d.core.base.IRenderable;
   import away3d.materials.MaterialBase;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import away3d.core.math.Matrix3DUtils;
   
   public class MouseEvent3D extends Event
   {
      
      public static const MOUSE_OVER:String = "mouseOver3d";
      
      public static const MOUSE_OUT:String = "mouseOut3d";
      
      public static const MOUSE_UP:String = "mouseUp3d";
      
      public static const RIGHT_MOUSE_UP:String = "rightMouseUp3d";
      
      public static const MOUSE_DOWN:String = "mouseDown3d";
      
      public static const RIGHT_MOUSE_DOWN:String = "rightMouseDown3d";
      
      public static const MOUSE_MOVE:String = "mouseMove3d";
      
      public static const CLICK:String = "click3d";
      
      public static const Right_CLICK:String = "rightClick3d";
      
      public static const DOUBLE_CLICK:String = "doubleClick3d";
      
      public static const MOUSE_WHEEL:String = "mouseWheel3d";
       
      
      private var _propagataionStopped:Boolean;
      
      public var screenX:Number;
      
      public var screenY:Number;
      
      public var view:View3D;
      
      public var object:ObjectContainer3D;
      
      public var renderable:IRenderable;
      
      public var material:MaterialBase;
      
      public var uv:Point;
      
      public var localPosition:Vector3D;
      
      public var localNormal:Vector3D;
      
      public var ctrlKey:Boolean;
      
      public var altKey:Boolean;
      
      public var shiftKey:Boolean;
      
      public var delta:int;
      
      public function MouseEvent3D(param1:String)
      {
         super(param1,true,true);
      }
      
      override public function get bubbles() : Boolean
      {
         return super.bubbles && !_propagataionStopped;
      }
      
      override public function stopPropagation() : void
      {
         super.stopPropagation();
         _propagataionStopped = true;
      }
      
      override public function stopImmediatePropagation() : void
      {
         super.stopImmediatePropagation();
         _propagataionStopped = true;
      }
      
      override public function clone() : Event
      {
         var _loc1_:MouseEvent3D = new MouseEvent3D(type);
         if(isDefaultPrevented())
         {
            _loc1_.preventDefault();
         }
         _loc1_.screenX = screenX;
         _loc1_.screenY = screenY;
         _loc1_.view = view;
         _loc1_.object = object;
         _loc1_.renderable = renderable;
         _loc1_.material = material;
         _loc1_.uv = uv;
         _loc1_.localPosition = localPosition;
         _loc1_.localNormal = localNormal;
         _loc1_.ctrlKey = ctrlKey;
         _loc1_.shiftKey = shiftKey;
         return _loc1_;
      }
      
      public function get scenePosition() : Vector3D
      {
         if(object is ObjectContainer3D)
         {
            return Matrix3DUtils.transformVector(ObjectContainer3D(object).sceneTransform,localPosition);
         }
         return localPosition;
      }
      
      public function get sceneNormal() : Vector3D
      {
         var _loc1_:* = null;
         if(object is ObjectContainer3D)
         {
            _loc1_ = ObjectContainer3D(object).sceneTransform.deltaTransformVector(localNormal);
            _loc1_.normalize();
            return _loc1_;
         }
         return localNormal;
      }
   }
}
