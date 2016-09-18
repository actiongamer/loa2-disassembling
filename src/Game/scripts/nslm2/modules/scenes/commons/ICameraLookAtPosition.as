package nslm2.modules.scenes.commons
{
   import flash.geom.Point;
   
   public interface ICameraLookAtPosition
   {
       
      
      function get lookAtPos2d() : Point;
      
      function set lookAtPos2d(param1:Point) : void;
      
      function setLookAtPos2d(param1:Point, param2:Boolean) : void;
      
      function get canTweenCamera() : Boolean;
      
      function set canTweenCamera(param1:Boolean) : void;
      
      function set cameraScale(param1:Number) : void;
      
      function get cameraScale() : Number;
   }
}
