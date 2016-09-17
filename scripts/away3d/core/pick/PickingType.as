package away3d.core.pick
{
   public class PickingType
   {
      
      public static const SHADER:away3d.core.pick.IPicker = new ShaderPicker();
      
      public static const RAYCAST_FIRST_ENCOUNTERED:away3d.core.pick.IPicker = new RaycastPicker(false);
      
      public static const RAYCAST_BEST_HIT:away3d.core.pick.IPicker = new RaycastPicker(true);
       
      
      public function PickingType()
      {
         super();
      }
   }
}
