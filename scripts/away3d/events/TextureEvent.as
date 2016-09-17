package away3d.events
{
   import flash.events.Event;
   
   public class TextureEvent extends Event
   {
      
      public static const UPLOAD_TEXTURE_COMPLETE:String = "upload_texture_complete";
       
      
      public function TextureEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
